set_property SRC_FILE_INFO {cfile:c:/Users/Amr/Downloads/mig_example-master/mig_example-master/mig_example.srcs/sources_1/ip/pll/pll.xdc rfile:../../../mig_example.srcs/sources_1/ip/pll/pll.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
current_instance inst
set_property src_info {type:SCOPED_XDC file:1 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in]] 0.100
