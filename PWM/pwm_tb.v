//PWM testbench

`timescale 1ns/1ps

module pwm_tb();

reg SysClk_s, Reset_s;
reg [15:0] Period_s;
reg DutyCycle_s, Burst_s, BurstType_s;
wire PWM_s;     //defining all inputs and outputs for pwm

//calling module
//module pwm(SysClk, Reset, Period, DutyCycle, Burst, BurstType, PWM);
pwm pwmtest(SysClk_s, Reset_s, Period_s, DutyCycle_s, Burst_s, BurstType_s, PWM_s);
integer i;  //iterator for loops

//clock
always begin
	SysClk_s <= 0;
	#0.5;
	SysClk_s <= 1;
	#0.5;   //changing clock every 500ps
end

//test inputs
initial begin
    $dumpvars(0, pwm_tb);   //creating dump file
    Reset_s <= 1;
    @(posedge SysClk_s);
    #0.25
    Reset_s <= 0;   //toggling reset to clear unknowns
    @(posedge SysClk_s);
    DutyCycle_s <= 0;
    Burst_s <= 1;
    BurstType_s <= 1;
    Period_s <= 2048;    //setting input parameters
    @(posedge SysClk_s);
    
    for (i = 0; i < 100000; i++) begin
        @(posedge SysClk_s);    //waiting an arbitrary amount of time
    end
    $finish;    //use GTKWave to view results
end

endmodule