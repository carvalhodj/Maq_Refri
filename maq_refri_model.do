vlog maq_refri_tb.sv maq_refri.sv
vsim -t ps -L altera_ver -novopt work.maq_refri_tb

run 1ns

add wave -position insertpoint  \
sim:/maq_refri_tb/i_moeda_25 \
sim:/maq_refri_tb/i_moeda_50 \
sim:/maq_refri_tb/i_moeda_1 \
sim:/maq_refri_tb/i_clk \
sim:/maq_refri_tb/i_rst \
sim:/maq_refri_tb/o_led_S0 \
sim:/maq_refri_tb/o_led_S1 \
sim:/maq_refri_tb/o_led_S2 \
sim:/maq_refri_tb/o_led_S3 \
sim:/maq_refri_tb/o_led_S4 \
sim:/maq_refri_tb/o_led_S5 \
sim:/maq_refri_tb/o_led_S6 \
sim:/maq_refri_tb/o_led_S7 \
sim:/maq_refri_tb/o_led_S8

run -all