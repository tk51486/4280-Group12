//top level tb

`timescale 1ns/1ps

module top_tb();

reg CLK_s, RST_s;
reg [15:0] SW_s;
wire [2:0] LED0_s, LED1_s;     //defining all inputs and outputs for pwm

//calling module
//module top(CLK, RST, SW, LED0, LED1);
top toptest(CLK_s, RST_s, SW_s, LED0_s, LED1_s);
integer i;
//clock
always begin
	CLK_s <= 0;
	#5;
	CLK_s <= 1;
	#5;   //changing clock every 5ns
end

//test inputs
initial begin
    $dumpvars(0, top_tb);   //creating dump file
    RST_s <= 1;
    @(posedge CLK_s);
    #2.5
    RST_s <= 0;   //toggling reset to clear unknowns
    @(posedge CLK_s);
    SW_s <= 16'b1111111111111111; //setting input parameters: red, green, blue
    //display 
    @(posedge CLK_s);
    for (i = 0; i < 100000; i++) begin
        @(posedge CLK_s);    //waiting an arbitrary amount of time
    end
    $finish;    //use GTKWave to view results
end

endmodule