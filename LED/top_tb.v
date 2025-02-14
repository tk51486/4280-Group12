//top level tb

`timescale 1ns/1ps

module top_tb();

reg CLK_s, RST_s;
reg [15:0] SW_s;
wire [2:0] LED0_s, LED1_s;
wire [7:0] CA_s, AN_s;   
wire [4:1] JA_s; //defining all inputs and outputs for pwm

//calling module
//module top(CLK, RST, SW, LED0, LED1, CA, AN);
top toptest(CLK_s, RST_s, SW_s, LED0_s, LED1_s, CA_s, AN_s, JA_s);

integer i;  //iterator used for looping
reg [7:0] expected; //expected value for cathode. used for self-checking

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
    SW_s <= 16'b1111111111111111; //setting input parameters: red, green, blue. displays as BGR on the waveform
    for (i = 0; i < 25000; i++) begin
        @(posedge CLK_s);    //waiting for the sixth 7SD
    end
    case (SW_s[3:0])
      4'h0: expected = 8'b11000000;
      4'h1: expected = 8'b11111001;
      4'h2: expected = 8'b10100100;
      4'h3: expected = 8'b10110000;
      4'h4: expected = 8'b10011001;
      4'h5: expected = 8'b10010010;
      4'h6: expected = 8'b10000010;
      4'h7: expected = 8'b11111000;
      4'h8: expected = 8'b10000000;
      4'h9: expected = 8'b10010000;
      4'hA: expected = 8'b10001000;
      4'hB: expected = 8'b10000011;
      4'hC: expected = 8'b11000110;
      4'hD: expected = 8'b10100001;
      4'hE: expected = 8'b10000110;
      4'hF: expected = 8'b10001110; //finding expected encoded value
    endcase
    $display("Sixth 7SD displays %h, expecting %h", CA_s, expected);
    for (i = 0; i < 10000; i++) begin
        @(posedge CLK_s);    //waiting for the fifth 7SD
    end
    case ({3'b0, SW_s[4]})
      4'h0: expected = 8'b11000000;
      4'h1: expected = 8'b11111001;
      4'h2: expected = 8'b10100100;
      4'h3: expected = 8'b10110000;
      4'h4: expected = 8'b10011001;
      4'h5: expected = 8'b10010010;
      4'h6: expected = 8'b10000010;
      4'h7: expected = 8'b11111000;
      4'h8: expected = 8'b10000000;
      4'h9: expected = 8'b10010000;
      4'hA: expected = 8'b10001000;
      4'hB: expected = 8'b10000011;
      4'hC: expected = 8'b11000110;
      4'hD: expected = 8'b10100001;
      4'hE: expected = 8'b10000110;
      4'hF: expected = 8'b10001110; //finding expected encoded value
    endcase
    $display("Fifth 7SD displays %h, expecting %h", CA_s, expected);
    for (i = 0; i < 10000; i++) begin
        @(posedge CLK_s);    //waiting for the fourth 7SD
    end
    case (SW_s[8:5])
      4'h0: expected = 8'b11000000;
      4'h1: expected = 8'b11111001;
      4'h2: expected = 8'b10100100;
      4'h3: expected = 8'b10110000;
      4'h4: expected = 8'b10011001;
      4'h5: expected = 8'b10010010;
      4'h6: expected = 8'b10000010;
      4'h7: expected = 8'b11111000;
      4'h8: expected = 8'b10000000;
      4'h9: expected = 8'b10010000;
      4'hA: expected = 8'b10001000;
      4'hB: expected = 8'b10000011;
      4'hC: expected = 8'b11000110;
      4'hD: expected = 8'b10100001;
      4'hE: expected = 8'b10000110;
      4'hF: expected = 8'b10001110; //finding expected encoded value
    endcase
    $display("Fourth 7SD displays %h, expecting %h", CA_s, expected);
    for (i = 0; i < 10000; i++) begin
        @(posedge CLK_s);    //waiting for the third 7SD
    end
    case ({2'b0, SW_s[10:9]})
      4'h0: expected = 8'b11000000;
      4'h1: expected = 8'b11111001;
      4'h2: expected = 8'b10100100;
      4'h3: expected = 8'b10110000;
      4'h4: expected = 8'b10011001;
      4'h5: expected = 8'b10010010;
      4'h6: expected = 8'b10000010;
      4'h7: expected = 8'b11111000;
      4'h8: expected = 8'b10000000;
      4'h9: expected = 8'b10010000;
      4'hA: expected = 8'b10001000;
      4'hB: expected = 8'b10000011;
      4'hC: expected = 8'b11000110;
      4'hD: expected = 8'b10100001;
      4'hE: expected = 8'b10000110;
      4'hF: expected = 8'b10001110; //finding expected encoded value
    endcase
    $display("Third 7SD displays %h, expecting %h", CA_s, expected);
    for (i = 0; i < 10000; i++) begin
        @(posedge CLK_s);    //waiting for the second 7SD
    end
    case (SW_s[14:11])
      4'h0: expected = 8'b11000000;
      4'h1: expected = 8'b11111001;
      4'h2: expected = 8'b10100100;
      4'h3: expected = 8'b10110000;
      4'h4: expected = 8'b10011001;
      4'h5: expected = 8'b10010010;
      4'h6: expected = 8'b10000010;
      4'h7: expected = 8'b11111000;
      4'h8: expected = 8'b10000000;
      4'h9: expected = 8'b10010000;
      4'hA: expected = 8'b10001000;
      4'hB: expected = 8'b10000011;
      4'hC: expected = 8'b11000110;
      4'hD: expected = 8'b10100001;
      4'hE: expected = 8'b10000110;
      4'hF: expected = 8'b10001110; //finding expected encoded value
    endcase
    $display("Second 7SD displays %h, expecting %h", CA_s, expected);
    for (i = 0; i < 10000; i++) begin
        @(posedge CLK_s);    //waiting for the first 7SD
    end
    case ({3'b0, SW_s[15]})
      4'h0: expected = 8'b11000000;
      4'h1: expected = 8'b11111001;
      4'h2: expected = 8'b10100100;
      4'h3: expected = 8'b10110000;
      4'h4: expected = 8'b10011001;
      4'h5: expected = 8'b10010010;
      4'h6: expected = 8'b10000010;
      4'h7: expected = 8'b11111000;
      4'h8: expected = 8'b10000000;
      4'h9: expected = 8'b10010000;
      4'hA: expected = 8'b10001000;
      4'hB: expected = 8'b10000011;
      4'hC: expected = 8'b11000110;
      4'hD: expected = 8'b10100001;
      4'hE: expected = 8'b10000110;
      4'hF: expected = 8'b10001110; //finding expected encoded value
    endcase
    $display("First 7SD displays %h, expecting %h\n", CA_s, expected);
    $display("Self-checking complete.");
    $finish;    //use GTKWave to view results
end

endmodule