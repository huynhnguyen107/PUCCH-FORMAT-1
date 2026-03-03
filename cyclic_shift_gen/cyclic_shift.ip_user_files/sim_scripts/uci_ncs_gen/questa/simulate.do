onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib uci_ncs_gen_opt

do {wave.do}

view wave
view structure
view signals

do {uci_ncs_gen.udo}

run -all

quit -force
