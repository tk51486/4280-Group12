## This file is a general .xdc for the Nexys4 DDR Rev. C
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
#set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports CLK100MHZ]

##Switches



## LEDs

#set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports {LED[0]}]
#set_property -dict {PACKAGE_PIN K15 IOSTANDARD LVCMOS33} [get_ports {LED[1]}]
#set_property -dict {PACKAGE_PIN J13 IOSTANDARD LVCMOS33} [get_ports {LED[2]}]
#set_property -dict {PACKAGE_PIN N14 IOSTANDARD LVCMOS33} [get_ports {LED[3]}]
#set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports {LED[4]}]
#set_property -dict {PACKAGE_PIN V17 IOSTANDARD LVCMOS33} [get_ports {LED[5]}]
#set_property -dict {PACKAGE_PIN U17 IOSTANDARD LVCMOS33} [get_ports {LED[6]}]
#set_property -dict {PACKAGE_PIN U16 IOSTANDARD LVCMOS33} [get_ports {LED[7]}]
#set_property -dict {PACKAGE_PIN V16 IOSTANDARD LVCMOS33} [get_ports {LED[8]}]
#set_property -dict {PACKAGE_PIN T15 IOSTANDARD LVCMOS33} [get_ports {LED[9]}]
#set_property -dict {PACKAGE_PIN U14 IOSTANDARD LVCMOS33} [get_ports {LED[10]}]
#set_property -dict {PACKAGE_PIN T16 IOSTANDARD LVCMOS33} [get_ports {LED[11]}]
#set_property -dict {PACKAGE_PIN V15 IOSTANDARD LVCMOS33} [get_ports {LED[12]}]
#set_property -dict {PACKAGE_PIN V14 IOSTANDARD LVCMOS33} [get_ports {LED[13]}]
#set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {LED[14]}]
#set_property -dict {PACKAGE_PIN V11 IOSTANDARD LVCMOS33} [get_ports {LED[15]}]

#set_property -dict { PACKAGE_PIN R12   IOSTANDARD LVCMOS33 } [get_ports { LED16_B }]; #IO_L5P_T0_D06_14 Sch=led16_b
#set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { LED16_G }]; #IO_L10P_T1_D14_14 Sch=led16_g
#set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { LED16_R }]; #IO_L11P_T1_SRCC_14 Sch=led16_r
#set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { LED17_B }]; #IO_L15N_T2_DQS_ADV_B_15 Sch=led17_b
#set_property -dict { PACKAGE_PIN R11   IOSTANDARD LVCMOS33 } [get_ports { LED17_G }]; #IO_0_14 Sch=led17_g
#set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { LED17_R }]; #IO_L11N_T1_SRCC_14 Sch=led17_r


##7 segment display

#set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { CA }]; #IO_L24N_T3_A00_D16_14 Sch=ca
#set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { CB }]; #IO_25_14 Sch=cb
#set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { CC }]; #IO_25_15 Sch=cc
#set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { CD }]; #IO_L17P_T2_A26_15 Sch=cd
#set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { CE }]; #IO_L13P_T2_MRCC_14 Sch=ce
#set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { CF }]; #IO_L19P_T3_A10_D26_14 Sch=cf
#set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { CG }]; #IO_L4P_T0_D04_14 Sch=cg

#set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { DP }]; #IO_L19N_T3_A21_VREF_15 Sch=dp

#set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { AN[0] }]; #IO_L23P_T3_FOE_B_15 Sch=an[0]
#set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { AN[1] }]; #IO_L23N_T3_FWE_B_15 Sch=an[1]
#set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { AN[2] }]; #IO_L24P_T3_A01_D17_14 Sch=an[2]
#set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { AN[3] }]; #IO_L19P_T3_A22_15 Sch=an[3]
#set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { AN[4] }]; #IO_L8N_T1_D12_14 Sch=an[4]
#set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { AN[5] }]; #IO_L14P_T2_SRCC_14 Sch=an[5]
#set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { AN[6] }]; #IO_L23P_T3_35 Sch=an[6]
#set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { AN[7] }]; #IO_L23N_T3_A02_D18_14 Sch=an[7]


##Buttons

set_property -dict {PACKAGE_PIN N17   IOSTANDARD LVCMOS33} [get_ports CPU_RESETN] #center button

#set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { BTNC }]; #IO_L9P_T1_DQS_14 Sch=btnc
#set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { BTNU }]; #IO_L4N_T0_D05_14 Sch=btnu
#set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { BTNL }]; #IO_L12P_T1_MRCC_14 Sch=btnl
#set_property -dict { PACKAGE_PIN M17   IOSTANDARD LVCMOS33 } [get_ports { BTNR }]; #IO_L10N_T1_D15_14 Sch=btnr
#set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { BTND }]; #IO_L9N_T1_DQS_D13_14 Sch=btnd


##Pmod Headers


##Pmod Header JA

set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { JA }]; #IO_L20N_T3_A19_15 Sch=ja[1]
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { JA[2] }]; #IO_L21N_T3_DQS_A18_15 Sch=ja[2]
#set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { JA[3] }]; #IO_L21P_T3_DQS_15 Sch=ja[3]
#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { JA[4] }]; #IO_L18N_T2_A23_15 Sch=ja[4]
#set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports { JA[7] }]; #IO_L16N_T2_A27_15 Sch=ja[7]
#set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVCMOS33 } [get_ports { JA[8] }]; #IO_L16P_T2_A28_15 Sch=ja[8]
#set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports { JA[9] }]; #IO_L22N_T3_A16_15 Sch=ja[9]
#set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { JA[10] }]; #IO_L22P_T3_A17_15 Sch=ja[10]


##Pmod Header JB


#This is where the TCK pin is located on the bus-blaster board, so there's nothing we can do but ignore the placement error



#set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { JB[9] }]; #IO_0_15 Sch=jb[9]
#set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { JB[10] }]; #IO_L13P_T2_MRCC_15 Sch=jb[10]


##Pmod Header JC

#set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { JC[1] }]; #IO_L23N_T3_35 Sch=jc[1]
#set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { JC[2] }]; #IO_L19N_T3_VREF_35 Sch=jc[2]
#set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { JC[3] }]; #IO_L22N_T3_35 Sch=jc[3]
#set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { JC[4] }]; #IO_L19P_T3_35 Sch=jc[4]
#set_property -dict { PACKAGE_PIN E7    IOSTANDARD LVCMOS33 } [get_ports { JC[7] }]; #IO_L6P_T0_35 Sch=jc[7]
#set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { JC[8] }]; #IO_L22P_T3_35 Sch=jc[8]
#set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { JC[9] }]; #IO_L21P_T3_DQS_35 Sch=jc[9]
#set_property -dict { PACKAGE_PIN E6    IOSTANDARD LVCMOS33 } [get_ports { JC[10] }]; #IO_L5P_T0_AD13P_35 Sch=jc[10]


##Pmod Header JD

#set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { JD[1] }]; #IO_L21N_T3_DQS_35 Sch=jd[1]
#set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { JD[2] }]; #IO_L17P_T2_35 Sch=jd[2]
#set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { JD[3] }]; #IO_L17N_T2_35 Sch=jd[3]
#set_property -dict { PACKAGE_PIN G3    IOSTANDARD LVCMOS33 } [get_ports { JD[4] }]; #IO_L20N_T3_35 Sch=jd[4]
#set_property -dict { PACKAGE_PIN H2    IOSTANDARD LVCMOS33 } [get_ports { JD[7] }]; #IO_L15P_T2_DQS_35 Sch=jd[7]
#set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { JD[8] }]; #IO_L20P_T3_35 Sch=jd[8]
#set_property -dict { PACKAGE_PIN G2    IOSTANDARD LVCMOS33 } [get_ports { JD[9] }]; #IO_L15N_T2_DQS_35 Sch=jd[9]
#set_property -dict { PACKAGE_PIN F3    IOSTANDARD LVCMOS33 } [get_ports { JD[10] }]; #IO_L13N_T2_MRCC_35 Sch=jd[10]


##Pmod Header JXADC

#set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVDS     } [get_ports { XA_N[1] }]; #IO_L9N_T1_DQS_AD3N_15 Sch=xa_n[1]
#set_property -dict { PACKAGE_PIN A13   IOSTANDARD LVDS     } [get_ports { XA_P[1] }]; #IO_L9P_T1_DQS_AD3P_15 Sch=xa_p[1]
#set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVDS     } [get_ports { XA_N[2] }]; #IO_L8N_T1_AD10N_15 Sch=xa_n[2]
#set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVDS     } [get_ports { XA_P[2] }]; #IO_L8P_T1_AD10P_15 Sch=xa_p[2]
#set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVDS     } [get_ports { XA_N[3] }]; #IO_L7N_T1_AD2N_15 Sch=xa_n[3]
#set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVDS     } [get_ports { XA_P[3] }]; #IO_L7P_T1_AD2P_15 Sch=xa_p[3]
#set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVDS     } [get_ports { XA_N[4] }]; #IO_L10N_T1_AD11N_15 Sch=xa_n[4]
#set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVDS     } [get_ports { XA_P[4] }]; #IO_L10P_T1_AD11P_15 Sch=xa_p[4]


##VGA Connector






##Micro SD Connector

#set_property -dict { PACKAGE_PIN E2    IOSTANDARD LVCMOS33 } [get_ports { SD_RESET }]; #IO_L14P_T2_SRCC_35 Sch=sd_reset
#set_property -dict { PACKAGE_PIN A1    IOSTANDARD LVCMOS33 } [get_ports { SD_CD }]; #IO_L9N_T1_DQS_AD7N_35 Sch=sd_cd
#set_property -dict { PACKAGE_PIN B1    IOSTANDARD LVCMOS33 } [get_ports { SD_SCK }]; #IO_L9P_T1_DQS_AD7P_35 Sch=sd_sck
#set_property -dict { PACKAGE_PIN C1    IOSTANDARD LVCMOS33 } [get_ports { SD_CMD }]; #IO_L16N_T2_35 Sch=sd_cmd
#set_property -dict { PACKAGE_PIN C2    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[0] }]; #IO_L16P_T2_35 Sch=sd_dat[0]
#set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[1] }]; #IO_L18N_T2_35 Sch=sd_dat[1]
#set_property -dict { PACKAGE_PIN F1    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[2] }]; #IO_L18P_T2_35 Sch=sd_dat[2]
#set_property -dict { PACKAGE_PIN D2    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[3] }]; #IO_L14N_T2_SRCC_35 Sch=sd_dat[3]


##Accelerometer

#set_property -dict { PACKAGE_PIN E15   IOSTANDARD LVCMOS33 } [get_ports { ACL_MISO }]; #IO_L11P_T1_SRCC_15 Sch=acl_miso
#set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { ACL_MOSI }]; #IO_L5N_T0_AD9N_15 Sch=acl_mosi
#set_property -dict { PACKAGE_PIN F15   IOSTANDARD LVCMOS33 } [get_ports { ACL_SCLK }]; #IO_L14P_T2_SRCC_15 Sch=acl_sclk
#set_property -dict { PACKAGE_PIN D15   IOSTANDARD LVCMOS33 } [get_ports { ACL_CSN }]; #IO_L12P_T1_MRCC_15 Sch=acl_csn
#set_property -dict { PACKAGE_PIN B13   IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[1] }]; #IO_L2P_T0_AD8P_15 Sch=acl_int[1]
#set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[2] }]; #IO_L20P_T3_A20_15 Sch=acl_int[2]


##Temperature Sensor

#set_property -dict { PACKAGE_PIN C14   IOSTANDARD LVCMOS33 } [get_ports { TMP_SCL }]; #IO_L1N_T0_AD0N_15 Sch=tmp_scl
#set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { TMP_SDA }]; #IO_L12N_T1_MRCC_15 Sch=tmp_sda
#set_property -dict { PACKAGE_PIN D13   IOSTANDARD LVCMOS33 } [get_ports { TMP_INT }]; #IO_L6N_T0_VREF_15 Sch=tmp_int
#set_property -dict { PACKAGE_PIN B14   IOSTANDARD LVCMOS33 } [get_ports { TMP_CT }]; #IO_L2N_T0_AD8N_15 Sch=tmp_ct

##Omnidirectional Microphone

#set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { M_CLK }]; #IO_25_35 Sch=m_clk
#set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { M_DATA }]; #IO_L24N_T3_35 Sch=m_data
#set_property -dict { PACKAGE_PIN F5    IOSTANDARD LVCMOS33 } [get_ports { M_LRSEL }]; #IO_0_35 Sch=m_lrsel


##PWM Audio Amplifier

#set_property -dict { PACKAGE_PIN A11   IOSTANDARD LVCMOS33 } [get_ports { AUD_PWM }]; #IO_L4N_T0_15 Sch=aud_pwm
#set_property -dict { PACKAGE_PIN D12   IOSTANDARD LVCMOS33 } [get_ports { AUD_SD }]; #IO_L6P_T0_15 Sch=aud_sd


##USB-RS232 Interface

#set_property -dict { PACKAGE_PIN C4    IOSTANDARD LVCMOS33 } [get_ports { UART_TXD_IN }]; #IO_L7P_T1_AD6P_35 Sch=uart_txd_in
#set_property -dict { PACKAGE_PIN D4    IOSTANDARD LVCMOS33 } [get_ports { UART_RXD_OUT }]; #IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
#set_property -dict { PACKAGE_PIN D3    IOSTANDARD LVCMOS33 } [get_ports { UART_CTS }]; #IO_L12N_T1_MRCC_35 Sch=uart_cts
#set_property -dict { PACKAGE_PIN E5    IOSTANDARD LVCMOS33 } [get_ports { UART_RTS }]; #IO_L5N_T0_AD13N_35 Sch=uart_rts

##USB HID (PS/2)

#set_property -dict { PACKAGE_PIN F4    IOSTANDARD LVCMOS33 } [get_ports { PS2_CLK }]; #IO_L13P_T2_MRCC_35 Sch=ps2_clk
#set_property -dict { PACKAGE_PIN B2    IOSTANDARD LVCMOS33 } [get_ports { PS2_DATA }]; #IO_L10N_T1_AD15N_35 Sch=ps2_data


##SMSC Ethernet PHY

#set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { ETH_MDC }]; #IO_L11P_T1_SRCC_16 Sch=eth_mdc
#set_property -dict { PACKAGE_PIN A9    IOSTANDARD LVCMOS33 } [get_ports { ETH_MDIO }]; #IO_L14N_T2_SRCC_16 Sch=eth_mdio
#set_property -dict { PACKAGE_PIN B3    IOSTANDARD LVCMOS33 } [get_ports { ETH_RSTN }]; #IO_L10P_T1_AD15P_35 Sch=eth_rstn
#set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { ETH_CRSDV }]; #IO_L6N_T0_VREF_16 Sch=eth_crsdv
#set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXERR }]; #IO_L13N_T2_MRCC_16 Sch=eth_rxerr
#set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXD[0] }]; #IO_L13P_T2_MRCC_16 Sch=eth_rxd[0]
#set_property -dict { PACKAGE_PIN D10   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXD[1] }]; #IO_L19N_T3_VREF_16 Sch=eth_rxd[1]
#set_property -dict { PACKAGE_PIN B9    IOSTANDARD LVCMOS33 } [get_ports { ETH_TXEN }]; #IO_L11N_T1_SRCC_16 Sch=eth_txen
#set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { ETH_TXD[0] }]; #IO_L14P_T2_SRCC_16 Sch=eth_txd[0]
#set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { ETH_TXD[1] }]; #IO_L12N_T1_MRCC_16 Sch=eth_txd[1]
#set_property -dict { PACKAGE_PIN D5    IOSTANDARD LVCMOS33 } [get_ports { ETH_REFCLK }]; #IO_L11P_T1_SRCC_35 Sch=eth_refclk
#set_property -dict { PACKAGE_PIN B8    IOSTANDARD LVCMOS33 } [get_ports { ETH_INTN }]; #IO_L12P_T1_MRCC_16 Sch=eth_intn


##Quad SPI Flash

#set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[0] }]; #IO_L1P_T0_D00_MOSI_14 Sch=qspi_dq[0]
#set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[1] }]; #IO_L1N_T0_D01_DIN_14 Sch=qspi_dq[1]
#set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[2] }]; #IO_L2P_T0_D02_14 Sch=qspi_dq[2]
#set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[3] }]; #IO_L2N_T0_D03_14 Sch=qspi_dq[3]
#set_property -dict { PACKAGE_PIN L13   IOSTANDARD LVCMOS33 } [get_ports { QSPI_CSN }]; #IO_L6P_T0_FCS_B_14 Sch=qspi_csn





# I/O virtual clock
#create_clock -period 20.000 -name "clk_virt"


# EJTAG virtual clock

# cut all paths to and from "clk_virt", "tck"
#set_clock_groups -physically_exclusive -group "clk_virt"

# tsu/th constraints
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports {SW[*]}]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports {SW[*]}]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTNC]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTNC]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports CPU_RESETN]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports CPU_RESETN]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTND]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTND]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTNL]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTNL]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTNR]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTNR]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports BTNU]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports BTNU]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports JB[1]]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports JB[1]]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports JB[2]]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports JB[2]]
#set_input_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports JB[4]]
#set_input_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports JB[4]]


#set_output_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports {LED[*]}]
#set_output_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports {LED[*]}]
#set_output_delay -clock "clk_virt" -min -add_delay 0.000 [get_ports {JB[3]}]
#set_output_delay -clock "clk_virt" -max -add_delay 20.000 [get_ports {JB[3]}]


#Cut false paths between the VGA clock and DIG clock


create_clock -period 20.000 -name tck
set_clock_groups -physically_exclusive -group tck


set_false_path -from [get_clocks -of_objects [get_pins mem_ex/mig1/u_mig_mig/u_ddr2_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT]] -to [get_clocks -of_objects [get_pins pll1/inst/mmcm_adv_inst/CLKOUT1]]
set_false_path -from [get_clocks -of_objects [get_pins pll1/inst/mmcm_adv_inst/CLKOUT1]] -to [get_clocks -of_objects [get_pins mem_ex/mig1/u_mig_mig/u_ddr2_infrastructure/gen_mmcm.mmcm_i/CLKFBOUT]]


#set_property MARK_DEBUG true [get_nets clk_cpu]
#connect_debug_port u_ila_1/probe0 [get_nets [list {mem_ex/tgen_state[0]} {mem_ex/tgen_state[1]} {mem_ex/tgen_state[2]}]]
#connect_debug_port u_ila_1/probe3 [get_nets [list {mem_ex/data_out[48]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe4 [get_nets [list {mem_ex/data_out[49]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe5 [get_nets [list {mem_ex/data_out[50]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe6 [get_nets [list {mem_ex/data_out[51]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe7 [get_nets [list {mem_ex/data_out[52]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe8 [get_nets [list {mem_ex/data_out[53]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe9 [get_nets [list {mem_ex/data_out[54]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe10 [get_nets [list {mem_ex/data_out[55]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe11 [get_nets [list {mem_ex/data_out[56]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe12 [get_nets [list {mem_ex/data_out[57]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe13 [get_nets [list {mem_ex/data_out[58]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe14 [get_nets [list {mem_ex/data_out[59]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe15 [get_nets [list {mem_ex/data_out[60]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe16 [get_nets [list {mem_ex/data_out[61]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe17 [get_nets [list {mem_ex/data_out[62]_i_1_n_0}]]
#connect_debug_port u_ila_1/probe19 [get_nets [list {mem_ex/data_out[63]_i_2_n_0}]]

#connect_debug_port u_ila_0/clk [get_nets [list u_ila_0_CLK]]

#connect_debug_port u_ila_0/clk [get_nets [list pll1/inst/clk_cpu]]
#connect_debug_port u_ila_0/probe0 [get_nets [list {mem_ex/data_in[32]} {mem_ex/data_in[33]} {mem_ex/data_in[39]}]]
#connect_debug_port u_ila_0/probe1 [get_nets [list {tgen_state[0]} {tgen_state[1]} {tgen_state[2]}]]
#connect_debug_port u_ila_0/probe2 [get_nets [list {mem_ex/addr[24]} {mem_ex/addr[25]}]]
#connect_debug_port u_ila_0/probe3 [get_nets [list clk_cpu]]
#connect_debug_port u_ila_0/probe4 [get_nets [list clk_mem]]
#connect_debug_port u_ila_0/probe5 [get_nets [list dequ]]
#connect_debug_port u_ila_0/probe6 [get_nets [list {mem_d_to_ram[63]_i_1_n_0}]]
#connect_debug_port u_ila_0/probe7 [get_nets [list mem_ex/rst_n]]
#connect_debug_port u_ila_1/clk [get_nets [list mem_ex/mig1/u_mig_mig/u_ddr2_infrastructure/CLK]]
#connect_debug_port u_ila_1/probe0 [get_nets [list {mem_ex/data_out[48]} {mem_ex/data_out[49]} {mem_ex/data_out[50]} {mem_ex/data_out[51]} {mem_ex/data_out[52]} {mem_ex/data_out[53]} {mem_ex/data_out[54]} {mem_ex/data_out[55]} {mem_ex/data_out[56]} {mem_ex/data_out[57]} {mem_ex/data_out[58]} {mem_ex/data_out[59]} {mem_ex/data_out[60]} {mem_ex/data_out[61]} {mem_ex/data_out[62]} {mem_ex/data_out[63]}]]
#connect_debug_port u_ila_1/probe1 [get_nets [list {mem_ex/state[0]} {mem_ex/state[1]} {mem_ex/state[2]}]]
#connect_debug_port dbg_hub/clk [get_nets u_ila_1_CLK]


#connect_debug_port u_ila_0/probe0 [get_nets [list {CurrNum[0]}]]
#connect_debug_port u_ila_0/probe1 [get_nets [list CurrFlag]]
#connect_debug_port u_ila_0/probe2 [get_nets [list u_fpga_top/outen]]
#connect_debug_port u_ila_1/clk [get_nets [list CurrFlag_BUFG]]
#connect_debug_port u_ila_1/probe0 [get_nets [list {enableLatch[0]_i_2_n_0}]]
#connect_debug_port u_ila_1/probe1 [get_nets [list {enableLatch[0]_i_3_n_0}]]
#connect_debug_port u_ila_1/probe2 [get_nets [list {enableLatch[0]_i_4_n_0}]]
#connect_debug_port u_ila_1/probe3 [get_nets [list {enableLatch[0]_i_5_n_0}]]
#connect_debug_port u_ila_1/probe4 [get_nets [list {enableLatch[4]_i_2_n_0}]]
#connect_debug_port u_ila_1/probe5 [get_nets [list {enableLatch[4]_i_3_n_0}]]
#connect_debug_port u_ila_1/probe6 [get_nets [list {enableLatch[4]_i_4_n_0}]]
#connect_debug_port u_ila_1/probe7 [get_nets [list {enableLatch[4]_i_5_n_0}]]
#connect_debug_port u_ila_1/probe8 [get_nets [list {enableLatch[8]_i_2_n_0}]]
#connect_debug_port u_ila_1/probe9 [get_nets [list {enableLatch[8]_i_3_n_0}]]
#connect_debug_port u_ila_1/probe10 [get_nets [list {enableLatch[8]_i_4_n_0}]]
#connect_debug_port u_ila_1/probe11 [get_nets [list {enableLatch[8]_i_5_n_0}]]
#connect_debug_port u_ila_1/probe12 [get_nets [list {enableLatch[12]_i_2_n_0}]]
#connect_debug_port u_ila_1/probe13 [get_nets [list {enableLatch[12]_i_3_n_0}]]
#connect_debug_port u_ila_1/probe14 [get_nets [list {enableLatch[12]_i_4_n_0}]]
#connect_debug_port u_ila_1/probe15 [get_nets [list {enableLatch[12]_i_5_n_0}]]
#connect_debug_port u_ila_1/probe16 [get_nets [list {enableLatch[16]_i_2_n_0}]]
#connect_debug_port u_ila_1/probe17 [get_nets [list {enableLatch[16]_i_3_n_0}]]
#connect_debug_port u_ila_1/probe18 [get_nets [list {enableLatch[16]_i_4_n_0}]]
#connect_debug_port u_ila_1/probe19 [get_nets [list {enableLatch[16]_i_5_n_0}]]
#connect_debug_port u_ila_1/probe20 [get_nets [list {enableLatch[20]_i_2_n_0}]]
#connect_debug_port u_ila_1/probe21 [get_nets [list {enableLatch[20]_i_3_n_0}]]
#connect_debug_port u_ila_1/probe22 [get_nets [list {enableLatch[20]_i_4_n_0}]]
#connect_debug_port u_ila_1/probe23 [get_nets [list {enableLatch[20]_i_5_n_0}]]
#connect_debug_port u_ila_1/probe24 [get_nets [list {enableLatch[24]_i_2_n_0}]]
#connect_debug_port u_ila_1/probe25 [get_nets [list {enableLatch[24]_i_3_n_0}]]
#connect_debug_port u_ila_1/probe26 [get_nets [list {enableLatch[24]_i_4_n_0}]]
#connect_debug_port u_ila_1/probe27 [get_nets [list {enableLatch[24]_i_5_n_0}]]
#connect_debug_port u_ila_1/probe28 [get_nets [list {enableLatch[28]_i_2_n_0}]]
#connect_debug_port u_ila_1/probe29 [get_nets [list {enableLatch[28]_i_3_n_0}]]
#connect_debug_port u_ila_1/probe30 [get_nets [list {enableLatch[28]_i_4_n_0}]]
#connect_debug_port u_ila_1/probe31 [get_nets [list {enableLatch[28]_i_5_n_0}]]
#connect_debug_port dbg_hub/clk [get_nets CurrFlag_BUFG]





connect_debug_port u_ila_0/probe0 [get_nets [list {u_fpga_top/outbyte[0]} {u_fpga_top/outbyte[1]} {u_fpga_top/outbyte[2]} {u_fpga_top/outbyte[3]} {u_fpga_top/outbyte[4]} {u_fpga_top/outbyte[5]} {u_fpga_top/outbyte[6]} {u_fpga_top/outbyte[7]}]]
connect_debug_port u_ila_0/probe1 [get_nets [list {bufIt_reg[0]} {bufIt_reg[1]} {bufIt_reg[2]} {bufIt_reg[3]} {bufIt_reg[4]} {bufIt_reg[5]} {bufIt_reg[6]} {bufIt_reg[7]} {bufIt_reg[8]} {bufIt_reg[9]} {bufIt_reg[10]}]]
connect_debug_port u_ila_0/probe2 [get_nets [list {CurrNum[0]} {CurrNum[1]} {CurrNum[2]} {CurrNum[3]} {CurrNum[4]} {CurrNum[5]} {CurrNum[6]} {CurrNum[7]}]]
connect_debug_port u_ila_1/probe0 [get_nets [list {count_reg[0]} {count_reg[1]} {count_reg[2]} {count_reg[3]} {count_reg[4]} {count_reg[5]} {count_reg[6]} {count_reg[7]} {count_reg[8]} {count_reg[9]} {count_reg[10]} {count_reg[11]} {count_reg[12]} {count_reg[13]} {count_reg[14]} {count_reg[15]} {count_reg[16]} {count_reg[17]} {count_reg[18]} {count_reg[19]} {count_reg[20]} {count_reg[21]} {count_reg[22]} {count_reg[23]} {count_reg[24]} {count_reg[25]} {count_reg[26]} {count_reg[27]} {count_reg[28]} {count_reg[29]} {count_reg[30]} {count_reg[31]} {count_reg[32]} {count_reg[33]} {count_reg[34]}]]

