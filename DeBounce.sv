module DeBounce (
	input i_button,
	input i_clk,
	input i_rst,
	output o_output_n
);

enum {WAIT_LOW, SET_OUT, WAIT_HIGH} State, Next;

always_ff @(posedge i_clk, negedge i_rst) begin
	if (!i_rst) begin
		State <= WAIT_LOW;
	end
	else begin
		State <= Next;
	end
end

always_comb begin
	Next = State;
	unique case (State)
		WAIT_LOW: begin
			o_output_n = 1'b1;
			if (!i_button) begin
				Next = SET_OUT;
			end
			else begin
				Next = Next;
			end
		end
		
		SET_OUT: begin
			o_output_n = 1'b0;
			Next = WAIT_HIGH;
		end
		
		WAIT_HIGH: begin
			o_output_n = 1'b1;
			if (i_button) begin
				Next = WAIT_LOW;
			end
			else begin
				Next = Next;
			end
		end
	endcase
end

endmodule