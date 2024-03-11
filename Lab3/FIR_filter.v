module FIR_filter(input sample_clock, input reset, input [15:0] input_sample, output reg [15:0] output_sample);
	parameter taps = 61;
	reg [15:0] cascade [taps-1:0];
	reg signed [15:0] coeff [255:0];
	wire signed [31:0] product [taps-1:0];
	reg signed [15:0] product_mapped [taps-1:0];
	reg signed [15:0] sum;	

	always @(*) begin
		integer i;
		for (i = 0; i < taps; i = i + 61) begin //assigning FIR Filter coeffecients determined in MATLAB
			coeff[  0]=        10;
			coeff[  1]=        -0;
			coeff[  2]=       -29;
			coeff[  3]=         0;
			coeff[  4]=        67;
			coeff[  5]=        -0;
			coeff[  6]=      -130;
			coeff[  7]=         0;
			coeff[  8]=       228;
			coeff[  9]=        -0;
			coeff[ 10]=      -366;
			coeff[ 11]=         0;
			coeff[ 12]=       548;
			coeff[ 13]=        -0;
			coeff[ 14]=      -774;
			coeff[ 15]=         0;
			coeff[ 16]=      1038;
			coeff[ 17]=        -0;
			coeff[ 18]=     -1328;
			coeff[ 19]=         0;
			coeff[ 20]=      1628;
			coeff[ 21]=        -0;
			coeff[ 22]=     -1917;
			coeff[ 23]=         0;
			coeff[ 24]=      2173;
			coeff[ 25]=        -0;
			coeff[ 26]=     -2373;
			coeff[ 27]=         0;
			coeff[ 28]=      2502;
			coeff[ 29]=        -0;
			coeff[ 30]=     30222;
			coeff[ 31]=        -0;
			coeff[ 32]=      2502;
			coeff[ 33]=         0;
			coeff[ 34]=     -2373;
			coeff[ 35]=        -0;
			coeff[ 36]=      2173;
			coeff[ 37]=         0;
			coeff[ 38]=     -1917;
			coeff[ 39]=        -0;
			coeff[ 40]=      1628;
			coeff[ 41]=         0;
			coeff[ 42]=     -1328;
			coeff[ 43]=        -0;
			coeff[ 44]=      1038;
			coeff[ 45]=         0;
			coeff[ 46]=      -774;
			coeff[ 47]=        -0;
			coeff[ 48]=       548;
			coeff[ 49]=         0;
			coeff[ 50]=      -366;
			coeff[ 51]=        -0;
			coeff[ 52]=       228;
			coeff[ 53]=         0;
			coeff[ 54]=      -130;
			coeff[ 55]=        -0;
			coeff[ 56]=        67;
			coeff[ 57]=         0;
			coeff[ 58]=       -29;
			coeff[ 59]=        -0;
			coeff[ 60]=        10;
		end
	end
	
	generate
		genvar count;
		for (count = 0; count < taps; count = count + 1) begin: multiply
			multiplier(.dataa(coeff[count]), .datab(cascade[count]), .result(product[count]));
		end
	endgenerate

	always @(posedge sample_clock or posedge reset) begin
		integer j;
		if (reset) begin
			output_sample = 0;
			for (j = 0; j <taps; j = j+1) begin
				cascade[j] = 0;
			end
		end else begin
			for (j = taps-1; j > 0; j = j-1) begin
				cascade[j] = cascade[j-1];
			end
				cascade[0] = input_sample;end 
			
			sum = 0;
			for (j = 0; j < taps; j = j+1) begin
				sum = sum + product[j];
			end
			output_sample = sum;	
	end

endmodule