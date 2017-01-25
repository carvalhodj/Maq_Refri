module contador (
	input i_start,
	input [31:0] i_count_value,
	input i_clk,
	input i_rst_n,
	
	output o_end_count
);

enum {WAIT_START, COUNTING, END_TIME} State, Next;

//reg [31:0] tempo_contagem = i_count_value;
reg [31:0] tempo_contagem;

always_ff @(posedge i_clk, negedge i_rst_n) begin
	if (!i_rst_n) begin
		State <= WAIT_START;
	end
	else begin
		State <= Next;
	end
end

always_comb begin
	Next = State;
	unique case (State)
		WAIT_START: begin
			if (i_start) begin
				Next = COUNTING;
			end
			else begin
				Next = Next;
			end
		end
		
		COUNTING: begin
			if (tempo_contagem != 0) begin
				Next = Next;
			end
			else begin
				Next = END_TIME;
			end
		end
		
		END_TIME: begin
			if (i_start) begin
				Next = Next;
			end
			else begin
				Next = WAIT_START;
			end
		end
	endcase
end

always @(posedge i_clk) begin
	unique case (State)
		WAIT_START: begin
			tempo_contagem = i_count_value;
			o_end_count = 1'b0;
		end
			
		COUNTING: begin
			tempo_contagem = tempo_contagem - 1'b1;
			o_end_count = 1'b0;
		end
		
		END_TIME: begin
			tempo_contagem = i_count_value;
			o_end_count = 1'b1;
		end
	endcase
end
endmodule