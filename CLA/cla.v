//4-bit carry look ahead adder

`timescale 1ns/1ns

module cla(A, B, Cin, S, C4, Clk, Rst);

input [3:0] A, B;   //4-bit inputs
input Cin;      //carry in
output [3:0] S; //4-bit output
output C4;      //carry out
input Clk, Rst; //clock and reset 

wire [3:0] C;  //Carry propagate values are calculated first

assign C[0] = Cin;  //First carry bit is Cin
//If the prev bit generated a carry (both inputs are 1)
//OR if carry is propagated AND prev carry is set, set carry for this bit
assign C[1] = (A[0] & B[0]) | ((A[0]|B[0]) & C[0]);
assign C[2] = (A[1] & B[1]) | ((A[1]|B[1]) & C[1]);
assign C[3] = (A[2] & B[2]) | ((A[2]|B[2]) & C[2]);
assign C4 = (A[3] & B[3]) | ((A[3]|B[3]) & C[3]);

//the output for each bit depends on the polarity of A, B, and C
assign S = A^B^C;   //calculated using XOR

endmodule