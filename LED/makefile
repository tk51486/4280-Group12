Default:
	iverilog -o top.vvp cathode_top.v seven_segment.v pwm_led.v rgb_controller.v top.v top_tb.v
	vvp top.vvp -lx2 > run.log
test:
	gtkwave dump.lx2
clean:
	rm *.vvp *.log *.lx2