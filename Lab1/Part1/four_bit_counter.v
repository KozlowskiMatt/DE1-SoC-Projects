module four_bit_counter(input clk, input enable, input reset, output reg[3:0] result);

	always @(posedge clk) begin
		if (reset) begin
			result <= 4'b0;
		end else if (enable) begin
			result <= result + 1'b1;
		end

	end
	
endmodule
