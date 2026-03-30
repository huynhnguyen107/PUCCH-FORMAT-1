onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+scra_seq_8_ncs_0 -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.scra_seq_8_ncs_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {scra_seq_8_ncs_0.udo}

run -all

endsim

quit -force
