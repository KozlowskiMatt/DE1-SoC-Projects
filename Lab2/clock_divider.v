module clock_divider (input Clock, Reset_n, output reg clk_ms);
	
	parameter factor=10; //50000 --> 50e6 / 50e3 --> 1kHZ counts 1ms
	reg [31:0] countQ;
	always @ (posedge Clock, negedge Reset_n) begin
		if (!Reset_n) begin
		
			countQ = 32'b0;
			clk_ms <= 1'b0;
		
		end else begin
		
			countQ <= countQ+1'b1;
			
			if (countQ<factor/2) begin
				clk_ms <= 1'b0;
			end 
			
			else if (countQ<factor) begin
				clk_ms <= 1'b1;
			end
	
			else //countQ==factor 
			
			begin
				countQ <= 1'b0;
				clk_ms <= 1'b0;
			end
			
		end
		
	end
	
endmodule
