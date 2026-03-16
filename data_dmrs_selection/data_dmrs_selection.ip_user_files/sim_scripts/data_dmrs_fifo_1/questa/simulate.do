onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib data_dmrs_fifo_1_opt

do {wave.do}

view wave
view structure
view signals

do {data_dmrs_fifo_1.udo}

run -all

quit -force
