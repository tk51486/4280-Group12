module vga_sync_demo #(
    parameter CD = 12  
)(
    input clk, reset,                     
    input [CD-1:0] vga_si_rgb,            
    output hsync, vsync,              
    output [CD-1:0] rgb,              
    output [10:0] hc, vc                  
);


localparam HD = 640;   
localparam HF = 16;    
localparam HB = 48;    
localparam HR = 96;    
localparam HT = HD + HF + HB + HR;  

localparam VD = 480;   
localparam VF = 10;    
localparam VB = 33;    
localparam VR = 2;     
localparam VT = VD + VF + VB + VR;  


reg [1:0] q_reg;                    
wire tick_25M;                      
wire [10:0] x, y;                   
wire hsync_i, vsync_i;              
wire video_on_i;                    

reg [CD-1:0] rgb_reg;               
reg hsync_reg, vsync_reg;         


always @(posedge clk)
    q_reg <= q_reg + 1;

assign tick_25M = (q_reg == 2'b11) ? 1'b1 : 1'b0;


frame_counter #(
    .HMAX(HT), 
    .VMAX(VT)
) frame_unit (
    .clk(clk),
    .reset(reset),
    .sync_clr(1'b0),        
    .hcount(x),
    .vcount(y),
    .inc(tick_25M),         
    .frame_start(),         
    .frame_end()            
);


assign hsync_i = (x >= (HD + HF) && x <= (HD + HF + HR - 1)) ? 1'b0 : 1'b1;  
assign vsync_i = (y >= (VD + VF) && y <= (VD + VF + VR - 1)) ? 1'b0 : 1'b1;  
assign video_on_i = (x < HD) && (y < VD);

always @(posedge clk) begin
    hsync_reg <= hsync_i;
    vsync_reg <= vsync_i;

    if (video_on_i)
        rgb_reg <= vga_si_rgb;   
    else
        rgb_reg <= {CD{1'b0}}; 
end

assign hsync = hsync_reg;
assign vsync = vsync_reg;
assign rgb   = rgb_reg;
assign hc    = x;
assign vc    = y;

endmodule
