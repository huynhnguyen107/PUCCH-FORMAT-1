onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib base_se_control_blk_1_opt

do {wave.do}

view wave
view structure
view signals

do {base_se_control_blk_1.udo}

run -all

quit -force
