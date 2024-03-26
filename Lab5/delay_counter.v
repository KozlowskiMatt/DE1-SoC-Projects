module delay_counter (input clk, reset_n, start, enable, input [7:0] delay, output reg done);
parameter BASIC_PERIOD=20'd500000;   // can change this value to make delay longer
	reg [7:0] decrement;
	reg [19:0] timer;
	
	always@(posedge clk) begin
		if(~reset_n) begin
			timer <= 20'b0;
			decrement <= 8'b0;
			done <= 0;
		end else if (start) begin
			timer <= 20'b0;
			decrement <= delay;
			done <= 0;
		end else if (enable) begin
			if (timer < BASIC_PERIOD) begin
				timer <= timer + 20'b1;
			end else begin
				decrement <= decrement - 8'b1;
				if (decrement == 8'b0) begin
					done <= 1;
				end
				timer <= 20'b0;
			end
		end
	end
endmodule
