vlib work
vdel -all -lib work
vlib work

vcom -f compile_vhdl.f
vlog -f compile_questa_sv_win.f

vsim -t ns -L cycloneive_ver -L altera_mf -L altera -L lpm -L cycloneive \
-L altera_mf_ver -L altera_ver -L lpm_ver -L sgate_ver -novopt work.tb 

run 1ns
add wave -position insertpoint -divider "CPU" \
sim:/tb/DUT/cpu1/riscv_fetch/program_counter

add wave -position insertpoint -divider "MEM_M1" \
sim:/tb/DUT/M1/wren \
sim:/tb/DUT/M1/q \
sim:/tb/DUT/M1/data \
sim:/tb/DUT/M1/address
 
add wave -position insertpoint -divider "CPU to MEM_ctrl" \
sim:/tb/DUT/mem_controller/rd \
sim:/tb/DUT/mem_controller/wr \
sim:/tb/DUT/mem_controller/addr_i \
sim:/tb/DUT/mem_controller/data_i \
sim:/tb/DUT/mem_controller/data_o \
sim:/tb/DUT/mem_controller/hold_cpu 

add wave -position insertpoint -divider "MEM_ctrl to CACHE" \
sim:/tb/DUT/mem_controller/mem0_rd \
sim:/tb/DUT/mem_controller/mem0_wr \
sim:/tb/DUT/mem_controller/mem0_addr_o \
sim:/tb/DUT/mem_controller/mem0_data_o \
sim:/tb/DUT/mem_controller/mem0_data_i \
sim:/tb/DUT/mem_controller/mem0_busy 

add wave -position insertpoint -divider "CPU" \
sim:/tb/DUT/cpu1/data_rden \
sim:/tb/DUT/cpu1/data_wren \
sim:/tb/DUT/cpu1/data_add \
sim:/tb/DUT/cpu1/data_o \
sim:/tb/DUT/cpu1/data_i \
sim:/tb/DUT/cpu1/mem_busy 



run 30000ns