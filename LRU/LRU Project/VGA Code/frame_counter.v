module frame_counter #(
    parameter HMAX = 640,  // Maximum horizontal pixel count (usually total horizontal pixels)
    parameter VMAX = 480   // Maximum vertical line count (usually total vertical lines)
)(
    input clk,                  // System clock
    input reset,                // Asynchronous reset
    input inc,                  // Increment signal (typically 1 pulse per pixel)
    input sync_clr,            // Synchronous clear (optional global reset for counters)
    output reg [10:0] hcount,   // Current horizontal pixel count
    output reg [10:0] vcount,   // Current vertical line count
    output wire frame_start,    // Asserted at the beginning of each frame
    output wire frame_end       // Asserted at the end of each frame
);

    // Internal next-state variables
    reg [10:0] hc_next;
    reg [10:0] vc_next;

    // -------------------- Sequential logic for pixel and line counters
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Asynchronous reset
            hcount <= 0;
            vcount <= 0;
        end
        else if (sync_clr) begin
            // Optional synchronous clear
            hcount <= 0;
            vcount <= 0;
        end
        else begin
            // Load next state values
            hcount <= hc_next;
            vcount <= vc_next;
        end
    end

    // -------------------- Next-state logic for horizontal counter
    always @* begin
        if (inc) begin
            if (hcount == HMAX - 1)
                hc_next = 0;             // Wrap around at max horizontal
            else
                hc_next = hcount + 1;    // Otherwise just increment
        end
        else
            hc_next = hcount;           // Hold value if not incrementing
    end

    // -------------------- Next-state logic for vertical counter
    always @* begin
        if (inc && (hcount == HMAX - 1)) begin
            if (vcount == VMAX - 1)
                vc_next = 0;             // Wrap around at max vertical
            else
                vc_next = vcount + 1;    // Only increment at end of each line
        end
        else
            vc_next = vcount;           // Hold value if not incrementing or not end-of-line
    end

    // -------------------- Frame signals
    assign frame_start = (hcount == 0) && (vcount == 0);                      // Start of frame
    assign frame_end = (hcount == HMAX - 1) && (vcount == VMAX - 1);         // End of frame

endmodule