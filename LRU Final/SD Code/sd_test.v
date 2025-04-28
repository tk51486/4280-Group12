`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2025 01:34:18 PM
// Design Name: 
// Module Name: sd_test
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


module sd_test(
        //output wire [7:0] SendAway,
        output wire SendFlag,
        input wire [7:0] currentNum,
        input wire clk,
        output wire [15:0]led
    );
reg [16:0] nintcount;
reg wai;
reg [7:0] SendA;
reg SendF;
reg [38:0] count;
reg [7:0] l;
initial begin
    nintcount = 0;
    wai = 0;
    SendA = 0;
    SendF = 0;
end
assign SendAway = SendA;
assign SendFlag = SendF;
//assign led[7:0] = l;
always @(posedge clk) begin
    if(wai == 1) begin
        if(count >= 100000000)begin
            //l <= currentNum;
            count <= 0;
        end
        count <= count + 1;
    end
    if(currentNum != 0) begin
        wai <= 1;
    end
    if(wai == 1) begin
        if(nintcount == 96) begin
            nintcount = 0;
            SendA <= currentNum;
            SendF <= 1;
        end
        if(nintcount == 3)begin
            SendF <= 0;
        end
        nintcount <= nintcount + 1;
    end 
end    
endmodule
