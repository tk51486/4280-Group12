`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2025 07:37:39 PM
// Design Name: 
// Module Name: StatTracker
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


module StatTracker(
    
    input clk,
    
    input [16:0] LRUTag,
    input [10:0] LRUIndex,
    input LRULoadStore,
    input [20:0] LRUInst,
    input LRULineReady,

    output reg [32:0] accessesTotal,
    output reg [32:0] evictionTotal,
    output reg [32:0] writeHitTotal,
    output reg [32:0] readHitTotal,
    output reg [32:0] writeMissTotal,
    output reg [32:0] readMissTotal,
    output reg [32:0] instTotal,
    output reg [32:0] hitTotal,
    output reg [32:0] missTotal,

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
    
    wire [1:0] accesses;
    wire eviction;
    wire write;
    wire hit;
    wire processed;
    
    DirectLRU u_DirectLRU(
        
        .clk(clk),
        
        .LRUTag(LRUTag),
        .LRUIndex(LRUIndex),
        .LRULoadStore(LRULoadStore),
        .LRUInst(LRUInst),
        .LRULineReady(LRULineReady),
    
        .accesses(accesses),
        .eviction(eviction),
        .write(write),
        .hit(hit),
        .processed(processed),
    
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
    
    always @(posedge processed) begin
        accessesTotal = accessesTotal + accesses;
        evictionTotal = evictionTotal + 1;
        if(write) begin
            if(hit) begin
                writeHitTotal = writeHitTotal + 1;
            end 
            else begin 
                writeMissTotal = writeMissTotal + 1;
            end
        end
        else begin
            if(hit) begin
                readHitTotal = readHitTotal + 1;
            end
            else begin 
                readMissTotal = readMissTotal + 1;
            end
        end
        hitTotal = writeHitTotal + readHitTotal;
        missTotal = writeMissTotal + readMissTotal;
    end
    
    always @(posedge LRULineReady) begin
        instTotal = instTotal + LRUInst;
    end
endmodule
