//Self-checking tb for 16-bit cla

`timescale 1ns/1ns

module cla2_test();

reg [15:0] A_s, B_s;
wire [15:0] S_s;
wire C16_s;
reg Clk_s, Rst_s;   //defining all inputs and outputs for module

integer i, j;       //iterators used for looping
integer sum = 0;    //expected sum value for each loop
integer errs = 0;   //number of errors found during checking
cla2 BitTest16(A_s, B_s, S_s, C16_s, Clk_s, Rst_s); //calling 16-bit CLA module

//Clock
always begin
	Clk_s <= 0;
	#10;
	Clk_s <= 1;
	#10;
end

//Testing inputs
initial begin
    A_s = 16'b0;
    B_s = 16'b0;    //setting inputs, this prevents an error due to unknown input

    for (i = 0; i < 65536; i++) begin   //looping through all possibilities for A
        for (j = 0; j < 65536; j += 4096) begin //only looping through the highest 4 bits for B
            
            sum <= i + j;   //calculating sum using iterators
            #5 A_s <= i;    
            B_s <= j;       //setting A and B

            /*if(j == 45056) begin
                B_s <= 20480;   //forcing errors, comment out to remove
            end*/

            @(posedge Clk_s);   //wait one clock for S and C16 to update

            if({C16_s, S_s} !== sum) begin  //error check
                //if the carry and output register concatenated don't match sum, print error msg
                $display("ERROR\nC16, S = %b\nsum = %b", {C16_s, S_s}, sum);
                errs = errs + 1;    //increment errors
            end
        end
    end
    @(posedge Clk_s);
    $display("Self-checking complete.\nNumber of errors = %d", errs);   //print number of errors
$finish;
end
endmodule