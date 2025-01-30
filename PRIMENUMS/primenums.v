//Find prime numbers from 1 to 1000

`timescale 1ns/1ns

module primenums(NumMax, Reset, SysClk, Prime, NumberChecked, NumberofPrimesFound);

input [9:0] NumMax; //highest number to check for primes. range is 1 to 1000, inclusive
input Reset, SysClk;    //clock and reset
output reg [9:0] NumberChecked; //current number being checke
output reg Prime;   //set if NumberChecked is prime
output reg [7:0] NumberofPrimesFound;   //number of primes found between 1 and NumberChecked
reg [1:0] Sreg, Snext;  //state and next state registers
parameter [1:0] WAIT = 2'b00, CHECK = 2'b01, UPDATE = 2'b10, NEXT = 2'b11;	//states, explained below
integer i, ClockCount;	//i is an iterator to calculate primes, ClockCount counts clock cycles

initial NumberChecked = 1;	//Initializing values
initial ClockCount = 0;
initial NumberofPrimesFound = 0;

always @ (posedge SysClk) begin
	ClockCount++;	//increment ClockCount
	Sreg <= Snext;	//next state
	if(Reset == 1) begin 
		Sreg <= WAIT;	//if reset = 1, do nothing
	end	
end

always @ (Sreg, NumberChecked) begin	//next state logic
	case (Sreg)	//cases
		WAIT: begin		//WAIT is the initial and default state
			if(NumberChecked > NumMax) begin 
				Snext = WAIT;	//once primes have been found, wait indefinitely
			end
			else begin
				Snext = CHECK;	//otherwise, proceed to CHECK
			end
		end
		CHECK: begin	//CHECK runs the algorithm to find if NumberChecked is prime
			Prime = 1;
			for (i = 2; i < NumberChecked; i++) begin
				if (NumberChecked % i == 0) begin
					Prime = 0;	//if NumberChecked is divisible by a number below it (besides 1), it's prime
				end
			end
			if (NumberChecked == 1) begin	//special case, 1 is not prime
				Prime = 0;
			end
			/*if (NumberChecked == 719) begin		
				Prime = 0;	//forcing error
			end*/
			Snext = UPDATE;	//proceed to UPDATE
		end
		UPDATE: begin	//UPDATE increments number of primes found
			if(Prime == 1) begin
				NumberofPrimesFound = NumberofPrimesFound + 1;
			end
			Snext = NEXT;	//proceed to NEXT
		end
		NEXT: begin		//NEXT prints out the results and starts the loop again
			$display("Current Number: %d, Prime? %d, Clocks: %d, Primes: %d\n", NumberChecked, Prime, ClockCount, NumberofPrimesFound);
			if(NumberChecked < 3) begin
				NumberChecked = NumberChecked + 1;	//since 2 and 3 need to be checked, increments by 1
			end
			else begin 
				NumberChecked = NumberChecked + 2;	//afterwards, increments by 2 to only check odds
			end
			Snext = WAIT;	//proceed to WAIT, restarting the loop w/ a new NumberChecked
		end
		default Snext = WAIT;
	endcase
end
endmodule

