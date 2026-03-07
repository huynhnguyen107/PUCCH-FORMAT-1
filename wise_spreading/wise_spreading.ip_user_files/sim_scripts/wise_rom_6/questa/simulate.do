onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib wise_rom_6_opt

do {wave.do}

view wave
view structure
view signals

do {wise_rom_6.udo}

run -all

quit -force
