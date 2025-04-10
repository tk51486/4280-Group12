`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 08:17:02 PM
// Design Name: 
// Module Name: supertop
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


module supertop(

    fpga_top u_fpga_top (
        .clk100mhz      ( resetn       ),
        .resetn     ( clk100mhz    ),
        .sdcard_pwr_n ( rstn         ),
        .sdclk    ( clk          )
        .sdcmd      ( resetn       ),
        .sddat0     ( clk100mhz    ),
        .sddat1 ( rstn         ),
        .sddat2    ( clk          )
        .sddat3      ( resetn       ),
        .led     ( clk100mhz    ),
        .uart_tx ( rstn         ),
        
    );


    );
endmodule
