//4-bit carry look ahead added

`timescale 1ns/1ns

module cla2(A, B, S, C16, Clk, Rst);

input [15:0] A, B;
output [15:0] S;
output C16;
input Clk, Rst;


wire Cin;       
assign Cin = 0; //initial Cin value for first adder

wire [3:0] Carry; //used to carry C4 to next Cin

//cla(A, B, Cin, S, C4, Clk, Rst)
cla adder0(A[3:0], B[3:0], Cin, S[3:0], Carry[0], Clk, Rst);

cla adder1(A[7:4], B[7:4], Carry[0], S[7:4], Carry[1], Clk, Rst);

cla adder2(A[11:8], B[11:8], Carry[1], S[11:8], Carry[2], Clk, Rst);

cla adder3(A[15:12], B[15:12], Carry[2], S[15:12], Carry[3], Clk, Rst);

assign C16 = Carry[3];

endmodule