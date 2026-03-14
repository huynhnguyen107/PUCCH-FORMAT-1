onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib de_spread_cmpy_0_opt

do {wave.do}

view wave
view structure
view signals

do {de_spread_cmpy_0.udo}

run -all

quit -force
