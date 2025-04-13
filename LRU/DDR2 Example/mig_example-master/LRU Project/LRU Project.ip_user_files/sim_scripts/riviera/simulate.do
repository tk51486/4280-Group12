transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+mig_example_tb  -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.mig_example_tb xil_defaultlib.glbl

do {mig_example_tb.udo}

run 1000ns

endsim

quit -force
