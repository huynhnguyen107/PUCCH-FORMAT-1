onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib modulo_30_2_opt

do {wave.do}

view wave
view structure
view signals

do {modulo_30_2.udo}

run -all

quit -force
