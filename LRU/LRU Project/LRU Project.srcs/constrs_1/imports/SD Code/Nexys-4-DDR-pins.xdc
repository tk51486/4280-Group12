
## Clock
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk100mhz]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk100mhz]


set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS33} [get_ports resetn]

## LEDs
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {led[3]}]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports {led[4]}]
set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {led[5]}]
set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {led[6]}]
set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {led[7]}]
set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {led[8]}]
set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {led[9]}]
set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {led[10]}]
set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {led[11]}]
set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {led[12]}]
set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {led[13]}]
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {led[14]}]
set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS33} [get_ports {led[15]}]


# UART
set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS33} [get_ports uart_tx]


# SDcard
set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS33} [get_ports sdcard_pwr_n]
#set_property -dict { PACKAGE_PIN A1    IOSTANDARD LVCMOS33 } [get_ports { sd_cd }];          #IO_L9N_T1_DQS_AD7N_35 Sch=sd_cd
set_property -dict {PACKAGE_PIN B1 IOSTANDARD LVCMOS33} [get_ports sdclk]
set_property -dict {PACKAGE_PIN C1 IOSTANDARD LVCMOS33} [get_ports sdcmd]
set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS33} [get_ports sddat0]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS33} [get_ports sddat1]
set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS33} [get_ports sddat2]
set_property -dict {PACKAGE_PIN D2 IOSTANDARD LVCMOS33} [get_ports sddat3]


#connect_debug_port u_ila_0/probe1 [get_nets [list {u_uart_tx/data[0]} {u_uart_tx/data[1]} {u_uart_tx/data[2]} {u_uart_tx/data[3]} {u_uart_tx/data[4]} {u_uart_tx/data[5]} {u_uart_tx/data[6]} {u_uart_tx/data[7]}]]


#connect_debug_port u_ila_0/probe1 [get_nets [list {nolabel_line101/finalco_reg_rep[0]} {nolabel_line101/finalco_reg_rep[1]} {nolabel_line101/finalco_reg_rep[2]} {nolabel_line101/finalco_reg_rep[3]} {nolabel_line101/finalco_reg_rep[4]} {nolabel_line101/finalco_reg_rep[5]} {nolabel_line101/finalco_reg_rep[6]} {nolabel_line101/finalco_reg_rep[7]} {nolabel_line101/finalco_reg_rep[8]} {nolabel_line101/finalco_reg_rep[9]} {nolabel_line101/finalco_reg_rep[10]} {nolabel_line101/finalco_reg_rep[11]} {nolabel_line101/finalco_reg_rep[12]} {nolabel_line101/finalco_reg_rep[13]} {nolabel_line101/finalco_reg_rep[14]} {nolabel_line101/finalco_reg_rep[15]}]]
#connect_debug_port u_ila_0/probe2 [get_nets [list {nolabel_line101/bufco_reg__0[16]} {nolabel_line101/bufco_reg__0[17]} {nolabel_line101/bufco_reg__0[18]} {nolabel_line101/bufco_reg__0[19]} {nolabel_line101/bufco_reg__0[20]} {nolabel_line101/bufco_reg__0[21]} {nolabel_line101/bufco_reg__0[22]} {nolabel_line101/bufco_reg__0[23]} {nolabel_line101/bufco_reg__0[24]} {nolabel_line101/bufco_reg__0[25]} {nolabel_line101/bufco_reg__0[26]} {nolabel_line101/bufco_reg__0[27]} {nolabel_line101/bufco_reg__0[28]} {nolabel_line101/bufco_reg__0[29]} {nolabel_line101/bufco_reg__0[30]} {nolabel_line101/bufco_reg__0[31]} {nolabel_line101/bufco_reg__0[32]}]]
#connect_debug_port u_ila_0/probe3 [get_nets [list {nolabel_line101/bufco_reg[0]} {nolabel_line101/bufco_reg[1]} {nolabel_line101/bufco_reg[2]} {nolabel_line101/bufco_reg[3]} {nolabel_line101/bufco_reg[4]} {nolabel_line101/bufco_reg[5]} {nolabel_line101/bufco_reg[6]} {nolabel_line101/bufco_reg[7]} {nolabel_line101/bufco_reg[8]} {nolabel_line101/bufco_reg[9]} {nolabel_line101/bufco_reg[10]} {nolabel_line101/bufco_reg[11]} {nolabel_line101/bufco_reg[12]} {nolabel_line101/bufco_reg[13]} {nolabel_line101/bufco_reg[14]} {nolabel_line101/bufco_reg[15]}]]
#connect_debug_port u_ila_0/probe4 [get_nets [list {nolabel_line101/finalco_reg[0]} {nolabel_line101/finalco_reg[1]} {nolabel_line101/finalco_reg[2]} {nolabel_line101/finalco_reg[3]} {nolabel_line101/finalco_reg[4]} {nolabel_line101/finalco_reg[5]} {nolabel_line101/finalco_reg[6]} {nolabel_line101/finalco_reg[7]} {nolabel_line101/finalco_reg[8]} {nolabel_line101/finalco_reg[9]} {nolabel_line101/finalco_reg[10]} {nolabel_line101/finalco_reg[11]} {nolabel_line101/finalco_reg[12]} {nolabel_line101/finalco_reg[13]} {nolabel_line101/finalco_reg[14]} {nolabel_line101/finalco_reg[15]}]]
#connect_debug_port u_ila_0/probe5 [get_nets [list {nolabel_line101/counter_reg[0]} {nolabel_line101/counter_reg[1]} {nolabel_line101/counter_reg[2]} {nolabel_line101/counter_reg[3]} {nolabel_line101/counter_reg[4]} {nolabel_line101/counter_reg[5]} {nolabel_line101/counter_reg[6]} {nolabel_line101/counter_reg[7]} {nolabel_line101/counter_reg[8]} {nolabel_line101/counter_reg[9]} {nolabel_line101/counter_reg[10]} {nolabel_line101/counter_reg[11]} {nolabel_line101/counter_reg[12]} {nolabel_line101/counter_reg[13]} {nolabel_line101/counter_reg[14]} {nolabel_line101/counter_reg[15]} {nolabel_line101/counter_reg[16]} {nolabel_line101/counter_reg[17]} {nolabel_line101/counter_reg[18]} {nolabel_line101/counter_reg[19]} {nolabel_line101/counter_reg[20]} {nolabel_line101/counter_reg[21]} {nolabel_line101/counter_reg[22]} {nolabel_line101/counter_reg[23]} {nolabel_line101/counter_reg[24]} {nolabel_line101/counter_reg[25]} {nolabel_line101/counter_reg[26]} {nolabel_line101/counter_reg[27]}]]
#connect_debug_port u_ila_0/probe6 [get_nets [list {nolabel_line101/extra[0]} {nolabel_line101/extra[1]} {nolabel_line101/extra[2]} {nolabel_line101/extra[3]}]]

#connect_debug_port u_ila_0/probe1 [get_nets [list {nolabel_line101/extra_reg[3]_0[0]} {nolabel_line101/extra_reg[3]_0[1]} {nolabel_line101/extra_reg[3]_0[2]} {nolabel_line101/extra_reg[3]_0[3]}]]
#connect_debug_port u_ila_0/probe2 [get_nets [list {nolabel_line101/check[0]} {nolabel_line101/check[1]} {nolabel_line101/check[2]} {nolabel_line101/check[3]}]]
#connect_debug_port u_ila_0/probe4 [get_nets [list {nolabel_line101/p_0_in[0]} {nolabel_line101/p_0_in[1]} {nolabel_line101/p_0_in[2]} {nolabel_line101/p_0_in[3]} {nolabel_line101/p_0_in[4]} {nolabel_line101/p_0_in[5]} {nolabel_line101/p_0_in[6]} {nolabel_line101/p_0_in[7]} {nolabel_line101/p_0_in[8]} {nolabel_line101/p_0_in[9]} {nolabel_line101/p_0_in[10]} {nolabel_line101/p_0_in[11]} {nolabel_line101/p_0_in[12]} {nolabel_line101/p_0_in[13]} {nolabel_line101/p_0_in[14]} {nolabel_line101/p_0_in[15]} {nolabel_line101/p_0_in[16]} {nolabel_line101/p_0_in[17]} {nolabel_line101/p_0_in[18]} {nolabel_line101/p_0_in[19]} {nolabel_line101/p_0_in[20]} {nolabel_line101/p_0_in[21]} {nolabel_line101/p_0_in[22]} {nolabel_line101/p_0_in[23]} {nolabel_line101/p_0_in[24]} {nolabel_line101/p_0_in[25]} {nolabel_line101/p_0_in[26]} {nolabel_line101/p_0_in[27]}]]
#connect_debug_port u_ila_0/probe5 [get_nets [list {nolabel_line101/counter[0]} {nolabel_line101/counter[1]} {nolabel_line101/counter[2]} {nolabel_line101/counter[3]} {nolabel_line101/counter[4]} {nolabel_line101/counter[5]} {nolabel_line101/counter[6]} {nolabel_line101/counter[7]} {nolabel_line101/counter[8]} {nolabel_line101/counter[9]} {nolabel_line101/counter[10]} {nolabel_line101/counter[11]} {nolabel_line101/counter[12]} {nolabel_line101/counter[13]} {nolabel_line101/counter[14]} {nolabel_line101/counter[15]} {nolabel_line101/counter[16]} {nolabel_line101/counter[17]} {nolabel_line101/counter[18]} {nolabel_line101/counter[19]} {nolabel_line101/counter[20]} {nolabel_line101/counter[21]} {nolabel_line101/counter[22]} {nolabel_line101/counter[23]} {nolabel_line101/counter[24]} {nolabel_line101/counter[25]} {nolabel_line101/counter[26]}]]


