module maq_refri(

	input i_moeda_25,
	input i_moeda_50,
	input i_moeda_1,
	input i_clk,
	input i_rst,
	
	output logic o_led_S0,
	output logic o_led_S1,
	output logic o_led_S2,
	output logic o_led_S3,
	output logic o_led_S4,
	output logic o_led_S5,
	output logic o_led_S6,
	output logic o_led_S7,
	output logic o_led_S8

);

enum {S0, S1, S2, S3, S4, S5, S6, S7, S8} State, Next;

wire i_start_count;
wire [31:0] i_count_value = 32'h00FF_FFFF;
wire o_end_count;


contador mod_contador(i_start_count, i_count_value, i_clk, i_rst, o_end_count);

//reg [9:0] contador = 10'b1111111111;
//reg start_contador = 1'b0;

always_ff @(posedge i_clk, negedge i_rst) begin
	if (!i_rst) begin
		State <= S0;
	end
	else begin
		State <= Next;
	end
end

//always_ff @(posedge i_clk, negedge i_rst, posedge start_contador) begin
//	if (!i_rst) begin
//		contador <= 10'b1111111111;
//	end
//	else begin
//		if (i_clk) begin
//			if (start_contador) begin
//				contador <= contador - 1'b1;
//			end
//			else begin
//				contador <= 10'b1111111111;
//			end
//		end
//		else begin
//			contador <= contador;
//		end
//	end
//end

always_comb begin: set_states
	Next = State;
	unique case (State)
		S0: begin
			if (!i_moeda_25) begin
				Next = S1;
			end
			else if (!i_moeda_50) begin
				Next = S2;
			end
			else if (!i_moeda_1) begin
				Next = S3;
			end
			else begin
				Next = Next;
			end
		end
		
		S1: begin
			if (!i_moeda_25) begin
				Next = S2;
			end
			else if (!i_moeda_50) begin
				Next = S4;
			end
			else if (!i_moeda_1) begin
				Next = S5;
			end
			else begin
				Next = Next;
			end
		end
		
		S2: begin
			if (!i_moeda_25) begin
				Next = S4;
			end
			else if (!i_moeda_50) begin
				Next = S3;
			end
			else if (!i_moeda_1) begin
				Next = S6;
			end
			else begin
				Next = Next;
			end
		end
		
		S3: begin
			if (!i_moeda_25) begin
				Next = S5;
			end
			else if (!i_moeda_50) begin
				Next = S6;
			end
			else if (!i_moeda_1) begin
				Next = S8;
			end
			else begin
				Next = Next;
			end
		end
		
		S4: begin
			if (!i_moeda_25) begin
				Next = S3;
			end
			else if (!i_moeda_50) begin
				Next = S5;
			end
			else if (!i_moeda_1) begin
				Next = S7;
			end
			else begin
				Next = Next;
			end
		end
		
		S5: begin
			if (o_end_count == 1'b1) begin
				Next = S0;
			end
			else begin
				Next = Next;
			end
		end
		
		S6: begin
			if (o_end_count == 1'b1) begin
				Next = S0;
			end
			else begin
				Next = Next;
			end
		end
		
		S7: begin
			if (o_end_count == 1'b1) begin
				Next = S0;
			end
			else begin
				Next = Next;
			end
		end
		
		S8: begin
			if (o_end_count == 1'b1) begin
				Next = S0;
			end
			else begin
				Next = Next;
			end
		end
	endcase
end: set_states

always_comb begin: set_leds
	{o_led_S0, o_led_S1, o_led_S2, o_led_S3, o_led_S4, o_led_S5, o_led_S6, o_led_S7, o_led_S8} = 9'b000000000;
	unique case (State)
		S0: begin
			i_start_count = 1'b0;
			o_led_S0 = 1'b1;
		end
		S1: begin 
			i_start_count = 1'b0;
			o_led_S1 = 1'b1;
		end
		S2: begin
			i_start_count = 1'b0;
			o_led_S2 = 1'b1;
		end
		S3: begin 
			i_start_count = 1'b0;
			o_led_S3 = 1'b1;
		end
		S4: begin
			i_start_count = 1'b0;
			o_led_S4 = 1'b1;
		end
		S5: begin
			i_start_count = 1'b1;
			o_led_S5 = 1'b1;
		end
		S6: begin
			i_start_count = 1'b1;
			o_led_S6 = 1'b1;
		end
		S7: begin
			i_start_count = 1'b1;
			o_led_S7 = 1'b1;
		end
		S8: begin
			i_start_count = 1'b1;
			o_led_S8 = 1'b1;
		end
	endcase
end: set_leds
endmodule