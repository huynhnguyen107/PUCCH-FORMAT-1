onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+base_sequence_0 -L xpm -L blk_mem_gen_v8_4_4 -L xil_defaultlib -L xbip_utils_v3_0_10 -L xbip_pipe_v3_0_6 -L xbip_bram18k_v3_0_6 -L mult_gen_v12_0_16 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.base_sequence_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {base_sequence_0.udo}

run -all

endsim

quit -force
