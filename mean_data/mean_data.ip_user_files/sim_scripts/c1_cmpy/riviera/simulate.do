onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+c1_cmpy -L xbip_utils_v3_0_10 -L axi_utils_v2_0_6 -L xbip_pipe_v3_0_6 -L xbip_bram18k_v3_0_6 -L mult_gen_v12_0_16 -L cmpy_v6_0_18 -L xil_defaultlib -L secureip -O5 xil_defaultlib.c1_cmpy

do {wave.do}

view wave
view structure

do {c1_cmpy.udo}

run -all

endsim

quit -force
