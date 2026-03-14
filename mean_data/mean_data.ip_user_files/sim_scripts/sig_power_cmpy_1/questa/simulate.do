onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib sig_power_cmpy_1_opt

do {wave.do}

view wave
view structure
view signals

do {sig_power_cmpy_1.udo}

run -all

quit -force
