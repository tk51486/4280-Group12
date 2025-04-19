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
    reg [127:0] CurrentLine;
    initial CurrentLine = 0; 
    reg LRULineReady;
    initial LRULineReady = 0;
    reg [60:0] ParseIT;
    initial ParseIT = 0;
    reg [27:0] LRUAddr;
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
    if(~LRULineReady) begin
        if(CurrNum != 8'h0a) begin
                LRUParse = LRUParse << 8;
                LRUParse = LRUParse + CurrNum;
        end
        else begin
            LRULineReady = 1;
            //debugLED[15:8] = LRUParse[111:104];
            //debugLED[7:0] = LRUParse[7:0];
        end
    end
 end
    

always@(posedge clk100mhz) begin
    
    if(LRULineReady) begin
        
        if (count < 8) begin
            if(count == 0)begin
                CurrentLine = LRUParse;
                LRUInst = CurrentLine[3:0];    //parsing instruction count
                
                if(CurrentLine[119:112] !=  8'b0)begin
                    if(CurrentLine[127:120] != 8'b0) begin //three digit instruction count
                        LRUInst = LRUInst + (CurrentLine[19:16] * 100 + CurrentLine[11:8] * 10);
                        CurrentLine = CurrentLine >> 16;
                    end else begin                           //two digit instruction count
                        LRUInst = LRUInst + (CurrentLine[11:8] * 10);
                        CurrentLine = CurrentLine >> 8;
                    end
                end           
                
                LRULoadStore = CurrentLine[88]; //parsing loadstore
            end
            
            if(ParseIT < 7) begin  //parsing address
                LRUAddr = LRUAddr + CurrentLine[75:72];
                if (CurrentLine[79:76] == 4'b0110) begin //adjusting if it's a letter (hex char)
                    LRUAddr = LRUAddr + 9;
                end
                CurrentLine = CurrentLine << 8;
                LRUAddr = LRUAddr << 4;
                ParseIT = ParseIT + 1; 
            end
            if(count == 7)begin
                LRUTag = LRUAddr[27:11];
                LRUIndex = LRUAddr[10:0];
                
                if (~LRULoadStore) begin
                    debugLED[15] = 1;
                end
                if (LRUTag == 20'h18031) begin
                    debugLED[14] = 1;
                end
                if (LRUIndex == 12'h361) begin
                    debugLED[13] = 1;
                end
                
                debugLED[10:0] = LRUIndex;
            end
            count = count + 1;
        end
    end
end

endmodule
