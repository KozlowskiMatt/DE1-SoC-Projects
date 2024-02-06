module counter(input clk, input reset_n, start_n, stop_n, output reg [19:0] ms_count);
// *** MK *** //

	integer state = 0; // 0 -> Dont count; 1 --> Count

	 always @ (posedge clk, negedge reset_n) begin

		if (!reset_n) begin
			ms_count <= 20'b0;
		end
		
		else if (!stop_n) begin
			state = 0;
		
		end
		
		else if (!start_n) begin
			state = 1;
		end
			
		else if (state > 0) begin
			ms_count <= ms_count + 1'b1;
		end
			
  end   
  
endmodule
