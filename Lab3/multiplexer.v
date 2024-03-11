module multiplexer(input [15:0] in1,input [15:0] in2,input [15:0] in3,input [1:0] sel, output reg [15:0] out);

	always @(*) begin
		case (sel)
			2'b00: out[15:0] <= in1[15:0]; //Input Sample
			2'b01: out[15:0] <= in2[15:0]; //FIR Filter
			2'b10: out[15:0] <= in3[15:0]; //Echo Machine
			2'b11: out[15:0] <= in1[15:0]; //Input Sample
		endcase
	end

endmodule
