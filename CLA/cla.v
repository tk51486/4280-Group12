//4-bit carry look ahead adder

`timescale 1ns/1ns

module cla(A, B, Cin, S, C4, Clk, Rst);

input [3:0] A, B;
input Cin;
output [3:0] S;
output C4;
input Clk, Rst;

wire [3:0] C;  //Carry propagate values are calculated first

//First carry bit is Cin
assign C[0] = Cin; 
//If the prev bit generated a carry OR if carry is propagated AND prev carry is set, set carry
assign C[1] = (A[0] & B[0]) | ((A[0]|B[0]) & C[0]);
assign C[2] = (A[1] & B[1]) | ((A[1]|B[1]) & C[1]);
assign C[3] = (A[2] & B[2]) | ((A[2]|B[2]) & C[2]);
assign C4 = (A[3] & B[3]) | ((A[3]|B[3]) & C[3]);

/*assign C[1] = (A[0] & B[0]) | ((A[0]|B[0]) & C[0]);
assign C[2] = (A[1] & B[1]) | ((A[1]^B[1]) & ((A[0] & B[0]) | ((A[0]^B[0]) & C[0])));
assign C[3] = (A[2] & B[2]) | ((A[2]^B[2]) & ((A[1] & B[1]) | ((A[1]^B[1]) & ((A[0] & B[0]) | ((A[0]^B[0]) & C[0])))));
assign C4 = (A[3] & B[3]) | ((A[3]^B[3]) & ((A[2] & B[2]) | ((A[2]^B[2]) & ((A[1] & B[1]) | ((A[1]^B[1]) & ((A[0] & B[0]) | ((A[0]^B[0]) & C[0])))))));*/


assign S = A^B^C;

endmodule