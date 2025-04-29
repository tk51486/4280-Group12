`timescale 1ns / 1ps

module DirectLRU(

    //clock
    input clk,

    //each instruction, sent from SD to LRU
    input [16:0] LRUTag,
    input [10:0] LRUIndex,
    input LRULoadStore,
    input [20:0] LRUInst,
    input LRULineReady, 

    //for RAM
    input clk_mem,
    input clk_cpu,
    input pll_locked,
    input CPU_RESETN,

    //LEDs, used as a "progress bar"
    output wire [14:0] led,
    
    //to stat tracker
    output reg write,
    output reg hit,
    output reg [31:0] accessesTotal,
    output reg [31:0] evictionTotal,
    output reg [31:0] writeHitTotal,
    output reg [31:0] readHitTotal,
    output reg [31:0] writeMissTotal,
    output reg [31:0] readMissTotal,
    output reg [31:0] hitTotal,
    output reg [31:0] missTotal,

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

    //to RAM
    reg [27:0] ram_addr, ram_addr_next;
    reg [63:0] line_to_ram;
    reg ram_loadstore, ram_start;
    //from RAM
    wire [63:0] line_from_ram;
    wire ram_transaction_complete, ram_ready;

    //assigning progress bar
    assign led[14:0] = accessesTotal[20:6];

    //creating mem controller
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

    //definig stats and state registers
    localparam LRU_INIT = 3'h0;
    localparam LRU_IDLE = 3'h1;
    localparam LRU_READRAM = 3'h2;
    localparam LRU_PROCESS = 3'h3;
    localparam LRU_UPDATERAM = 3'h4;
    localparam LRU_WAIT = 3'h5;
    reg [2:0] lru_state, next_state, prev_state;
    //used to initialize RAM
    reg initializing, init_next; 
    
    initial begin
        ram_loadstore = 0;
        ram_start = 0;
        ram_addr = {11'b0, 17'b0};
        ram_addr_next = 28'h0;
        line_to_ram = 64'h0; //a5a5
        debugLED = 16'h0000;
        initializing = 1;
        init_next = 1;
        evictionTotal = 0;
    end

    //used to detect when stats should be incremented, only happens once per instruction
    wire increment = (prev_state != LRU_PROCESS && lru_state == LRU_PROCESS);
    
    //state register, assigning flops
    always @(posedge clk) begin
        prev_state <= lru_state;
        lru_state <= next_state;
        ram_addr <= ram_addr_next;
        initializing <= init_next;
    end
   
   //counter logic, increments stats
   always @(posedge clk) begin
       if (increment) begin //checks flag
            accessesTotal <= accessesTotal + 1; //increments every instruction
            if (~line_from_ram[63] || LRUTag != line_from_ram[61:45]) begin //miss, valid = 0 || no tag match
                if (line_from_ram[62]) begin //dirty eviction
                    evictionTotal <= evictionTotal + 1; //miss & dirty leads to eviction
                end
                if(LRULoadStore) begin //write miss
                    writeMissTotal <= writeMissTotal + 1;
                end else begin //read miss
                    readMissTotal <= readMissTotal + 1;
                end
                missTotal <= missTotal + 1;
            end else begin //hit
                if (LRULoadStore) begin //write hit
                    writeHitTotal <= writeHitTotal + 1;
                end else begin  //read hit
                    readHitTotal <= readHitTotal + 1;
                end
                hitTotal <= hitTotal + 1;
             end
        end
   end
    
    //next-state logic
    always @(*) begin
        //set LED values
        debugLED = evictionTotal[15:0];
        
        //default values for flops
        next_state = lru_state;
        ram_addr_next = ram_addr;
        init_next = initializing;
        
        case(lru_state)
            LRU_INIT: begin //initialize RAM by setting all relevant addresses to 64'b0
                if (ram_ready) begin //waits until RAM is ready internally
                    if (initializing == 0) begin //if initialization done,
                        next_state = LRU_READRAM;  //wait for first cache instruction
                    end else begin //otherwise,
                        next_state = LRU_UPDATERAM; //clear current address
                    end
                end
            end
            LRU_IDLE: begin //waits for each instruction to be parsed
                if (LRULineReady) begin //wait for ready flag from SD
                    ram_addr_next = {LRUIndex, 17'b0}; //change address to read from
                    next_state = LRU_READRAM; //read RAM
                end
            end
            LRU_READRAM: begin //sets flag to make MemController read from RAM 
                if (~ram_transaction_complete) begin //start read
                    ram_start = 1;
                    ram_loadstore = 0;
                end else begin //wait for transaction flag
                    ram_start = 0;
                    next_state = LRU_PROCESS;  //begin handling line
                end
            end
            LRU_PROCESS: begin //updates RAM if necessary
                if (~ram_transaction_complete) begin //wait until flag is cleared
                    next_state = LRU_WAIT; //default next state
                    
                    if (~line_from_ram[63] || LRUTag != line_from_ram[61:45]) begin //miss
                        if (line_from_ram[62]) begin //updating cache, maintain dirty
                            line_to_ram[31:13] = {1'b1, 0, LRUTag};
                        end else begin
                            line_to_ram[31:13] = {1'b1, line_from_ram[62], LRUTag};
                        end
                        next_state = LRU_UPDATERAM; //write to RAM if needed
                    end
                    if (LRULoadStore) begin //setting dirty on write
                        line_to_ram[30] = 1;
                        next_state = LRU_UPDATERAM; //write to RAM if needed
                    end
                end
            end
            LRU_UPDATERAM: begin //sets flag to make MemController write to RAM
                if (~ram_transaction_complete ) begin //start write
                    ram_start = 1;
                    ram_loadstore = 1;
                end else begin //wait for transaction flag
                    ram_start = 0;
                    next_state = LRU_WAIT;  //proceed to WAIT. necessary for initialization
                end
            end
            LRU_WAIT: begin //handle initialization, proceed to next state
                if (initializing) begin
                    if (ram_addr[27:17] == 2047) begin    //RAM has been cleared
                        init_next = 0; //stop initializing
                    end else begin  //if not, increment address
                        ram_addr_next = ram_addr + {11'b1, 17'b0}; //only using 2048 (2^11) addresses
                    end
                    next_state = LRU_INIT; //INIT will handle the next state
                end else begin //just updated cache
                    next_state = LRU_IDLE; //just begin waiting
                end
            end
            default: next_state = LRU_INIT; //default state
    endcase
    end
    
endmodule
