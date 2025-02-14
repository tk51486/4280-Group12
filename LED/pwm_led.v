//PWM generator adapted from the previous exercise

`timescale 1ns/1ps

module pwm_led(SysClk, Reset, DutyCycle, PWM);

input SysClk, Reset;    //clock and reset
input [7:0] DutyCycle; //changes DC
output reg PWM; //square wave output
reg [7:0] ClockCount; //used for tracking the time within the cycle
reg Sreg, Snext;  //state and next state registers
parameter OFF = 1'b0, ON = 1'b1; //states

initial PWM = 0;
initial ClockCount = 0; //assigning initial values

always @ (posedge SysClk) begin //state memory
    ClockCount <= ClockCount + 1;   //increment ClockCount
    Sreg <= Snext;	//next state
	if(Reset == 1) begin 
		Sreg <= OFF;	//if reset = 1, stay off
	end  
	//next state logic
    case (Sreg)
        OFF: begin  //OFF state logic
            if (ClockCount == 256 - DutyCycle && DutyCycle != 0) begin  //offtime = 256 - dc
                ClockCount = 0; //reset clock
                Snext = ON; //turn on
            end
            else Snext = OFF;   //stay off
        end
        ON: begin   //ON state logic
            if (ClockCount == DutyCycle) begin  //ontime = dc
                ClockCount = 0; //reset clock
                Snext = OFF;    //turn off
            end
            else Snext = ON; //if on time has not passed, remain on
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