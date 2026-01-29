onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib xcorr_cmpy_5_opt

do {wave.do}

view wave
view structure
view signals

do {xcorr_cmpy_5.udo}

run -all

quit -force
