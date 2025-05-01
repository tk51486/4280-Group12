//this module calls mem_example, which is part of the DDR example and calls the mig IP. it receives instructions from
//the cache controller and sends strobes to the DDR example as required. several flags are passed up to DirectLRU for
//handshaking. the rest of the DDR example can be found in this folder, "RAM Code"

module MemController(
    input clk_mem,
    input clk_cpu,
    input pll_locked,
    input CPU_RESETN,
    
    output wire [15:0] LED,
    
    //from LRUDirect
    //is the RAM about to write or read
    input wire loadstore,
    //flag to send a strobe
    input wire start,
    input [27:0] mem_addr,
    input [63:0] mem_d_to_ram,
    
    //to LRUDirect
    output[63:0] mem_d_from_ram,
    output mem_transaction_complete,
    output mem_ready,

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

    `include "io_def.vh"   
    reg [15:0] lights;

    //existing reset stretch. seems to ensure the modules don't start until the RAM is physically ready
    //////////  Reset Sync/Stretch  //////////
    reg[31:0] rst_stretch = 32'hFFFFFFFF;
    wire reset_req_n, rst_n;

    assign reset_req_n = ~CPU_RESETN & pll_locked;

    always @(posedge clk_cpu) rst_stretch = {reset_req_n,rst_stretch[31:1]};
    assign rst_n = reset_req_n & &rst_stretch;
    
    mem_example mem_ex(
        .clk_mem(clk_mem),
        .rst_n(rst_n),

        .ddr2_addr(ddr2_addr),
        .ddr2_ba(ddr2_ba),
        .ddr2_cas_n(ddr2_cas_n),
        .ddr2_ck_n(ddr2_ck_n),
        .ddr2_ck_p(ddr2_ck_p),
        .ddr2_cke(ddr2_cke),
        .ddr2_ras_n(ddr2_ras_n),
        .ddr2_we_n(ddr2_we_n),
        .ddr2_dq(ddr2_dq),
        .ddr2_dqs_n(ddr2_dqs_n),
        .ddr2_dqs_p(ddr2_dqs_p),
        .ddr2_cs_n(ddr2_cs_n),
        .ddr2_dm(ddr2_dm),
        .ddr2_odt(ddr2_odt),

        .cpu_clk(clk_cpu),
        .addr(mem_addr),
        .width(mem_transaction_width),
        .data_in(mem_d_to_ram),
        .data_out(mem_d_from_ram),
        .rstrobe(mem_rstrobe),
        .wstrobe(mem_wstrobe),
        .transaction_complete(mem_transaction_complete),
        .ready(mem_ready)
        );

    //states and state registers
    localparam TGEN_IDLE = 3'h0; 
    localparam TGEN_WRITE  = 3'h1;
    localparam TGEN_WWAIT  = 3'h2;
    localparam TGEN_READ   = 3'h3;
    localparam TGEN_RWAIT  = 3'h4;
    localparam TGEN_STOP   = 3'h5;
    reg[2:0] tgen_state, next_state;

    //set to 32 bits throughout
    reg[1:0] mem_transaction_width;
    //read and write strobe that interact with mem_example
    reg mem_wstrobe, mem_rstrobe;
    
    initial begin
        lights = 0;
        mem_rstrobe = 0;
        mem_wstrobe = 0;
        mem_transaction_width = `RAM_WIDTH32;
    end

    //state register
    always @(posedge clk_cpu) begin
        tgen_state <= next_state;
    end    

    //next-state logic
    always @(posedge clk_cpu) begin //or negedge rst_n
        if(~rst_n == 1) begin
            next_state = TGEN_IDLE;
        end else begin
            case(tgen_state)
            TGEN_IDLE: begin //waiting for start flag
                if(start) begin
                    if(loadstore) begin //go to next state based on reading/writing
                        next_state = TGEN_WRITE;
                    end else begin
                        next_state = TGEN_READ;
                    end
                end
            end
            TGEN_WRITE: begin
                if(mem_ready) begin //if ram initialized, send strobe
                    mem_wstrobe = 1;
                    next_state = TGEN_WWAIT; \ 
                end
            end
            TGEN_WWAIT: begin
                mem_wstrobe = 0; //turn off strobe
                if(mem_transaction_complete) begin //wait for transaction flag
                    next_state = TGEN_IDLE; //wait until next start flag
                end
            end
            TGEN_READ: begin
                if(mem_ready) begin //if ram initialized, send strobe
                    mem_rstrobe = 1;
                    next_state = TGEN_RWAIT;
                end
            end
            TGEN_RWAIT: begin
                mem_rstrobe = 0; //turn off strobe
                if(mem_transaction_complete) begin
                   next_state = TGEN_IDLE;
                end
            end
            TGEN_STOP: begin //for debugging, unused
                lights = mem_d_from_ram[63:48];
            end
            default next_state = TGEN_IDLE; //default state
            endcase
        end
    end 
endmodule
