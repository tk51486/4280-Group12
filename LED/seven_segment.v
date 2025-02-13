// seven_segment.sv
// ------------------------------------
// Drive multiple seven segment displays
// ------------------------------------
// Author : Frank Bruno
// Encapsulate multiple seven segment displays using the cathode driver plus an
// anode driver.
`timescale 1ns/10ps
module seven_segment
  #
  (
   parameter NUM_SEGMENTS = 8,
   parameter CLK_PER      = 10,  // Clock period in ns
   parameter REFR_RATE    = 1000 // Refresh rate in Hz
   )
  (
   input wire                         clk,
   input wire                         reset, // active high reset
   input wire [NUM_SEGMENTS-1:0][3:0] encoded,
   output reg [NUM_SEGMENTS-1:0]    anode,
   output reg [7:0]                 cathode
   );
   
  localparam INTERVAL = 10000;

  logic [$clog2(INTERVAL)-1:0]        refresh_count;
  logic [$clog2(NUM_SEGMENTS)-1:0]    anode_count;
  wire [NUM_SEGMENTS-1:0][7:0]       segments;

  cathode_top ct0(clk, encoded[0], segments[0]);
  cathode_top ct1(clk, encoded[1], segments[1]);
  cathode_top ct2(clk, encoded[2], segments[2]);
  cathode_top ct3(clk, encoded[3], segments[3]);
  cathode_top ct4(clk, encoded[4], segments[4]);
  cathode_top ct5(clk, encoded[5], segments[5]);
  cathode_top ct6(clk, encoded[6], segments[6]);
  cathode_top ct7(clk, encoded[7], segments[7]);

  initial begin
    refresh_count = 0;
    anode_count   = 0;
  end

  always @(posedge clk) begin
    if (refresh_count == INTERVAL) begin
      refresh_count          <= 0;
      anode_count            <= anode_count + 1'b1;
    end else refresh_count <= refresh_count + 1'b1;
    anode[0] <= 1;
    anode[1] <= 1;
    anode[2] <= 1;
    anode[3] <= 1;
    anode[4] <= 1;
    anode[5] <= 1;
    anode[6] <= 1;
    anode[7] <= 1;
    anode[anode_count]       <= 0;
    cathode                  <= segments[anode_count];
    if (reset) begin
      refresh_count          <= 0;
      anode_count            <= 0;
    end
  end

endmodule
