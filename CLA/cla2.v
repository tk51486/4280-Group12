//16-bit carry look ahead adder

`timescale 1ns/1ns

module cla2(A, B, S, C16, Clk, Rst);

input [15:0] A, B;  //16-bit inputs
output [15:0] S;    //16-bit output
output C16;         //carry out
input Clk, Rst;     //clock and reset


wire Cin;       //Cin used for the first 4-bit cla
assign Cin = 0; //initial Cin value for first adder

wire [3:0] Carry; //used to connect C4 (carry out) to next Cin

//creating 4 4-bit carry look aheads to add A and B
//cla module instantiation: cla(A, B, Cin, S, C4, Clk, Rst)
//each bit of Carry is the carry out of its bit and the carry in of the next bit
cla adder0(A[3:0], B[3:0], Cin, S[3:0], Carry[0], Clk, Rst);

cla adder1(A[7:4], B[7:4], Carry[0], S[7:4], Carry[1], Clk, Rst);

cla adder2(A[11:8], B[11:8], Carry[1], S[11:8], Carry[2], Clk, Rst);

cla adder3(A[15:12], B[15:12], Carry[2], S[15:12], Carry[3], Clk, Rst);

assign C16 = Carry[3];  //the final bit of Carry is C16, carry out of the 16-bit adder

endmodule