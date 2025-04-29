`timescale 1ns / 1ps
//this module interacts directly with the SD example. it recieves each character in the file via an ascii byte.
//once a line has been sent, it parses the bytes to send LRU values to the cache controller. the files from the SD
//example can be found in this folder, "SD Code"

module SD_Data_Decoder(
    //General
    input wire start,
    
    input wire clk,
    output wire [15:0]  led,
    //Parsed LRU Values
    output reg [16:0] LRUTag,
    output reg [10:0] LRUIndex,
    output reg LRULoadStore,
    output reg [20:0] LRUInst,
    output reg [31:0] instTotal,

    //end of file flag, used for VGA
    output wire endFile,
    //flag detected in cache
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
//byte from SD    
wire [7:0] CurrNum;
//enable from SD    
wire CurrFlag;
//up to 16 bytes in each line    
reg [127:0] LRUParse;
//address, ignores offset. broken into tag and index before outputting    
reg [27:0] LRUAddr;
//increments instruction total    
reg [31:0] instTotal;

reg [15:0] debugLED;

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
    //.card_stat        ( led[3:0]       ),  // show the sdcard initialize status
    //.card_type        ( led[5:4]       ),  // 0=UNKNOWN    , 1=SDv1    , 2=SDv2  , 3=SDHCv2
    //.filesystem_type  ( led[7:6]       ),  // 0=UNASSIGNED , 1=UNKNOWN , 2=FAT16 , 3=FAT32 
    //.file_found       ( led[8]       ),  // 0=file not found, 1=file found
    .endFile (endFile),
    .outen            (CurrFlag         ),
    .outbyte          (CurrNum       ),
    .start(start)
);

//defining states and state registers    
localparam [2:0] READLINE = 3'b000, PARSE = 3'b001, PARSEADDR = 3'b010, WAIT = 3'b011, DISPLAY = 3'b100, STOP = 3'b101;
reg [2:0] current_state, next_state;

initial begin
    LRUTag = 0;
    LRUIndex = 0;
    LRULoadStore = 0;
    LRUInst = 0;
    LRULineReady = 0;
    instTotal = 0;
    
    LRUParse = 0;
    LRUAddr = 0;
    debugLED = 0;
end

//state register    
always@(posedge clk_sd) begin
    current_state <= next_state;
end

//next-state logic    
always@(posedge clk_sd) begin

    case(current_state)
        READLINE: begin
            if(CurrFlag) begin //if SD send a char,
                if(CurrNum != 8'h0a) begin //if not end of line,
                    LRUParse = LRUParse << 8;
                    LRUParse = LRUParse + CurrNum; //shift to store each byte in order. wait for next char
                end else begin //if so, begin parsing
                    next_state = PARSE;
                end
            end
        end 
        PARSE: begin //parse instruction count and loadstore
            LRUInst = LRUParse[3:0];    //parsing instruction count
            
            if(LRUParse[119:112] !=  8'b0) begin
                if(LRUParse[127:120] != 8'b0) begin //three digit instruction count
                    LRUInst = LRUInst + (LRUParse[19:16] * 100 + LRUParse[11:8] * 10); //adding up decimal values
                    LRUParse = LRUParse >> 16; //shifting to adjust for address
                end else begin //two digit instruction count
                    LRUInst = LRUInst + (LRUParse[11:8] * 10); //adding up decimal values
                LRUParse = LRUParse >> 8; //shifting to adjust for address
                end
            end
            
            LRULoadStore = LRUParse[88]; //parsing loadstore
            next_state = PARSEADDR;
        end 
        PARSEADDR: begin //parsing address
            instTotal = instTotal + LRUInst; //increment instruction total
            if (LRUParse[71:64] != 8'h20) begin //checking if parsing is done          
               
                if(LRUParse[87:80] != 8'h20) begin //don't shift for first addr byte
                    LRUAddr = LRUAddr << 4; //otherwise, shift address to store each hex number
                end 
                LRUAddr = LRUAddr + LRUParse[75:72];    //add current digit
                if (LRUParse[79:76] == 4'b0110) begin //adjusting if it's a letter (hex char)
                    LRUAddr = LRUAddr + 9;
                end
                LRUParse = LRUParse << 8; //shift left for next char
                next_state = PARSEADDR;
            end else begin next_state = DISPLAY; end //if parsing is done, next state
        end 
        WAIT: begin //for debugging, unused
            next_state = WAIT;
        end
        DISPLAY: begin
            LRUTag = LRUAddr[27:11]; //break address into tag and index
            LRUIndex = LRUAddr[10:0];
            LRULineReady = 1; //set flag for cache controller
            next_state = STOP;
        end 
        STOP: begin
            LRULineReady = 0; //clear flag, wait for next line
            next_state = READLINE;
        end
        default: next_state = READLINE; //default state
    endcase
end
    
endmodule
