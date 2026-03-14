onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xbip_utils_v3_0_10 -L axi_utils_v2_0_6 -L xbip_pipe_v3_0_6 -L xbip_bram18k_v3_0_6 -L mult_gen_v12_0_16 -L cmpy_v6_0_18 -L xil_defaultlib -L secureip -lib xil_defaultlib xil_defaultlib.c1_cmpy

do {wave.do}

view wave
view structure
view signals

do {c1_cmpy.udo}

run -all

quit -force
