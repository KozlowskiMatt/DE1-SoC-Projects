module DFF(input clk, input D, output reg q);

	always @(posedge clk) begin
		q<= D;
	end
	
endmodule
