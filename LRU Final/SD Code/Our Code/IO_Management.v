
//this module calls the SD decoder and the VGA, it also passes stats to the VGA from the cache controller

module IO_Management (
    //General
    input wire clk,
    input wire start,
    output wire [15:0]  led, // 16 bit led
    //Stats Tracked
    input wire [31:0] accessesTotal,
    input wire [31:0] evictionTotal,
    input wire [31:0] writeHitTotal,
    input wire [31:0] readHitTotal,
    input wire [31:0] writeMissTotal,
    input wire [31:0] readMissTotal,
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

//flag that determines when the SD reader is done. used to update the VGA once    
wire endFile;
//instruction total is calculated in SD decoder    
wire [31:0] instTotal;

    
SD_Data_Decoder u_SD_Data_Decoder(
    .clk(clk),
    .led(led),
    
    .start(start),
    
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
