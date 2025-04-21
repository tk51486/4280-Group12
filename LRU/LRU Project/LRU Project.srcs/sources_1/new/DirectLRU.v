`timescale 1ns / 1ps

module DirectLRU(
    
    input clk,
    
    input [16:0] LRUTag,
    input [10:0] LRUIndex,
    input LRULoadStore,
    input [20:0] LRUInst,
    input LRULineReady, //1 will start the fsm

    input clk_mem,
    input clk_cpu,
    input pll_locked,
    input CPU_RESETN,
    
    output wire [15:0] led,

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
    assign led = debugLED;
    
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
    reg [10:0] counter; //used to initialize RAM
    reg initializing;
    
    initial begin
        ram_loadstore = 0;
        ram_start = 0;
        ram_addr = 28'h0;
        ram_addr_next = 28'h0;
        line_to_ram = 64'hababffff;//a7a7
        debugLED = 0;
        counter = 0;
        initializing = 1;
        //lru_state = LRU_INIT;
    end
    
    //state register
    always @(posedge clk) begin
        lru_state <= next_state;
        ram_addr <= ram_addr_next;
    end
    
    //next-state logic
    always @(*) begin
        debugLED[15:13] = lru_state;
        next_state = lru_state;
        ram_addr_next = ram_addr;
        
        case(lru_state)
            LRU_INIT: begin
                ram_start = 0;
                if (ram_addr == 1) begin //RAM has been cleared
                    initializing = 0;
                    next_state = LRU_IDLE;  //waiting for first line
                end else begin
                    next_state = LRU_UPDATERAM; //clear current address
                end
            end
            LRU_IDLE: begin
                debugLED[10:0] = ram_addr[10:0];
            end
            LRU_READRAM: begin
                
            end
            LRU_PROCESS: begin
                
            end
            LRU_UPDATERAM: begin
                ram_start = 1;
                ram_loadstore = 1;
                if (initializing) begin
                    ram_addr_next = ram_addr + 1;   //increment address
                end
                next_state = LRU_WAIT;  //wait for write to finish
            end
            LRU_WAIT: begin
                if (ram_ready) begin
                    debugLED[11] = 1;
                    next_state = LRU_INIT;
                end
                if (ram_transaction_complete) begin
                    debugLED[12] = 1;
                end 
            end
            default: next_state = LRU_INIT;
    endcase
    end
    
endmodule
