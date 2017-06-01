onerror {quit -f}
vlib work
vlog -work work procULA.vo
vlog -work work procULA.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.procULA_vlg_vec_tst
vcd file -direction procULA.msim.vcd
vcd add -internal procULA_vlg_vec_tst/*
vcd add -internal procULA_vlg_vec_tst/i1/*
add wave /*
run -all
