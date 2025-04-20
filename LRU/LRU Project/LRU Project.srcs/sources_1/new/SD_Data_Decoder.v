`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2025 03:31:43 PM
// Design Name: 
// Module Name: SD_Data_Decoder
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


module SD_Data_Decoder(
    //General
    input wire clk,
    output wire [15:0]  led,
    //Parsed LRU Values
    output reg [16:0] LRUTag,
    output reg [10:0] LRUIndex,
    output reg LRULoadStore,
    output reg [20:0] LRUInst,




    output reg LRULineReady,
    //SD Ports
    input wire          rstn,
    input  wire         clk_sd, // clock = 50MHz
    input  wire         resetn, // rstn active-low, You can re-read SDcard by pushing the reset button.
    output wire         sdclk, // signals connect to SD bus
    inout               sdcmd,
    input  wire         sddat0,
    output wire         uart_tx // UART tx signal, connected to host-PC's UART-RXD, baud=115200



);



wire [7:0] CurrNum;
wire CurrFlag;

reg [127:0] CurrentLine;
reg [127:0] LRUParse;
reg [60:0] ParseIT;
reg [27:0] LRUAddr;

reg [15:0] debugLED;
reg [60:0] count;
wire [15:0] sd_emptyLED;

//assign led = debugLED;

initial begin
    LRUTag = 0;
    LRUIndex = 0;
    LRULoadStore = 0;
    LRUInst = 0;
    LRULineReady = 0;

    CurrentLine = 0;
    LRUParse = 0;
    ParseIT = 0;
    LRUAddr = 0;
    count = 0; 
    debugLED = 0;
end

sd_file_reader #(
    .FILE_NAME_LEN    ( 9             ),  // the length of "example.txt" (in bytes)
    .FILE_NAME        ( "art.trace"  ),  // file name to read
    .CLK_DIV          ( 2              )   // because clk=50MHz, CLK_DIV must ≥2
) u_sd_file_reader (
    //.start            (start           ),
    .rstn             ( rstn           ),
    .clk              ( clk_sd            ),
    .sdclk            ( sdclk          ),
    .sdcmd            ( sdcmd          ),
    .sddat0           ( sddat0         ),
    //.card_stat        ( sd_emptyLED[3:0]       ),  // show the sdcard initialize status
    //.card_type        ( sd_emptyLED[5:4]       ),  // 0=UNKNOWN    , 1=SDv1    , 2=SDv2  , 3=SDHCv2
    //.filesystem_type  ( sd_emptyLED[7:6]       ),  // 0=UNASSIGNED , 1=UNKNOWN , 2=FAT16 , 3=FAT32 
    //.file_found       ( sd_emptyLED[8]       ),  // 0=file not found, 1=file found
    .outen            (CurrFlag         ),
    .outbyte          (CurrNum       )
);

localparam [2:0] READLINE = 3'b000, PARSE = 3'b001, PARSEADDR = 3'b010, WAIT = 3'b011, DISPLAY = 3'b110;
reg [2:0] current_state, next_state;

always@(posedge clk_sd) begin
    current_state <= next_state;
end

always@(posedge clk_sd) begin
    case(current_state)
        READLINE: begin
            if(CurrFlag) begin
                if(CurrNum != 8'h0a) begin
                    LRUParse = LRUParse << 8;
                    LRUParse = LRUParse + CurrNum;
                end else begin 
                    next_state = PARSE;
                end
            end
        end 
        PARSE: begin
            //LRUParse = 128'h23203020333031396236633820313237;
            LRUInst = LRUParse[3:0];    //parsing instruction count
            
            if(LRUParse[119:112] !=  8'b0) begin
                if(LRUParse[127:120] != 8'b0) begin //three digit instruction count
                    LRUInst = LRUInst + (LRUParse[19:16] * 100 + LRUParse[11:8] * 10);
                    LRUParse = LRUParse >> 16;
                end else begin                           //two digit instruction count
                LRUInst = LRUInst + (LRUParse[11:8] * 10);
                LRUParse = LRUParse >> 8;
                end
            end
            
            LRULoadStore = LRUParse[88]; //parsing loadstore
            next_state = PARSEADDR;
        end 
        PARSEADDR: begin
            if (LRUParse[71:64] != 8'h20) begin //checking position of the space          
               
                if(LRUParse[87:80] != 8'h20) begin //don't shift for first addr byte
                    LRUAddr = LRUAddr << 4;
                end 
                LRUAddr = LRUAddr + LRUParse[75:72];    //add current digit
                if (LRUParse[79:76] == 4'b0110) begin //adjusting if it's a letter (hex char)
                    LRUAddr = LRUAddr + 9;
                end
                LRUParse = LRUParse << 8;
                next_state = PARSEADDR;
            end else begin next_state = DISPLAY; end
        end 
        WAIT: begin
            next_state = WAIT;
        end
        DISPLAY: begin
            LRUTag = LRUAddr[27:11];
            LRUIndex = LRUAddr[10:0];
            //debugLED[15:0] = LRUAddr[15:0]; //should be 9b6c
            LRULineReady = 1;
            next_state = WAIT;
        end 
        default: next_state = READLINE;
    endcase
end
    
    
/*always@(posedge clk) begin
    
    if(LRULineReady) begin
        
        if (count < 8) begin
            if(count == 0)begin
                CurrentLine = LRUParse;
                LRUInst = CurrentLine[3:0];    //parsing instruction count
                
                if(CurrentLine[119:112] !=  8'b0)begin
                    if(CurrentLine[127:120] != 8'b0) begin //three digit instruction count
                        LRUInst = LRUInst + (CurrentLine[19:16] * 100 + CurrentLine[11:8] * 10);
                        CurrentLine = CurrentLine >> 16;
                    end else begin                           //two digit instruction count
                        LRUInst = LRUInst + (CurrentLine[11:8] * 10);
                        CurrentLine = CurrentLine >> 8;
                    end
                end           
                
                LRULoadStore = CurrentLine[88]; //parsing loadstore
            end
            
            if(ParseIT < 7) begin  //parsing address
                LRUAddr = LRUAddr + CurrentLine[75:72];
                if (CurrentLine[79:76] == 4'b0110) begin //adjusting if it's a letter (hex char)
                    LRUAddr = LRUAddr + 9;
                end
                CurrentLine = CurrentLine << 8;
                LRUAddr = LRUAddr << 4;
                ParseIT = ParseIT + 1; 
            end
            if(count == 7)begin
                LRUTag = LRUAddr[27:11];
                LRUIndex = LRUAddr[10:0];
                
                if (~LRULoadStore) begin
                    debugLED[15] = 1;
                end
                if (LRUTag == 20'h18031) begin
                    debugLED[14] = 1;
                end
                if (LRUIndex == 12'h361) begin
                    debugLED[13] = 1;
                end
                
                debugLED[10:0] = LRUIndex;
            end
            count = count + 1;
        end
    end
end*/

endmodule
