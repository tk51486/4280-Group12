//Tb for 4-bit cla

`timescale 1ns/1ns

module cla_test();

reg [3:0] A_s, B_s;
reg Cin_s;
wire [3:0] S_s;
wire C4_s;
reg Clk_s, Rst_s; //defining all inputs and outputs
integer i, j;   //iterators used for looping

cla CompToTest(A_s, B_s, Cin_s, S_s, C4_s, Clk_s, Rst_s); //calling module

//Clock
always begin
	Clk_s <= 0;
	#10;
	Clk_s <= 1;
	#10;
end

// Test inputs
initial begin
$dumpvars(0,cla_test);
	#5 Rst_s <= 1;
	@(posedge Clk_s);
	#5 Rst_s <= 0;
	@(posedge Clk_s);
    #5 Cin_s <= 0;
    @(posedge Clk_s);
    for (i = 0; i < 16; i++) begin
        for (j = 0; j < 16; j++) begin
            #5 A_s <= i;
            B_s <= j;
            @(posedge Clk_s); //iterating through all possible inputs
        end
    end
$finish;
end

endmodule