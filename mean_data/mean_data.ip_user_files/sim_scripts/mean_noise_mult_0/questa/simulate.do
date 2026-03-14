onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib mean_noise_mult_0_opt

do {wave.do}

view wave
view structure
view signals

do {mean_noise_mult_0.udo}

run -all

quit -force
