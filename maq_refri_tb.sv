module maq_refri_tb;

	logic i_moeda_25;
	logic i_moeda_50;
	logic i_moeda_1;
	logic i_clk;
	logic i_rst;
	
	logic o_led_S0;
	logic o_led_S1;
	logic o_led_S2;
	logic o_led_S3;
	logic o_led_S4;
	logic o_led_S5;
	logic o_led_S6;
	logic o_led_S7;
	logic o_led_S8;
	
	maq_refri dut(.*);

initial begin
	i_clk <= 1'b0;
	while (1) begin
		#4000;
		i_clk <= ~i_clk;
	end
end

initial begin
	@(posedge i_clk);
	i_rst <= 1'b0;
end

initial begin
	i_moeda_25 <= 1'b1;
	i_moeda_50 <= 1'b1;
	i_moeda_1 <= 1'b1;
end

always @(posedge i_clk) begin
	repeat (5) @(posedge i_clk);
	i_rst <= 1'b1;
	@(posedge i_clk);
	i_moeda_1 <= 1'b0;
	repeat (1) @(posedge i_clk);
	i_moeda_1 <= 1'b1;
	repeat (1000) @(posedge i_clk);
	i_moeda_1 <= 1'b0;
	repeat (1) @(posedge i_clk);
	i_moeda_1 <= 1'b1;
	repeat (2000) @(posedge i_clk);
	$stop();
end

endmodule