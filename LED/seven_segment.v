// adapted from seven_segment.sv by Frank Bruno
// uses the code from the book to drive each 7SD display
`timescale 1ns/10ps
module seven_segment
  #
  (parameter NUM_SEGMENTS = 8)
  (
   input wire                         clk,
   input wire                         reset, // active high reset
   input wire [31:0] encoded,
   output reg [NUM_SEGMENTS-1:0]    anode,
   output reg [7:0]                 cathode
   );
   
  localparam INTERVAL = 10000;

  reg [$clog2(INTERVAL)-1:0]        refresh_count;
  reg [$clog2(NUM_SEGMENTS)-1:0]    anode_count;  //calculating counters using log base 2
  wire [NUM_SEGMENTS-1:0] segments [7:0]; //2D array that holds the 8-bit values for all 7SDs

  //calling cathode top once for each 7SD, setting segments
  cathode_top ct0(clk, encoded[3:0], segments[0]);
  cathode_top ct1(clk, encoded[7:4], segments[1]);
  cathode_top ct2(clk, encoded[11:8], segments[2]);
  cathode_top ct3(clk, encoded[15:12], segments[3]);
  cathode_top ct4(clk, encoded[19:16], segments[4]);
  cathode_top ct5(clk, encoded[23:20], segments[5]);
  cathode_top ct6(clk, encoded[27:24], segments[6]);
  cathode_top ct7(clk, encoded[31:28], segments[7]);

  initial begin
    refresh_count = 0;
    anode_count   = 0;  //initializing values
  end

  always @(posedge clk) begin
    if (refresh_count == INTERVAL) begin
      refresh_count          <= 0;
      anode_count            <= anode_count + 1'b1; //every interval, move to the next cathode
    end else refresh_count <= refresh_count + 1'b1; //otherwise, stay on this cathode
    anode[0] <= 1;
    anode[1] <= 1;
    anode[2] <= 1;
    anode[3] <= 1;
    anode[4] <= 1;
    anode[5] <= 1;
    anode[6] <= 1;
    anode[7] <= 1;
    anode[anode_count]       <= 0;  //sets all anodes high except the current one
    cathode                  <= segments[anode_count];  //uses the index of the segment to light up 7SD
    if (reset) begin
      refresh_count          <= 0;
      anode_count            <= 0;  //if reset, do nothing and restart the process
    end
  end

endmodule
