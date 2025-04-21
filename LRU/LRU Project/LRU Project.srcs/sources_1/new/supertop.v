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
        //General
        input  wire         clk100mhz,
        input  wire         resetn,
        output wire [15:0]  led,
        //Pmod
        input  wire         BTNL,
        //SD
        output wire         sdcard_pwr_n,
        output wire         sdclk,
        inout               sdcmd,
        input  wire         sddat0,
        output wire         sddat1, sddat2, sddat3,
        output wire         uart_tx,
        //RAM
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
        //VGA
    );
    
    //from SD_Data_Decoder
    wire [16:0] LRUTag;
    wire [10:0] LRUIndex;
    wire LRULoadStore;
    wire [20:0] LRUInst;
    wire LRULineReady;
    
    reg start;
    
    //for pll (clk wiz)
    wire clk_cpu, clk_mem, clk_sd;
    wire pll_locked;
    wire resetn;
    
    reg [15:0] debugLED;
    wire [15:0] emptyLED;
    
    assign sdcard_pwr_n = 1'b0;                  // keep SDcard power-on
    assign {sddat1, sddat2, sddat3} = 3'b111;    // Must set sddat1~3 to 1 to avoid SD card from entering SPI mode
    
    initial begin
        start = 0;
    end
    
    pll pll1(
        .resetn(resetn),
        .locked(pll_locked),
        .clk_in(clk100mhz),
        .clk_mem(clk_mem), //200MHz Memory Reference Clock
        .clk_sd(clk_sd), 
        .clk_cpu(clk_cpu)  //Clock used for traffic generator
    );
        
    IO_Management u_IO_Management(
        //.start(start),
        .clk(clk100mhz),
        .led(emptyLED),
        
        .LRUTag(LRUTag),
        .LRUIndex(LRUIndex),
        .LRULoadStore(LRULoadStore),
        .LRUInst(LRUInst),
        .LRULineReady(LRULineReady),
        
        .clk_sd(clk_sd),
        .rstn(pll_locked),
        .resetn(resetn),
        .sdclk(sdclk),
        .sdcmd(sdcmd),
        .sddat0(sddat0),
        .uart_tx(uart_tx)
    );
    
    StatTracker u_StatTracker(
        
        .clk(clk100mhz),
        
        .LRUTag(LRUTag),
        .LRUIndex(LRUIndex),
        .LRULoadStore(LRULoadStore),
        .LRUInst(LRUInst),
        .LRULineReady(LRULineReady),
    
        .clk_mem(clk_mem),
        .clk_cpu(clk_cpu),
        .pll_locked(pll_locked),
        .CPU_RESETN(CPU_RESETN),
        
        .led(led),
        
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

endmodule
