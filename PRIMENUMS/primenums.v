//Find prime numbers from 1 to 1000

`timescale 1ns/1ns

module primenums(NumMax, Reset, SysClk, Prime, NumberChecked, NumberofPrimesFound);



input [9:0] NumMax; //highest number to check for primes. should be 1 to 1000, inclusive

input Reset, SysClk;    //clock and reset

output [9:0] NumberChecked; //current number being checked

output Prime;   //set if NumberChecked is prime

output [7:0] NumberofPrimesFound;   //number of primes found between 1 and NumberChecked

reg [1:0] Sreg, Snext;  //State and next state registers

parameter [1:0] WAIT = 2'b00, CHECK = 2'b01, UPDATE = 2'b10, NEXT = 2'b11;

endmodule
