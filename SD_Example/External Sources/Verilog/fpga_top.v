
//--------------------------------------------------------------------------------------------------------
// Module  : fpga_top
// Type    : synthesizable, FPGA's top, IP's example design
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: an example of sd_file_reader, read a file from SDcard and send file content to UART
//           this example runs on Digilent Nexys4-DDR board (Xilinx Artix-7),
//           see http://www.digilent.com.cn/products/product-nexys-4-ddr-artix-7-fpga-trainer-board.html
//--------------------------------------------------------------------------------------------------------

module fpga_top (
    // clock = 100MHz
    input  wire         clk100mhz,
    // rstn active-low, You can re-read SDcard by pushing the reset button.
    input  wire         resetn,
    // when sdcard_pwr_n = 0, SDcard power on
    output wire         sdcard_pwr_n,
    // signals connect to SD bus
    output wire         sdclk,
    inout               sdcmd,
    input  wire         sddat0,
    output wire         sddat1, sddat2, sddat3,
    // 16 bit led to show the status of SDcard
    output wire [15:0]  led,
    // UART tx signal, connected to host-PC's UART-RXD, baud=115200
    output wire         uart_tx,
    // Output to RGB Leds for File Complete and File Found
    output wire [2:0] rgb_led,
    output wire [2:0] rgb_led2
);



assign sdcard_pwr_n = 1'b0;                  // keep SDcard power-on

assign {sddat1, sddat2, sddat3} = 3'b111;    // Must set sddat1~3 to 1 to avoid SD card from entering SPI mode



//----------------------------------------------------------------------------------------------------
// generate 50MHz clk from 100MHz clk
//----------------------------------------------------------------------------------------------------
wire       clk;
wire       rstn;



//----------------------------------------------------------------------------------------------------
// sd_file_reader
//----------------------------------------------------------------------------------------------------
wire       outen;     // when outen=1, a byte of file content is read out from outbyte
wire [7:0] outbyte;   // a byte of file content

wire endFile; // Flag used to indicate end of file reached


sd_file_reader #(
    .FILE_NAME_LEN    ( 10             ),  // the length of "wxwxwx.txt" (in bytes)
    .FILE_NAME        ( "wxwxwx.txt"  ),  // file name to read
    .CLK_DIV          ( 3              )   // because clk=100MHz, CLK_DIV must ≥3
) u_sd_file_reader (
    .rstn             ( resetn           ),
    .clk              ( clk100mhz            ),
    .sdclk            ( sdclk          ),
    .sdcmd            ( sdcmd          ),
    .sddat0           ( sddat0         ),
//    .card_stat        ( led[3:0]       ),  // show the sdcard initialize status
//    .card_type        ( led[5:4]       ),  // 0=UNKNOWN    , 1=SDv1    , 2=SDv2  , 3=SDHCv2
//    .filesystem_type  ( led[7:6]       ),  // 0=UNASSIGNED , 1=UNKNOWN , 2=FAT16 , 3=FAT32 
    .file_found       ( rgb_led2[2]       ),  // 0=file not found, 1=file found
    .outen            ( outen          ),
    .outbyte          ( outbyte        ),
    .endFile(endFile)
);


//----------------------------------------------------------------------------------------------------
// send file content to UART
//----------------------------------------------------------------------------------------------------
//uart_tx #(
//    .CLK_FREQ                  ( 100000000             ),    // clk is 100MHz
//    .BAUD_RATE                 ( 115200               ),
//    .PARITY                    ( "NONE"               ),
//    .STOP_BITS                 ( 4                    ),
//    .BYTE_WIDTH                ( 1                    ),
//    .FIFO_EA                   ( 14                   ),
//    .EXTRA_BYTE_AFTER_TRANSFER ( ""                   ),
//    .EXTRA_BYTE_AFTER_PACKET   ( ""                   )
//) u_uart_tx (
//    .rstn                      ( rstn                 ),
//    .clk                       ( clk                  ),
//    .i_tready                  (                      ),
//    .i_tvalid                  ( outen                ),
//    .i_tdata                   ( outbyte              ),
//    .i_tkeep                   ( 1'b1                 ),
//    .i_tlast                   ( 1'b0                 ),
//    .o_uart_tx                 ( uart_tx              )
//);



//----------------------------------------------------------------------------------------------------
// send file content to char counter
//----------------------------------------------------------------------------------------------------
sd_example u_sd_example(
    .clk(clk100mhz),
    .led(led),
    .rgb_led(rgb_led),
    .rstn(resetn),
    .outen(outen),
    .outbyte(outbyte),
    .endFile(endFile)
);


endmodule
