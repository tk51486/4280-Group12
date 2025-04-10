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
        input wire [7:0] currentNum,
        input wire clk,
        output wire [15:8] led
    );
reg [7:0] testVals [8:0];
reg [7:0] buff [0:50000];
reg [32:0] bufco;
reg [32:0] finalco;
reg [38:0] counter;
reg [16:0] nintcount;
reg [7:0] extra;
reg test;
reg ter;
reg on;
reg [6:0] inc;
reg [7:0] check;
reg [16:0] wai;
initial begin
    testVals[0] = 8'b00000001;
    testVals[1] = 8'b00000010;
    testVals[2] = 8'b00000011;
    testVals[3] = 8'b00000100;
    testVals[4] = 8'b00000101;
    testVals[5] = 8'b00000110;
    testVals[6] = 8'b00000111;
    testVals[7] = 8'b00001000;
    testVals[8] = 8'b00001010;
    counter = 0;
    bufco = 0;
    finalco = 0;
    extra = 8'b00000000;
    test = 1;
    ter = 0;
    nintcount = 0;
    wai = 0;
    inc = 0;
    on = 1;
end
assign led[15:8] = extra[7:0];
always @(posedge clk) begin
    if(currentNum != 0) begin
        wai <= 1;
    end
    if(wai == 1) begin
        if(counter > 1000000) begin
            //extra[3:0] <= check;
            extra[7:0] <= buff[finalco][7:0];
            finalco <= finalco + 1;
            counter = 0;
        end
        if(nintcount == 96) begin
            nintcount = 0;
            counter <= counter + 1;
            if(test == 1) begin
                buff[bufco] = currentNum;
                bufco <= bufco + 1;
                if(bufco > 50000) begin
                    test = 0;
                end
            end
        end
        nintcount <= nintcount + 1;
    end 
end

//always @(posedge counter) begin
    //if(counter > 100) begin
        //extra[3:0] = currentNum[3:0];
        
        //extra[3:0] = buff[finalco][3:0];
        //finalco = finalco + 1; 
        
//    end
//end

//always @(posedge bufco) begin
//    buff[bufco] = currentNum;
//end
    
endmodule
