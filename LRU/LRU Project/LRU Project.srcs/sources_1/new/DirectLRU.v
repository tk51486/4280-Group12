`timescale 1ns / 1ps

module DirectLRU(
    
    input clk,
    
    input [16:0] LRUTag,
    input [10:0] LRUIndex,
    input LRULoadStore,
    input [20:0] LRUInst,
    input LRULineReady, 

    input clk_mem,
    input clk_cpu,
    input pll_locked,
    input CPU_RESETN,
    
    output wire [15:0] led,
    
    //to stat tracker
    output reg [1:0] accesses,
    output reg eviction,
    output reg write,
    output reg hit,
    output reg processed,

    //RAM Interface
    inout[15:0] ddr2_dq,
    inout[1:0] ddr2_dqs_n,
    inout[1:0] ddr2_dqs_p,
    output[12:0] ddr2_addr,
    output[2:0] ddr2_ba,
    output ddr2_ras_n,
    output ddr2_cas_n,
    output ddr2_we_n,
    output ddr2_ck_p,
    output ddr2_ck_n,
    output ddr2_cke,
    output ddr2_cs_n,
    output[1:0] ddr2_dm,
    output ddr2_odt
    );
    
    reg [27:0] ram_addr, ram_addr_next;
    reg [63:0] line_to_ram;
    wire [63:0] line_from_ram;
    wire ram_transaction_complete, ram_ready;
    reg ram_loadstore, ram_start;  //sent to ram
    
    reg [15:0] debugLED;
    assign led[15:0] = debugLED;
    reg walloc;
    
    MemController u_MemController(
        .clk_mem(clk_mem),
        .clk_cpu(clk_cpu),
        .pll_locked(pll_locked),
        .CPU_RESETN(CPU_RESETN),
        //.LED(led),
        .loadstore(ram_loadstore),
        .start(ram_start),
        .mem_addr(ram_addr),
        .mem_d_to_ram(line_to_ram),
        .mem_d_from_ram(line_from_ram),
        .mem_transaction_complete(ram_transaction_complete),
        .mem_ready(ram_ready),
        .ddr2_dq(ddr2_dq),
        .ddr2_dqs_n(ddr2_dqs_n),
        .ddr2_dqs_p(ddr2_dqs_p),
        .ddr2_addr(ddr2_addr),
        .ddr2_ba(ddr2_ba),
        .ddr2_ras_n(ddr2_ras_n),
        .ddr2_cas_n(ddr2_cas_n),
        .ddr2_we_n(ddr2_we_n),
        .ddr2_ck_p(ddr2_ck_p),
        .ddr2_ck_n(ddr2_ck_n),
        .ddr2_cke(ddr2_cke),
        .ddr2_cs_n(ddr2_cs_n),
        .ddr2_dm(ddr2_dm),
        .ddr2_odt(ddr2_odt)
    );
    
    localparam LRU_INIT = 3'h0;
    localparam LRU_IDLE = 3'h1;
    localparam LRU_READRAM = 3'h2;
    localparam LRU_PROCESS = 3'h3;
    localparam LRU_UPDATERAM = 3'h4;
    localparam LRU_WAIT = 3'h5;
    reg [2:0] lru_state, next_state;
    reg initializing, init_next; //used to initialize RAM
    
    initial begin
        ram_loadstore = 0;
        ram_start = 0;
        ram_addr = {11'b0, 17'b0};
        ram_addr_next = 28'h0;
        line_to_ram = 64'hcdcdffff;//a5a5
        debugLED = 16'h0000;
        initializing = 1;
        init_next = 1;
        walloc = 1;
    end
    
    //state register
    always @(posedge clk) begin
        lru_state <= next_state;
        ram_addr <= ram_addr_next;
        initializing <= init_next;
    end
    
    //next-state logic
    always @(*) begin
        //debugLED = lru_state;
        debugLED[15:0] = LRUIndex;
        next_state = lru_state;
        ram_addr_next = ram_addr;
        init_next = initializing;
        
        case(lru_state)
            LRU_INIT: begin
                if (ram_ready) begin
                    if (initializing == 0) begin //initialization done
                        next_state = LRU_READRAM;  //wait for first cache instruction
                    end else begin
                        next_state = LRU_UPDATERAM; //clear current address
                    end
                end
            end
            LRU_IDLE: begin
                //debugLED = line_from_ram[63:48];
                if (LRULineReady) begin
                    ram_addr_next = {LRUIndex, 17'b0};
                    next_state = LRU_READRAM;
                end
            end
            LRU_READRAM: begin
                if (~ram_transaction_complete) begin //start read
                    ram_start = 1;
                    ram_loadstore = 0;
                end else begin
                    ram_start = 0;
                    next_state = LRU_PROCESS;  //wait for read to finish
                end
            end
            LRU_PROCESS: begin
                if (~ram_transaction_complete) begin //wait until flag is cleared
                    next_state = LRU_UPDATERAM;
                    line_to_ram[63:45] = {1'b1, LRULoadStore, LRUTag}; //will be written to RAM (maybe)
                    processed = 1;
                    if (~line_from_ram[63] || LRUTag != line_from_ram[61:45]) begin //miss, valid = 0 || no tag match
                        if(LRULoadStore) begin   //write miss
                            accesses = 1;
                            if (~walloc) begin
                                next_state = LRU_WAIT;
                            end else if (line_from_ram[62]) begin //dirty eviction (write)
                                eviction = 1;
                                accesses = 2;
                            end
                            write = 1;
                        end else begin  //read miss
                            accesses = 1;
                            if (line_from_ram[62]) begin //dirty eviction (read)
                                eviction = 1;
                                accesses = 2;
                            end
                            write = 0;
                        end
                        hit = 0;
                    end else begin //hit
                        if (LRULoadStore) begin //write hit
                            write = 1;
                        end else begin  //read hit
                            write = 0;
                        end
                        hit = 1;
                        accesses = 0;
                    end
                end
            end
            LRU_UPDATERAM: begin
                if (~ram_transaction_complete ) begin //start write
                    ram_start = 1;
                    ram_loadstore = 1;
                end else begin
                    ram_start = 0;
                    next_state = LRU_WAIT;  //wait for write to finish
                end
            end
            LRU_WAIT: begin
                if (initializing) begin 
                    if (ram_addr[27:17] == 2047) begin    //RAM has been cleared
                        init_next = 0;
                    end else begin  //if not, increment address
                        ram_addr_next = ram_addr + {11'b1, 17'b0};
                    end
                    next_state = LRU_INIT;
                end else begin //just updated cache
                    next_state = LRU_IDLE;
                end
            end
            default: next_state = LRU_INIT;
    endcase
    end
    
endmodule
