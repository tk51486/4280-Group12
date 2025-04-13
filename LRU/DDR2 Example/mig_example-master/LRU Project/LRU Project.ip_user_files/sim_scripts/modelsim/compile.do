vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../../mig_example.srcs" "+incdir+../../../LRU Project.srcs/sources_1/ip/pll" \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../../mig_example.srcs" "+incdir+../../../LRU Project.srcs/sources_1/ip/pll" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/clocking/mig_7series_v4_2_clk_ibuf.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/clocking/mig_7series_v4_2_infrastructure.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/clocking/mig_7series_v4_2_iodelay_ctrl.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/clocking/mig_7series_v4_2_tempmon.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_arb_mux.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_arb_row_col.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_arb_select.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_bank_cntrl.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_bank_common.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_bank_compare.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_bank_mach.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_bank_queue.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_bank_state.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_col_mach.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_mc.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_rank_cntrl.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_rank_common.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_rank_mach.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/controller/mig_7series_v4_2_round_robin_arb.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/ecc/mig_7series_v4_2_ecc_buf.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/ecc/mig_7series_v4_2_ecc_dec_fix.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/ecc/mig_7series_v4_2_ecc_gen.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/ecc/mig_7series_v4_2_ecc_merge_enc.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/ecc/mig_7series_v4_2_fi_xor.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/ip_top/mig_7series_v4_2_memc_ui_top_std.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/ip_top/mig_7series_v4_2_mem_intfc.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_group_io.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_byte_lane.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_calib_top.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_if_post_fifo.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_mc_phy_wrapper.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_of_pre_fifo.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_4lanes.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ck_addr_cmd_delay.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_dqs_found_cal_hr.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_init.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_cntlr.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_data.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_edge.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_lim.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_mux.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_po_cntlr.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_ocd_samp.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_oclkdelay_cal.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_prbs_rdlvl.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_rdlvl.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_tempmon.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_top.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrcal.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_phy_wrlvl_off_delay.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_ddr_prbs_gen.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_poc_cc.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_poc_edge_store.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_poc_meta.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_poc_pd.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_poc_tap_base.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/phy/mig_7series_v4_2_poc_top.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/ui/mig_7series_v4_2_ui_cmd.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/ui/mig_7series_v4_2_ui_rd_data.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/ui/mig_7series_v4_2_ui_top.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/ui/mig_7series_v4_2_ui_wr_data.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/mig_mig_sim.v" \
"../../../LRU Project.gen/sources_1/ip/mig/mig/user_design/rtl/mig.v" \
"../../../../mig_example.srcs/ddr2_model.v" \
"../../../LRU Project.srcs/sources_1/new/ff_sync.v" \
"../../../LRU Project.srcs/sources_1/new/flag_sync.v" \
"../../../LRU Project.srcs/sources_1/new/mem_example.v" \
"../../../../mig_example.srcs/mig_example_top.v" \
"../../../LRU Project.srcs/sources_1/new/mig_example_tb.v" \

vlog -work xil_defaultlib \
"glbl.v"

