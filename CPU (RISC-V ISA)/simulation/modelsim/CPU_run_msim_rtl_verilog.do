transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/ROM.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/RegisterFile.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/Register.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/RAM.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/ProgramCounter.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/PCID.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/Mux.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/Multiplexer.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/InstructionDecoder.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/immGen.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/Decoder.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/Datapath.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/CPU.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/ControlUnit.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/ALU.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/binaryToBCD.v}
vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/HexToSevenSegment.v}

vlog -vlog01compat -work work +incdir+C:/intelFPGA_lite/CPU\ (RISC-V\ ISA) {C:/intelFPGA_lite/CPU (RISC-V ISA)/CPU_testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  CPU_testbench

add wave *
view structure
view signals
run -all
