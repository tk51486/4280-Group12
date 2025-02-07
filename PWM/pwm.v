//PWM generator

`timescale 1ns/1ps

module pwm(SysClk, Reset, Period, DutyCycle, Burst, BurstType, PWM);

input SysClk, Reset;    //clock and reset
input [15:0] Period;    //time for one cycle in ns (1 mil for 1khz)
input DutyCycle, Burst, BurstType; //changes DC, enables burst, and toggles between 8/16
output reg PWM; //square wave output
integer ClockCount, BurstCount; //used for tracking the time within the cycle & number of bursts
reg Sreg, Snext;  //state and next state registers
parameter OFF = 1'b0, ON = 1'b1; //states

initial PWM = 0;
initial ClockCount = 0;
initial BurstCount = 0; //assigning initial values

always @ (posedge SysClk) begin		//state memory
    ClockCount++;   //increment ClockCount
    Sreg <= Snext;	//next state
	if(Reset == 1) begin 
		Sreg <= OFF;	//if reset = 1, stay off
	end
end

//ontime >> 4 + (1*dc)
always @ (Sreg, ClockCount) begin    //next state logic
    case (Sreg)
        OFF: begin  //OFF state logic
            if (Burst == 0) begin   //no burst
                if (ClockCount == (DutyCycle ? 3 : 1) * (Period >> (1 + (1*DutyCycle)))) begin //shifting based on DC for off time
                    ClockCount = 0; //if enough time has passed, reset clock
                    Snext = ON; //turn on
                end
                else Snext = OFF;   //otherwise, remain off
            end
            else begin  //with burst
                if (BurstCount == 0) begin  //not bursting
                    if (ClockCount >= (DutyCycle ? 3 : 1) * (Period >> (1 + (1*DutyCycle)))) begin //same off time as no burst
                        ClockCount = 0; //if it's time to burst, reset clock
                        BurstCount++;   //begin bursts (starts with PWM low)
                    end
                    Snext = OFF;    //will remain off either way
                end
                else if (ClockCount == (Period >> (1 + (1*DutyCycle))) >> (4 + 1*BurstType)) begin  //handling each burst, off time changes w/ BurstType
                    ClockCount = 0; //resets clock
                    BurstCount++;   //incrementing BurstCount
                    Snext = ON;     //turn on
                end
                else Snext = OFF;   //otherwise remain off, waiting for the next burst
            end
        end
        //Period >> (1 + (1*DutyCycle))
        ON: begin   //ON state logic
            if (Burst == 0) begin   //no burst
                if (ClockCount == Period >> (1 + (1*DutyCycle))) begin   //on time is based on period and dc
                    ClockCount = 0; //reset clock
                    Snext = OFF;    //turn off
                end
                else Snext = ON;    //if on time has not passed, remain on
            end
            else if (ClockCount == (Period >> (1 + (1*DutyCycle))) >> (4 + 1*BurstType)) begin  //handling bursts
                    if (BurstCount == (16 + 16 * BurstType)) BurstCount = 0;    //once burst count hits the threshold, stop bursting
                    else BurstCount++;  //if not, increment burstcount
                    ClockCount = 0; //reset ClockCount
                    Snext = OFF;    //turn off
            end
            else Snext = ON; //if on time has not passed (no burst), remain on
        end
        default Snext = OFF;    //default value
    endcase
end

always @ (Sreg) begin	//output logic
    case (Sreg)
        OFF: begin  //OFF turns the PWM off
            PWM = 0;
        end
        ON: begin   //ON turns the PWM on
            PWM = 1;
        end
    endcase
end
endmodule
