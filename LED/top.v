//top level verilog file

`timescale 1ns/1ps

module top(CLK, RST, SW, LED0, LED1, CA, AN);

input wire CLK, RST;    //clk and reset button
input wire [15:0] SW;   //switches
output wire [2:0] LED0, LED1;   //RGB LEDs. LED0 will be used, LED1 will be turned off
output wire [7:0] CA, AN;   //cathodes and anodes for seven-segment display

assign LED1[0] = 0;
assign LED1[1] = 0;
assign LED1[2] = 0;    //turning off LED1

//module rgb_controller(clk_in, rst_in, r_in, g_in, b_in, r_out, g_out, b_out);
rgb_controller controller(CLK, RST, {SW[15:11], 3'b0}, {SW[10:5], 2'b0}, {SW[4:0], 3'b0}, LED0[0], LED0[1], LED0[2]);
endmodule