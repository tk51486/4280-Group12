//PWM generator

`timescale 1ns/1ps

module pwm(SysClk, Reset, Period, DutyCycle, Burst, BurstType, PWM);

input SysClk, Reset;    //clock and reset
input [15:0] Period;    //time for one cycle in ns (1 mil for 1khz)
input [7:0] DutyCycle;  //percent of the cycle that is high
input Burst, BurstType; //enables burst and toggles between 8/16
output reg PWM; //square wave output
integer ClockCount, BurstCount; //used for tracking the time within the cycle & number of bursts
reg Sreg, Snext;  //state and next state registers
parameter OFF = 1'b0, ON = 1'b1; //states, explained below

initial PWM = 0;
initial ClockCount = 0;
initial BurstCount = 0;

//$display("DC = %d", DutyCycle);
//$display("Period = %d", Period);
always @ (posedge SysClk) begin		//state memory
    ClockCount++;   //increment ClockCount
    Sreg <= Snext;	//next state
	if(Reset == 1) begin 
		Sreg <= OFF;	//if reset = 1, do nothing
	end
end

always @ (Sreg, ClockCount) begin    //next state logic
    case (Sreg)
        OFF: begin
            if (Burst == 0) begin
                if (ClockCount == (Period * (100 - (DutyCycle)))/100) begin
                    ClockCount = 0;
                    Snext = ON;
                end
                else Snext = OFF;
            end
            else begin
                if (BurstCount == 0) begin  //not bursting (off time)
                    if (ClockCount >= (Period * (100 - (DutyCycle)))/100) begin
                        ClockCount = 0;
                        BurstCount++;   //begin bursts (starts off)
                    end
                    Snext = OFF;
                end
                else if(((Period * DutyCycle)/100)/(16 + 16 * BurstType) < 2) begin
                    Snext = ON;
                end
                else if (ClockCount == ((Period * DutyCycle)/100)/(16 + 16 * BurstType)) begin
                    ClockCount = 0;
                    BurstCount++;
                    Snext = ON; 
                end
                else Snext = OFF;
            end
        end
        ON: begin
            if (Burst == 0) begin
                if (ClockCount >= (Period * DutyCycle)/100) begin
                    ClockCount = 0;
                    Snext = OFF;
                end
                else Snext = ON;
            end
            else if(((Period * DutyCycle)/100)/(16 + 16 * BurstType) < 2) begin
                    if (BurstCount == (16 + 16 * BurstType)) begin 
                        BurstCount = 0;
                        ClockCount = 0;
                    end
                    else BurstCount++;
                    Snext = OFF;   
            end
            else if (ClockCount == ((Period * DutyCycle)/100)/(16 + 16 * BurstType)) begin
                if (BurstCount == (16 + 16 * BurstType)) BurstCount = 0;
                else BurstCount++;
                ClockCount = 0;
                Snext = OFF;
            end
            else Snext = ON;
        end
        default Snext = OFF;
    endcase
end

always @ (Sreg) begin	//output logic
    case (Sreg)
        OFF: begin
            PWM = 0;
        end
        ON: begin
            PWM = 1;
        end
    endcase
end
endmodule
