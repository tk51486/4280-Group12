`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 08:17:02 PM
// Design Name: 
// Module Name: supertop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module supertop(
        input  wire         clk100mhz,
        input  wire         resetn,
        output wire         sdcard_pwr_n,
        output wire         sdclk,
        inout               sdcmd,
        input  wire         sddat0,
        output wire         sddat1, sddat2, sddat3,
        output wire [15:0]  led,
        output wire         uart_tx,
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
    wire [63:0] CurrNum;
    wire CurrFlag;
    wire [63:0] SendMem;
    wire memFlag;
    reg [10:0] bufIt;
    initial bufIt = 0;
    reg [63:0] memS;
    reg memF;
    assign SendMem = memS;
    assign memFlag = memF;
    initial memF = 0;
    initial memS = 0;
    wire clk_cpu, clk_mem, clk_sd;
    wire pll_locked;
    wire resetn;
    reg [7:0] enables;
    reg [2:0] start;
    initial start = 0;
    assign led[7:0] = enables;
    reg [34:0] count;
    initial count = 0;

    pll pll1(
        .resetn(resetn),
        .locked(pll_locked),
        .clk_in(clk100mhz),
        .clk_mem(clk_mem), //200MHz Memory Reference Clock
        .clk_sd(clk_sd), 
        .clk_cpu(clk_cpu)  //Clock used for traffic generator
        );
fpga_top u_fpga_top(
        .CurrNum(CurrNum),
        .CurrFlag(CurrFlag),
        .clk_sd(clk_sd),
        .rstn(pll_locked),
        .resetn(resetn),
        .sdcard_pwr_n(sdcard_pwr_n),
        .sdclk(sdclk),
        .sdcmd(sdcmd),
        .sddat0(sddat0),
        .sddat1(sddat1),
        .sddat2(sddat2),
        .sddat3(sddat3),
        .led(led),
        .uart_tx(uart_tx)
    );
    mig_example_top u_mig_example_top(
        .SendMem(SendMem),
        .memFlag(memFlag),
        .clk_mem(clk_mem),
        .clk_cpu(clk_cpu),
        .pll_locked(pll_locked),
        .CPU_RESETN(CPU_RESETN),
        .LED(led),
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
always@(posedge clk100mhz) begin
    if(start == 1)begin
    if(bufIt < 8)begin
        if(count > 500000000)begin
            if(CurrFlag == 1)begin
                enables = CurrNum[7:0];
                count = 0;
                memS = SendMem + (CurrNum << bufIt*8);
                bufIt = bufIt + 1;
               
                if(bufIt == 8)begin
                    memF = 1;
                    enables = 8'b11111111;
                    bufIt = 111;
                    start = 2;
                end
            end
            //bufIt = bufIt+1;
        end
        end
        count = count + 1;
    end
    if(CurrNum != 0)begin
        start = 1;
    end
    //count = count + 1;
end 
    /*
     SendMem = (CurrNum << bufIt*8);
    bufIt = bufIt + 1;
   
    if(bufIt == 8)begin
        memFlag = 1;
        bufIt = 0;
    end
    */
    //Array_Manipulation u_Array_Manipulation(
    //    
    //);
endmodule
