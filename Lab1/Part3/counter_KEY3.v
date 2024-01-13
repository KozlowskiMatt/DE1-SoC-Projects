module counter_KEY3(input enable, input reset, output reg[3:0] result);


	always @(posedge enable, negedge reset) begin
	
		if (!reset) begin
			result <= 4'b0;
		end else if (enable) begin
			result <= result + 1'b1;
		end

	end
	

endmodule
