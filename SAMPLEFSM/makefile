Default:
	iverilog -o samplefsm.vvp SampleFSM.v SampleFSM_Test.v
	vvp samplefsm.vvp -lx2 > run.log
test:
	gtkwave dump.lx2
clean:
	rm *.vvp *.log *.lx2