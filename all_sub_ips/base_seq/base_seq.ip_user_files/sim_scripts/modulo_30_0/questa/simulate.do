onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib modulo_30_0_opt

do {wave.do}

view wave
view structure
view signals

do {modulo_30_0.udo}

run -all

quit -force
