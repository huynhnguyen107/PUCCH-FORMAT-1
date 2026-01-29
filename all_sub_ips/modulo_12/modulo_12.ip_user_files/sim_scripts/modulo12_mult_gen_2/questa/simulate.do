onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib modulo12_mult_gen_2_opt

do {wave.do}

view wave
view structure
view signals

do {modulo12_mult_gen_2.udo}

run -all

quit -force
