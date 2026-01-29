onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib m30_mul0_opt

do {wave.do}

view wave
view structure
view signals

do {m30_mul0.udo}

run -all

quit -force
