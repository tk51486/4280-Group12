module MemController(
    input [19:0] SendMem,
    input memFlag,
    input clk_mem,
    input clk_cpu,
    input pll_locked,
    input CPU_RESETN,
    
    output wire [15:0] LED,

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
    integer waitCounter;
    integer lightCounter;
    initial lights = 16'b0000000000000000;
    initial waitCounter = 0;
    initial lightCounter = 0;
    //////////  Clock Generation  //////////
    
    //assign LED[15:0] = lights;
    //////////  Reset Sync/Stretch  //////////
    reg[31:0] rst_stretch = 32'hFFFFFFFF;
    wire reset_req_n, rst_n;

    assign reset_req_n = ~CPU_RESETN & pll_locked;

    always @(posedge clk_cpu) rst_stretch = {reset_req_n,rst_stretch[31:1]};
    assign rst_n = reset_req_n & &rst_stretch;

    //////////  DUT  //////////
    wire[63:0] mem_d_from_ram;
    wire mem_transaction_complete;
    wire mem_ready;
    
    reg[27:0] mem_addr;
    reg[63:0] mem_d_to_ram;
    reg[1:0] mem_transaction_width;
    reg mem_wstrobe, mem_rstrobe;
    
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

    //////////  Traffic Generator  //////////
    reg[31:0] lfsr;
    reg i;
    initial i = 0;

    always @(posedge clk_cpu or negedge rst_n) begin
        if(~rst_n) lfsr <= 32'h0;
        else begin
            if (i == 0) begin
                lfsr <= 32'h01010101;
                i <= i + 1;
            end else if (i == 1) begin
                lfsr <= 32'h02020202;
                i <= i + 1;
            end else if (i == 2) begin
                lfsr <= 32'h03030303;
                i <= 0;
            end
            //lfsr[31:1] <= lfsr[30:0];
            //lfsr[0] <= ~^{lfsr[31], lfsr[21], lfsr[1:0]};
        end
    end

    localparam TGEN_GEN_AD = 3'h0; 
    localparam TGEN_WRITE  = 3'h1;
    localparam TGEN_WWAIT  = 3'h2;
    localparam TGEN_READ   = 3'h3;
    localparam TGEN_RWAIT  = 3'h4;
    localparam TGEN_STOP   = 3'h5;
        
    reg[2:0] tgen_state;
    reg dequ; //Data read from RAM equals data written
        
    always @(posedge clk_cpu) begin //or negedge rst_n
        if(~rst_n == 1) begin
            lights <= 16'b0101010101010101;
            tgen_state <= TGEN_GEN_AD;
            mem_rstrobe <= 1'b0;
            mem_wstrobe <= 1'b0;
            mem_addr <= 28'h0101010;
            mem_d_to_ram <= 28'h0;
            mem_transaction_width <= 3'h0;
            dequ <= 1'b0;
        end else begin
            case(tgen_state)
            TGEN_GEN_AD: begin
                    if (memFlag == 1) begin
                        lights <= SendMem[15:0];
                        //lights <= 16'b1100110011001100;
                        mem_addr <= 28'h0101010;
                        mem_d_to_ram <= SendMem;
                        tgen_state <= TGEN_WRITE;
                    end 
                end
            TGEN_WRITE: begin
                    if(mem_ready) begin
                        mem_wstrobe <= 1;
                        //Write the entire 64-bit word
                        mem_transaction_width <= `RAM_WIDTH32;
                        tgen_state <= TGEN_WWAIT;
                    end
                end
            TGEN_WWAIT: begin
                    mem_wstrobe <= 0;
                    if(mem_transaction_complete) begin
                        tgen_state <= TGEN_READ;
                    end
                end
            TGEN_READ: begin
                    if(mem_ready) begin
                        mem_rstrobe <= 1;
                        //Load only the single byte at that address
                        mem_transaction_width <= `RAM_WIDTH32;
                        tgen_state <= TGEN_RWAIT;
                    end
                end
            TGEN_RWAIT: begin
                    mem_rstrobe <= 0;
                    if(mem_transaction_complete) begin
                       lights <= mem_d_from_ram[63:48];
                       //lights <= 16'b1111111111111111;
                    end
                end
            TGEN_STOP: begin
                end
            endcase
        end
    end 
endmodule