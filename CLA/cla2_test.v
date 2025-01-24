//Tb for 16-bit cla

`timescale 1ns/1ns

module cla2_test();

reg [15:0] A_s, B_s;
wire [15:0] S_s;
wire C16_s;
reg Clk_s, Rst_s; //defining all inputs and outputs
integer i, j;   //used for looping

cla2 BitTest16(A_s, B_s, S_s, C16_s, Clk_s, Rst_s); //calling module

//Clock
always begin
	Clk_s <= 0;
	#10;
	Clk_s <= 1;
	#10;
end

// Test inputs
initial begin
$dumpvars(0,cla2_test);
	#5 Rst_s <= 1;
	@(posedge Clk_s);
	#5 Rst_s <= 0;
    @(posedge Clk_s);
    for (i = 0; i < 65536; i++) begin
        for (j = 0; j < 65536; j++) begin
            #5 A_s <= i;
            B_s <= j;
            @(posedge Clk_s); //iterating through 1M possible inputs
        end
    end
    @(posedge Clk_s);
    @(posedge Clk_s);
$finish;
end

endmodule