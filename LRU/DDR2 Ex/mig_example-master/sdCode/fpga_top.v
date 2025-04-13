
//--------------------------------------------------------------------------------------------------------
// Module  : fpga_top
// Type    : synthesizable, FPGA's top, IP's example design
// Standard: Verilog 2001 (IEEE1364-2001)
// Function: an example of sd_file_reader, read a file from SDcard and send file content to UART
//           this example runs on Digilent Nexys4-DDR board (Xilinx Artix-7),
//           see http://www.digilent.com.cn/products/product-nexys-4-ddr-artix-7-fpga-trainer-board.html
//--------------------------------------------------------------------------------------------------------

module fpga_top (
    output wire [7:0] CurrNum,
    output wire CurrFlag,
    input wire rstn,
    // clock = 100MHz
    input  wire         clk_sd,
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
    output wire         uart_tx
);



assign sdcard_pwr_n = 1'b0;                  // keep SDcard power-on

assign {sddat1, sddat2, sddat3} = 3'b111;    // Must set sddat1~3 to 1 to avoid SD card from entering SPI mode


//assign led[15:11] = 1;
//----------------------------------------------------------------------------------------------------
// generate 50MHz clk from 100MHz clk
//----------------------------------------------------------------------------------------------------
wire [8:0] nothing;




//----------------------------------------------------------------------------------------------------
// sd_file_reader
//----------------------------------------------------------------------------------------------------
//wire       outen;     // when outen=1, a byte of file content is read out from outbyte
//wire [7:0] outbyte;   // a byte of file content

sd_file_reader #(
    .FILE_NAME_LEN    ( 9             ),  // the length of "example.txt" (in bytes)
    .FILE_NAME        ( "art.trace"  ),  // file name to read
    .CLK_DIV          ( 2              )   // because clk=50MHz, CLK_DIV must ≥2
) u_sd_file_reader (
    .rstn             ( rstn           ),
    .clk              ( clk_sd            ),
    .sdclk            ( sdclk          ),
    .sdcmd            ( sdcmd          ),
    .sddat0           ( sddat0         ),
    .card_stat        ( nothing[3:0]       ),  // show the sdcard initialize status
    .card_type        ( nothing[5:4]       ),  // 0=UNKNOWN    , 1=SDv1    , 2=SDv2  , 3=SDHCv2
    .filesystem_type  ( nothing[7:6]       ),  // 0=UNASSIGNED , 1=UNKNOWN , 2=FAT16 , 3=FAT32 
    .file_found       ( nothing[8]       ),  // 0=file not found, 1=file found
    .outen            (CurrFlag         ),
    .outbyte          (CurrNum       )
);

//assign led[15:11] = outbyte[3:0];

//----------------------------------------------------------------------------------------------------
// send file content to UART
//----------------------------------------------------------------------------------------------------
/*uart_tx #(
    .CLK_FREQ                  ( 50000000             ),    // clk is 50MHz
    .BAUD_RATE                 ( 115200               ),
    .PARITY                    ( "NONE"               ),
    .STOP_BITS                 ( 2                    ),
    .BYTE_WIDTH                ( 1                    ),
    .FIFO_EA                   ( 18                   ),
    .EXTRA_BYTE_AFTER_TRANSFER ( ""                   ),
    .EXTRA_BYTE_AFTER_PACKET   ( ""                   )
) u_uart_tx (
    .rstn                      ( rstn                 ),
    .clk                       ( clk                  ),
    .i_tready                  (                      ),
    .i_tvalid                  ( outen                ),
    .i_tdata                   ( outbyte              ),
    .i_tkeep                   ( 1'b1                 ),
    .i_tlast                   ( 1'b0                 ),
    .o_uart_tx                 ( uart_tx              )
);
*/
//sd_test(
    //.SendAway (CurrNum),
//    .SendFlag (CurrFlag),
//    .currentNum(outbyte),
//    .clk(clk_sd),
//    .led(led)
//);


endmodule
