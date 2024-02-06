module clock_divider (input Clock, Reset_n, output reg clk_ms);
//*** MK *** //
	
	parameter factor= 10;//50000; //10; //50000; // 32'h000061a7;
	reg [31:0] countQ;
	always @ (posedge Clock, negedge Reset_n) begin
		if (!Reset_n) begin
		/* fill in your code here */
			countQ = 32'b0;
			clk_ms <= 1'b0;
		end 
		
		else if (countQ == (factor-1)) begin
			countQ <= 32'b0;
		end
		
		else begin
			
			if (countQ< (factor/2)) 
			begin
				clk_ms <= 1'b0;
				countQ <= countQ+1'b1;
			end 
			
			else if (countQ<factor) 
			begin
				clk_ms <= 1'b1;
				countQ <= countQ+1'b1;
			end
	
			else //countQ==factor 
			begin
				countQ <= 1'b0;
				clk_ms <= 1'b0;
			end
			
		end
		
	end
	
endmodule
