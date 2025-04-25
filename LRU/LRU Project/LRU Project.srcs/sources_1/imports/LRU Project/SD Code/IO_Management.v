
//--------------------------------------------------------------------------------------------------------
// Module  : fpga_top
// Type    : synthesizable, FPGA's top, IP's example design
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: an example of sd_file_reader, read a file from SDcard and send file content to UART
//           this example runs on Digilent Nexys4-DDR board (Xilinx Artix-7),
//           see http://www.digilent.com.cn/products/product-nexys-4-ddr-artix-7-fpga-trainer-board.html
//--------------------------------------------------------------------------------------------------------

module IO_Management (
    //General
    input wire clk,
    //input wire start,
    output wire [15:0]  led, // 16 bit led
    //Stats Tracked
    input wire [31:0] accessesTotal,
    input wire [31:0] evictionTotal,
    input wire [31:0] writeHitTotal,
    input wire [31:0] readHitTotal,
    input wire [31:0] writeMissTotal,
    input wire [31:0] readMissTotal,
    //input wire [31:0] instTotal,
    input wire [31:0] hitTotal,
    input wire [31:0] missTotal,

    //Parsed Values
    output wire [16:0] LRUTag,
    output wire [10:0] LRUIndex,
    output wire LRULoadStore,
    output wire [20:0] LRUInst,
    output wire LRULineReady,
    //SD Ports
    input wire          rstn,
    input  wire         clk_sd, // clock = 100MHz
    input  wire         resetn, // rstn active-low, You can re-read SDcard by pushing the reset button.
    output wire         sdclk, // signals connect to SD bus
    inout               sdcmd,
    input  wire         sddat0,
    output wire         uart_tx, // UART tx signal, connected to host-PC's UART-RXD, baud=115200
    //VGA    
    output hsync, vsync,           // Horizontal and vertical sync
    output [11:0] rgb 
    
);

wire endFile;

wire [31:0] instTotal;

SD_Data_Decoder u_SD_Data_Decoder(
    .clk(clk),
    .led(led),
    
    .LRUTag(LRUTag),
    .LRUIndex(LRUIndex),
    .LRULoadStore(LRULoadStore),
    .LRUInst(LRUInst),
    .LRULineReady(LRULineReady),
    .instTotal(instTotal),
    
    .endFile(endFile),
    
    .clk_sd(clk_sd),
    .rstn(rstn),
    .resetn(resetn),
    .sdclk(sdclk),
    .sdcmd(sdcmd),
    .sddat0(sddat0),
    .uart_tx(uart_tx)
);

vga_demo u_vga_demo(
    .clk(clk),
    .hsync(hsync),
    .vsync(vsync),
    .rgb(rgb),
    .endFile(endFile),
    .instTotal(instTotal),
    .accessesTotal(accessesTotal),
    .evictionTotal(evictionTotal),
    .writeHitTotal(writeHitTotal),
    .readHitTotal(readHitTotal),
    .writeMissTotal(writeMissTotal),
    .readMissTotal(readMissTotal),
    .hitTotal(hitTotal),
    .missTotal(missTotal)
);

endmodule
