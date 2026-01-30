onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib scramble_sequence_8bits_0_opt

do {wave.do}

view wave
view structure
view signals

do {scramble_sequence_8bits_0.udo}

run -all

quit -force
