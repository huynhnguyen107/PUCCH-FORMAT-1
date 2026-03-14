onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib mean_data_fifo0_opt

do {wave.do}

view wave
view structure
view signals

do {mean_data_fifo0.udo}

run -all

quit -force
