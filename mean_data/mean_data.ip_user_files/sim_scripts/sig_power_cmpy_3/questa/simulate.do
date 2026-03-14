onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib sig_power_cmpy_3_opt

do {wave.do}

view wave
view structure
view signals

do {sig_power_cmpy_3.udo}

run -all

quit -force
