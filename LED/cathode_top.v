// adapted from cathode_top.sv by Frank Bruno
// assigns the 8 bit-value for a 7SD based on a 4-bit
`timescale 1ns/10ps
module cathode_top
  (input wire         clk,  //clock
   input wire [3:0]   encoded, //4-bit value (from switches)
   output reg [7:0] cathode //8-bit value (to 7SD)
   );

  always @(posedge clk) begin
    cathode[7] <= 1;  //digit point is low
    case (encoded)  //assigning based on hex value
      4'h0: cathode[6:0] <= 7'b1000000;
      4'h1: cathode[6:0] <= 7'b1111001;
      4'h2: cathode[6:0] <= 7'b0100100;
      4'h3: cathode[6:0] <= 7'b0110000;
      4'h4: cathode[6:0] <= 7'b0011001;
      4'h5: cathode[6:0] <= 7'b0010010;
      4'h6: cathode[6:0] <= 7'b0000010;
      4'h7: cathode[6:0] <= 7'b1111000;
      4'h8: cathode[6:0] <= 7'b0000000;
      4'h9: cathode[6:0] <= 7'b0010000;
      4'hA: cathode[6:0] <= 7'b0001000;
      4'hB: cathode[6:0] <= 7'b0000011;
      4'hC: cathode[6:0] <= 7'b1000110;
      4'hD: cathode[6:0] <= 7'b0100001;
      4'hE: cathode[6:0] <= 7'b0000110;
      //4'hF: cathode[6:0] <= 7'b0001110; //correct code
      4'hF: cathode[6:0] <= 7'b1111111; //forced error
    endcase
  end

endmodule
