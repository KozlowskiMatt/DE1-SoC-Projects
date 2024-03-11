module dsp_subsystem (input sample_clock,  input reset, input [1:0] selector, input [15:0] input_sample, output [15:0] output_sample);
		
	wire [15:0] filter;
	wire [15:0] echo;
	wire [15:0] output_sample_mult;
	
	assign output_sample = output_sample_mult;

	echomachine(.sample_clock(sample_clock),.input_sample(input_sample[15:0]), .output_sample(echo[15:0]));
	FIR_filter(.sample_clock(sample_clock), .input_sample(input_sample[15:0]), .output_sample(filter[15:0]));
	
	multiplexer(.in1(input_sample[15:0]), .in2(filter[15:0]), .in3(echo[15:0]), .sel(selector[1:0]), .out(output_sample_mult[15:0]));


endmodule
