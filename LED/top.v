//top level verilog file

`timescale 1ns/1ps

module top(CLK, RST, SW, LED0, LED1, CA, AN, JA);

input wire CLK, RST;    //clk and reset button
input wire [15:0] SW;   //switches
output wire [7:0] CA;   //7SD cathodes
output wire [7:0] AN;   //7SD anodes
output wire [2:0] LED0, LED1;   //RGB LEDs. LED0 will be used, LED1 will be turned off
wire [31:0] encoded;    //32-bit number that is shown on the 7SDs
output wire [4:1] JA;   //PMOD headers for logic analyzer

assign LED1[0] = 0;
assign LED1[1] = 0;
assign LED1[2] = 0;    //turning off LED1

assign encoded[3:0] = 4'h0;
assign encoded[7:4] = 4'h0; //two right-most 7SDs are unused
assign encoded[11:8] = SW[3:0];
assign encoded[15:12] = {3'b0, SW[4]};
assign encoded[19:16] = SW[8:5];
assign encoded[23:20] = {2'b0, SW[10:9]};
assign encoded[27:24] = SW[14:11];
assign encoded[31:28] = {3'b0, SW[15]}; //creating 4-bit values for each 7SD display

//calling module for the LEDs
//module rgb_controller(clk_in, rst_in, r_in, g_in, b_in, r_out, g_out, b_out);
rgb_controller controller(CLK, RST, {SW[15:11], 3'b0}, {SW[10:5], 2'b0}, {SW[4:0], 3'b0}, LED0[0], LED0[1], LED0[2]);
 
//calling module for the 7SDs
seven_segment u_7seg(CLK, RST, encoded, AN, CA);

assign JA[1] = LED0[0];
assign JA[2] = LED0[1];
assign JA[3] = LED0[2];
assign JA[4] = CLK; //assigning PMOD headers

endmodule