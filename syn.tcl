read_file -format sverilog {timescale.sv i2c_master_defines.v i2c_master_bit_ctrl.v i2c_master_byte_ctrl.v i2c_master_top.sv}
current_design i2c_master_top
change_selection [get_ports wb_clk_i]
create_clock -name "clk" -period 5 -waveform { 0 2.5 } { wb_clk_i }
set compile_seqmap_propagate_constants false
set compile_seqmap_propagate_high_effort false
compile -exact_map
write -hierarchy -format verilog -output i2c_master_top_syn.v
