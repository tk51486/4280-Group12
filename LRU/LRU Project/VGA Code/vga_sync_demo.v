module vga_sync_demo #(
    parameter CD = 12  // Color depth: number of bits per RGB sample
)(
    input clk, reset,                     // Main clock and reset
    input [CD-1:0] vga_si_rgb,            // Video stream input (RGB data)
    output hsync, vsync,              // VGA sync signals
    output [CD-1:0] rgb,              // Output pixel color to VGA monitor
    output [10:0] hc, vc                  // Current pixel coordinates (horizontal & vertical)
);

// -------------------- VGA Timing Parameters for 640x480 @60Hz
localparam HD = 640;   // Horizontal display area (visible pixels)
localparam HF = 16;    // Horizontal front porch
localparam HB = 48;    // Horizontal back porch
localparam HR = 96;    // Horizontal sync pulse (retrace)
localparam HT = HD + HF + HB + HR;  // Total horizontal pixels = 800

localparam VD = 480;   // Vertical display area (visible lines)
localparam VF = 10;    // Vertical front porch
localparam VB = 33;    // Vertical back porch
localparam VR = 2;     // Vertical sync pulse (retrace)
localparam VT = VD + VF + VB + VR;  // Total vertical lines = 525

// -------------------- Internal Signals
reg [1:0] q_reg;                    // Clock divider for 25 MHz pixel tick
wire tick_25M;                      // One tick every 4 system clocks (assuming 100MHz input)
wire [10:0] x, y;                   // Current pixel position
wire hsync_i, vsync_i;              // Internal sync signals
wire video_on_i;                    // True if current pixel is in visible area

reg [CD-1:0] rgb_reg;               // Pixel data register
reg hsync_reg, vsync_reg;          // Sync signal registers

// -------------------- Clock Divider: Generate 25 MHz Pixel Tick (mod-4 counter)
always @(posedge clk)
    q_reg <= q_reg + 1;

assign tick_25M = (q_reg == 2'b11) ? 1'b1 : 1'b0;

// -------------------- Frame Counter (tracks current x and y positions)
frame_counter #(
    .HMAX(HT), 
    .VMAX(VT)
) frame_unit (
    .clk(clk),
    .reset(reset),
    .sync_clr(1'b0),        // No synchronous clear
    .hcount(x),
    .vcount(y),
    .inc(tick_25M),         // Advance counters on 25MHz pixel tick
    .frame_start(),         // (Unused)
    .frame_end()            // (Unused)
);

// -------------------- Sync Signal Generation
assign hsync_i = (x >= (HD + HF) && x <= (HD + HF + HR - 1)) ? 1'b0 : 1'b1;  // Active-low
assign vsync_i = (y >= (VD + VF) && y <= (VD + VF + VR - 1)) ? 1'b0 : 1'b1;  // Active-low

// -------------------- Video Enable: Only active in visible area
assign video_on_i = (x < HD) && (y < VD);

// -------------------- VGA Output Registers (synchronous to clk)
always @(posedge clk) begin
    hsync_reg <= hsync_i;
    vsync_reg <= vsync_i;

    if (video_on_i)
        rgb_reg <= vga_si_rgb;    // Pass through pixel color
    else
        rgb_reg <= {CD{1'b0}};    // Output black when outside visible area
end

// -------------------- Outputs
assign hsync = hsync_reg;
assign vsync = vsync_reg;
assign rgb   = rgb_reg;
assign hc    = x;
assign vc    = y;

endmodule