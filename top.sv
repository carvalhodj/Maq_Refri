module top (
	input i_moeda_25,
	input i_moeda_50,
	input i_moeda_1,
	input i_clk,
	input i_rst,
	
	output reg o_led_S0,
	output reg o_led_S1,
	output reg o_led_S2,
	output reg o_led_S3,
	output reg o_led_S4,
	output reg o_led_S5,
	output reg o_led_S6,
	output reg o_led_S7,
	output reg o_led_S8
);

wire i_button25;
wire i_button50;
wire i_button1;

maq_refri maquina (
	i_button25,
	i_button50,
	i_button1,
	i_clk,
	i_rst,
	o_led_S0,
	o_led_S1,
	o_led_S2,
	o_led_S3,
	o_led_S4,
	o_led_S5,
	o_led_S6,
	o_led_S7,
	o_led_S8
);

DeBounce debounce25 (
	i_moeda_25,
	i_clk,
	i_rst,
	i_button25
);

DeBounce debounce50 (
	i_moeda_50,
	i_clk,
	i_rst,
	i_button50
);

DeBounce debounce1 (
	i_moeda_1,
	i_clk,
	i_rst,
	i_button1
);

endmodule