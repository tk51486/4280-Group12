module vga_demo
   #(parameter CD = 12) // CD: Color Depth (12-bit RGB by default)
   (
    input clk,                       // Clock input
    input wire endFile,
    // VGA output signals
    output hsync, vsync,           // Horizontal and vertical sync
    output [CD-1:0] rgb,            // RGB pixel output
    input wire [31:0] accessesTotal,
    input wire [31:0] evictionTotal,
    input wire [31:0] writeHitTotal,
    input wire [31:0] readHitTotal,
    input wire [31:0] writeMissTotal,
    input wire [31:0] readMissTotal,
    input wire [31:0] instTotal,
    input wire [31:0] hitTotal,
    input wire [31:0] missTotal
   );

   // Internal wires for synchronization and RGB data
   wire [10:0] hc, vc;                          // Horizontal and vertical counters (for pixel scanning)
   wire [CD-1:0] vga_rgb;                       // Final RGB to VGA

   // ------------------------ Assign background color and settings from switches

   // ------------------------ Pattern Generator Instantiation
   // Generates a colored square/bar based on current pixel (hc, vc)
   square_demo square_unit (
      .clk(clk),
      .endFile(endFile),
      .x(hc), 
      .y(vc),
      .vga_rgb(vga_rgb),
      .accessesTotal(accessesTotal),
      .evictionTotal(evictionTotal),
      .writeHitTotal(writeHitTotal),
      .readHitTotal(readHitTotal),
      .writeMissTotal(writeMissTotal),
      .readMissTotal(readMissTotal),
      .instTotal(instTotal),
      .hitTotal(hitTotal),
      .missTotal(missTotal)
   );


   // ------------------------ VGA Sync Generator
   // Generates pixel scan timing signals and outputs sync pulses
   vga_sync_demo #(.CD(CD)) sync_unit (
      .clk(clk), 
      .reset(1'b0),                  // No external reset; hardcoded to 0
      .vga_si_rgb(vga_rgb),
      .hsync(hsync), 
      .vsync(vsync), 
      .rgb(rgb), 
      .hc(hc), 
      .vc(vc)
   );
endmodule