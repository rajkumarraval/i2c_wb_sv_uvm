vlog ./../i2c_master_slave_core/verilog/rtl/*.v
vlog uvm_i2c_top_tb.sv
vsim -novopt top
add wave -r /*
run 5 us 
