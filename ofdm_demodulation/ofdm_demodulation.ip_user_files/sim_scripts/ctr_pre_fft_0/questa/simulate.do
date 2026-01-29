onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ctr_pre_fft_0_opt

do {wave.do}

view wave
view structure
view signals

do {ctr_pre_fft_0.udo}

run -all

quit -force
