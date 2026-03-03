onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ncs_scra_seq_8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ncs_scra_seq_8 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {ncs_scra_seq_8.udo}

run -all

endsim

quit -force
