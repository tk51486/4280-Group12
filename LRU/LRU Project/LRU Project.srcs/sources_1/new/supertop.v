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
        input  wire         BTNL,
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
    wire [7:0] CurrNum;
    wire CurrFlag;
    reg [16:0] LRUTag; //pars
    initial LRUTag = 0;
    reg [10:0] LRUIndex;
    initial LRUIndex = 0;
    reg LRULoadStore;
    initial LRULoadStore = 0;
    reg [20:0] LRUInst;
    initial LRUInst = 0;
    reg [127:0] LRUParse;
    initial LRUParse = 0; 
    reg LRULineReady;
    initial LRULineReady = 0;
    reg [60:0] ParseIT;
    initial ParseIT = 0;
    reg [28:0] LRUAddr;
    initial LRUAddr = 0;//endpars
    reg [63:0] SendMem;
    reg memFlag;
    initial memFlag = 0;
    initial SendMem = 0;
    reg start;
    initial start = 0;
    wire clk_cpu, clk_mem, clk_sd;
    wire pll_locked;
    wire resetn;
    reg [15:0] debugLED;
    wire [15:0] emptyLED;
    assign led[15:0] = debugLED;
    reg [60:0] count;
    initial count = 0;
    reg [10:0] reads;
    initial reads = 0;
    
    pll pll1(
        .resetn(resetn),
        .locked(pll_locked),
        .clk_in(clk100mhz),
        .clk_mem(clk_mem), //200MHz Memory Reference Clock
        .clk_sd(clk_sd), 
        .clk_cpu(clk_cpu)  //Clock used for traffic generator
        );
fpga_top u_fpga_top(
        //.start(start),
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
        .LED(emptyLED),
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
always@(posedge CurrFlag) begin
    if(CurrNum != 8'h0a && LRULineReady != 1) begin
        LRUParse = LRUParse << 8;
        LRUParse = LRUParse + CurrNum;
        
        //debugLED[15:0] = LRUParse[31:16];
        
    end else begin
        LRULoadStore = LRUParse[104]; //parsing loadstore
        
        
        
        if(ParseIT < 7) begin  //parsing address
            LRUAddr = LRUAddr + LRUParse[83:80];
            if (LRUParse[87:84] == 4'b0110) begin //adjusting if it's a letter (hex char)
                LRUAddr = LRUParse[83:80] + 9;
            end
            LRUParse = LRUParse << 8;
            LRUAddr = LRUAddr << 4;
            ParseIT = ParseIT + 1; 
        end
        
        LRUTag = LRUAddr[27:11];
        LRUIndex = LRUAddr[10:0];
        
        if (~LRULoadStore) begin
            debugLED[15] = 1;
        end
        if (LRUTag == 20'h18033) begin
            debugLED[14] = 1;
        end
        if (LRUIndex == 12'h36c) begin
            debugLED[13] = 1;
        end
        debugLED[10:0] = LRUIndex;
        LRULineReady = 1;
    end
    
end

//    if(BTNL == 1)begin
//      start = 1;
//    end


endmodule
