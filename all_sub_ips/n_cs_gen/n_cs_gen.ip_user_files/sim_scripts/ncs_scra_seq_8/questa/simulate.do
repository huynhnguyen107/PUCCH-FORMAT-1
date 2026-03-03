onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ncs_scra_seq_8_opt

do {wave.do}

view wave
view structure
view signals

do {ncs_scra_seq_8.udo}

run -all

quit -force
