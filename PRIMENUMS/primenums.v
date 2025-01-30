//Find prime numbers from 1 to 1000

`timescale 1ns/1ns

module primenums(NumMax, Reset, SysClk, Prime, ClockCount, NumberChecked, NumberofPrimesFound);

input [9:0] NumMax; //highest number to check for primes. should be 1 to 1000, inclusive

input Reset, SysClk;    //clock and reset

output [9:0] NumberChecked = 1; //current number being checked

output Prime;   //set if NumberChecked is prime

output ClockCount = 0;

output [7:0] NumberofPrimesFound = 0;   //number of primes found between 1 and NumberChecked

reg [1:0] Sreg, Snext;  //State and next state registers

parameter [1:0] WAIT = 2'b00, CHECK = 2'b01, UPDATE = 2'b10, NEXT = 2'b11;

always @ (NumMax) begin
	Snext = WAIT;
	NumberofPrimesFound = 0;
	NumberChecked = 0;
	ClockCount = 0;

always @ (posedge SysClk)
	Sreg <= Snext;
	ClockCount = ClockCount + 1;
	if(Reset == 1) Sreg <= WAIT;	

always @ (Sreg) begin
	case (Sreg)
		WAIT: 
			if(NumberChecked >= NumMax) Snext = WAIT;
			else Snext = CHECK;
			
		CHECK:
			Prime = 1;
			for(int i = 1; i < NumberChecked; i++) begin
				if(NumberChecked % i == 0.0 && i !== 1)begin
					Prime = 0;
				end
			end
			Snext = UPDATE;
		UPDATE:
			if(Prime == 1) NumberofPrimesFound = NumberofPrimesFound + 1;
			Snext = NEXT;
		NEXT:
			$display("Current Number: %d, Is it Prime: %d, Number of Clock Cycles: %d, Current Number of Primes: %d \n", NumberChecked, Prime, ClockCount, NumberofPrimesFound);
			if(NumberChecked < 3)begin
				NumberChecked = NumberChecked + 1;
			end
			else if(NumberChecked + 2 <= NumMax)begin 
				NumberChecked = NumberChecked + 2;
				Snext = CHECK;
			end
			else begin
				Snext = WAIT;
			end
		DEFAULT: 
			Snext = WAIT;
endmodule

