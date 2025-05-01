`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2025 10:39:53 PM
// Design Name: 
// Module Name: sd_example
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sd_example(
    // Physical ports utilized from board
    input wire clk,
    output wire [15:0] led,
    output wire [2:0] rgb_led,
    input wire rstn,
    // Values passed from sd file reader
    input wire endFile,
    input wire outen,
    input wire [7:0] outbyte
);

// Char that will be checked for in the file in ASCII encoding
reg [7:0] targetChar;
initial targetChar = 8'b01100101; //Change this to check different characters

// Counter used to count number of instances for targetChar
reg [15:0] numCounter, counterNext;

//Initializing values
initial numCounter = 0;
initial counterNext = 0;


// State machine variables
localparam READFILE = 1'b0, FILEDONE = 1'b1;
reg current_state, next_state;


// Setting RGB Led
reg rgbUpdate;
initial rgbUpdate = 0;
assign rgb_led[0] = rgbUpdate;
assign rgb_led[1] = (~rgbUpdate);


// Setting Leds equal to number of targetChar instances
assign led = numCounter;

always @(posedge clk or negedge rstn) begin
    // Reset to default value of counter and state machine
    if(~rstn) begin
        numCounter = 0;
        current_state = READFILE;
    end
    // Setting variables on a Flip Flop
    else begin
        numCounter <= counterNext;
        current_state <= next_state;
    end
end

always @(*) begin
    counterNext = numCounter;
    case(current_state)
        // Reading state
        READFILE: begin
            next_state = READFILE;
            // Check if next char has been read 
            if(outen) begin
                // If char read is equal to targetChar increase counter
                if(outbyte == targetChar) begin
                    counterNext = numCounter + 1;
                end
            end
            // If done parsing file move to FILEDONE state
            if(endFile) begin
                next_state = FILEDONE;
            end 
            // Set RGB Led to red if still reading
            rgbUpdate = 1;
        end
        // Done reading state
        FILEDONE: begin
            // Set RGB Led to green if done reading
            rgbUpdate = 0;
        end
        default: next_state = READFILE; 
    endcase
end
endmodule
