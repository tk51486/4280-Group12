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
        //output [7:0] SendAway,
        //input wire [7:0] currentNum,
        input wire clk
    );
reg [16:0] nintcount;
reg wai;
reg [7:0] SendA;
initial begin
    nintcount = 0;
    wai = 0;
end
//assign SendA = SendAway;
always @(posedge clk) begin
    //if(currentNum != 0) begin
    //    wai <= 1;
    //end
    if(wai == 1) begin
        if(nintcount == 96) begin
            nintcount = 0;
           // SendA = currentNum;
        end
        nintcount <= nintcount + 1;
    end 
end    
endmodule
