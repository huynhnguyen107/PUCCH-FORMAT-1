onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib scra_seq_8_ncs_0_opt

do {wave.do}

view wave
view structure
view signals

do {scra_seq_8_ncs_0.udo}

run -all

quit -force
