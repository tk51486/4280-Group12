module frame_counter #(
    parameter HMAX = 640,  
    parameter VMAX = 480  
)(
    input clk,                 
    input reset,                
    input inc,                  
    input sync_clr,            
    output reg [10:0] hcount,   
    output reg [10:0] vcount,   
    output wire frame_start,    
    output wire frame_end       
);

    reg [10:0] hc_next;
    reg [10:0] vc_next;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            hcount <= 0;
            vcount <= 0;
        end
        else if (sync_clr) begin
            hcount <= 0;
            vcount <= 0;
        end
        else begin
            hcount <= hc_next;
            vcount <= vc_next;
        end
    end

    always @* begin
        if (inc) begin
            if (hcount == HMAX - 1)
                hc_next = 0;            
            else
                hc_next = hcount + 1;    
        end
        else
            hc_next = hcount;          
    end

    always @* begin
        if (inc && (hcount == HMAX - 1)) begin
            if (vcount == VMAX - 1)
                vc_next = 0;             
            else
                vc_next = vcount + 1;    
        end
        else
            vc_next = vcount;           
    end

    assign frame_start = (hcount == 0) && (vcount == 0);                      
    assign frame_end = (hcount == HMAX - 1) && (vcount == VMAX - 1);        

endmodule
