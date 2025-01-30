Default:
	iverilog -o primenums.vvp primenums.v primenums_tb.v
	vvp primenums.vvp -lx2 > run.log
test:
	gtkwave dump.lx2
clean:
	rm *.vvp *.log *.lx2