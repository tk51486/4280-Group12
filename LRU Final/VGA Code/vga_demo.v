module vga_demo
   #(parameter CD = 12) 
   (
    input clk,                       
    input wire endFile,
    // VGA output signals
    output hsync, vsync,           
    output [CD-1:0] rgb,            
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

   wire [10:0] hc, vc;                          
   wire [CD-1:0] vga_rgb;                       

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



   vga_sync_demo #(.CD(CD)) sync_unit (
      .clk(clk), 
      .reset(1'b0),                  
      .vga_si_rgb(vga_rgb),
      .hsync(hsync), 
      .vsync(vsync), 
      .rgb(rgb), 
      .hc(hc), 
      .vc(vc)
   );
endmodule
