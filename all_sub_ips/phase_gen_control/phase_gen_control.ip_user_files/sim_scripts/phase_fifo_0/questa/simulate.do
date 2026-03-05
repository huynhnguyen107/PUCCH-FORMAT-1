onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib phase_fifo_0_opt

do {wave.do}

view wave
view structure
view signals

do {phase_fifo_0.udo}

run -all

quit -force
