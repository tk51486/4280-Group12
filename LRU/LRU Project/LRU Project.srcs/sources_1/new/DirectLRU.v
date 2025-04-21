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
    
    reg [27:0] ram_addr;
    reg [63:0] line_to_ram;
    wire [63:0] line_from_ram;
    wire ram_transaction_complete, ram_ready;
    wire [15:0] mem_emptyLED;
    reg ram_loadstore, ram_start;  //sent to ram
    reg [15:0] debugLED;
    //assign led = debugLED;
    
    MemController u_MemController(
        .clk_mem(clk_mem),
        .clk_cpu(clk_cpu),
        .pll_locked(pll_locked),
        .CPU_RESETN(CPU_RESETN),
        .LED(led),
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
    
    initial begin
        ram_loadstore = 0;
        ram_start = 1;
        ram_addr = 28'h0101010;
        line_to_ram = 64'hc6c6ffff;//a7a7
        debugLED = 0;
    end
    
    
endmodule
