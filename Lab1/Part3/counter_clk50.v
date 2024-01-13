module counter_clk50 (input clk, input reset_n, output reg[WIDTH-1:0] result);

	parameter WIDTH = 4;
	
	always @(posedge clk, negedge reset_n)
		if (!reset_n) begin
			result <= 30'b0;
		end else begin
			result <= result + 1'b1;
		end
		
endmodule
