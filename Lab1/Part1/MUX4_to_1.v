module MUX4_to_1(input a,input b,input c,input d,input wire [1:0]sel,output reg q);

	always @(*) begin
	
		case (sel)
		
			2'b00: q <= a;
			2'b01: q <= b;
			2'b10: q <= c;
			2'b11: q <= d;	
		endcase
	end

endmodule
