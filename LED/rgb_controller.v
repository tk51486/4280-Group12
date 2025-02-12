//rgb controller

`timescale 1ns/1ps

module rgb_controller(clk_in, rst_in, r_in, g_in, b_in, r_out, g_out, b_out);

input clk_in, rst_in;  //clock and reset
input [7:0] r_in, g_in, b_in;   //color input from switches, 8-bit duty cycle
output r_out, g_out, b_out;   //led outputs
wire r, g, b;   //pwm to led

//module pwm_led(SysClk, Reset, DutyCycle, PWM);
pwm_led red(clk_in, rst_in, r_in, r);
pwm_led green(clk_in, rst_in, g_in, g);
pwm_led blue(clk_in, rst_in, b_in, b);  //calling pwm for each color

assign r_out = r;
assign g_out = g;
assign b_out = b;  //assigning outputs

endmodule