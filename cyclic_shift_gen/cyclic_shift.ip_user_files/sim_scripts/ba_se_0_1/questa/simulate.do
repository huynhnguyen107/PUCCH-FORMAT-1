onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ba_se_0_opt

do {wave.do}

view wave
view structure
view signals

do {ba_se_0.udo}

run -all

quit -force
