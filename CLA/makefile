Default:
	iverilog -o cla2.vvp cla.v cla2.v cla2_test.v
	vvp cla2.vvp -lx2 > run.log
test:
	gtkwave dump.lx2
clean:
	rm *.vvp *.log *.lx2