module seven_seg_decoder (input [3:0]digit, output [6:0] HEX0);

//*** MK ***//

	reg [6:0] reg_LEDs;
	assign HEX0[6:0] = reg_LEDs[6:0];
	
	always @(*) begin
	
		case (digit) 
			4'b0000: reg_LEDs[6:0] = 7'b1000000; // dec 0 --> 1000000
			4'b0001: reg_LEDs[6:0] = 7'b1111001; // dec 1 --> 1111001
			4'b0010: reg_LEDs[6:0] = 7'b0100100; // dec 2 --> 0100100
			4'b0011: reg_LEDs[6:0] = 7'b0110000; // dec 3 --> 0110000
			4'b0100: reg_LEDs[6:0] = 7'b0011001; // dec 4 --> 0011001
			4'b0101: reg_LEDs[6:0] = 7'b0010010; // dec 5 --> 0010010
			4'b0110: reg_LEDs[6:0] = 7'b0000010; // dec 6 --> 0000010
			4'b0111: reg_LEDs[6:0] = 7'b1111000; // dec 7 --> 1111000
			4'b1000: reg_LEDs[6:0] = 7'b0000000; // dec 8 --> 0000000
			4'b1001: reg_LEDs[6:0] = 7'b0010000; // dec 9 --> 0010000
			4'b1010: reg_LEDs[6:0] = 7'b0001000; // char a -->0001000
			4'b1011: reg_LEDs[6:0] = 7'b0000011; // char b -->0000011
			4'b1100: reg_LEDs[6:0] = 7'b1000110; // char c -->1000110
			4'b1101: reg_LEDs[6:0] = 7'b0100001; // char d -->0100001
			4'b1110: reg_LEDs[6:0] = 7'b0000110; // char e -->0000110
			4'b1111: reg_LEDs[6:0] = 7'b1111111; // OFF
		endcase
		
	end
endmodule
