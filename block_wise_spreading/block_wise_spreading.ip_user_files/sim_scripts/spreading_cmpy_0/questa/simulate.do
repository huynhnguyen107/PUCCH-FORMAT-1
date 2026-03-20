onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib spreading_cmpy_0_opt

do {wave.do}

view wave
view structure
view signals

do {spreading_cmpy_0.udo}

run -all

quit -force
