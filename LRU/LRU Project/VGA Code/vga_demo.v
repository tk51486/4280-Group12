module vga_demo
   #(parameter CD = 12) // CD: Color Depth (12-bit RGB by default)
   (
    input clk,                       // Clock input

    // VGA output signals
    output hsync, vsync,           // Horizontal and vertical sync
    output [CD-1:0] rgb            // RGB pixel output
   );

   // Internal wires for synchronization and RGB data
   wire [10:0] hc, vc;                          // Horizontal and vertical counters (for pixel scanning)
   wire [CD-1:0] vga_rgb;                       // Final RGB to VGA

   // ------------------------ Assign background color and settings from switches

   // ------------------------ Pattern Generator Instantiation
   // Generates a colored square/bar based on current pixel (hc, vc)
   square_demo square_unit (
      .clk(clk),
      .x(hc), 
      .y(vc),
      .vga_rgb(vga_rgb)
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