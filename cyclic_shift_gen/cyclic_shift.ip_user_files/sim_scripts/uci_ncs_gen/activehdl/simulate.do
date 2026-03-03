onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+uci_ncs_gen -L xpm -L fifo_generator_v13_2_5 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.uci_ncs_gen xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {uci_ncs_gen.udo}

run -all

endsim

quit -force
