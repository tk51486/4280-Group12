Default:
	iverilog -o pwm.vvp pwm.v pwm_tb.v
	vvp pwm.vvp -lx2 > run.log
test:
	gtkwave dump.lx2
clean:
	rm *.vvp *.log *.lx2