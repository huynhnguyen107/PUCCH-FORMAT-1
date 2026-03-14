onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib de_spread_fifo_0_opt

do {wave.do}

view wave
view structure
view signals

do {de_spread_fifo_0.udo}

run -all

quit -force
