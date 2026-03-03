onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ba_seq_control_blk_0_opt

do {wave.do}

view wave
view structure
view signals

do {ba_seq_control_blk_0.udo}

run -all

quit -force
