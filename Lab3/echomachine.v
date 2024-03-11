module echomachine(input sample_clock, input [15:0] input_sample, output [15:0] output_sample);
	
	wire [15:0] output_sample_delay_in;
	wire [15:0] output_sample_delay_out;
	wire [15:0] output_sample_delay_div;

	
	assign output_sample_delay_in = output_sample;
	
	shiftregister(.clock(sample_clock), .shiftin(output_sample_delay_in[15:0]), .shiftout(output_sample_delay_out[15:0]));
	
	assign output_sample = (output_sample_delay_out >> 2|16'b11 << 15) + input_sample;
	
	
endmodule
