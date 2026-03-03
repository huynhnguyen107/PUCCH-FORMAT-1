onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib phi_matrix_0_opt

do {wave.do}

view wave
view structure
view signals

do {phi_matrix_0.udo}

run -all

quit -force
