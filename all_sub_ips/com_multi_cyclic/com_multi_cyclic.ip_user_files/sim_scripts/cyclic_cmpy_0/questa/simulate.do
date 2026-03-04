onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib cyclic_cmpy_0_opt

do {wave.do}

view wave
view structure
view signals

do {cyclic_cmpy_0.udo}

run -all

quit -force
