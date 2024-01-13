module lab1part2 (input [3:0] SW, output [6:0] HEX0);

	reg [6:0] reg_LEDs;
	
	assign HEX0[0] = ~ ((SW[1] & ~SW[0]) | (~SW[3] & SW[1]) | (SW[2] & SW[1]) | (~SW[3] & SW[2] & SW[0]) | (~SW[2] & ~SW[0]) | (SW[3] & ~SW[1] & ~SW[0]) | (SW[3] & ~SW[2] & ~SW[1]));  
	assign HEX0[1] = ~ ((~SW[2]&~SW[0]) | (~SW[3] & ~SW[1] & ~SW[0]) | (~SW[3] & ~SW[2] & SW[0]) | (~SW[3] & SW[1] & SW[0]) | (SW[3] & ~SW[1] & SW[0]));
	
	assign HEX0[6:2] = reg_LEDs[6:2];

	always @(*) begin
	
		case (SW)
			4'b0000: reg_LEDs[6:2] = 5'b10000; // dec 0 --> 1000000
			4'b0001: reg_LEDs[6:2] = 5'b11110; // dec 1 --> 1111001
			4'b0010: reg_LEDs[6:2] = 5'b01001; // dec 2 --> 0100100
			4'b0011: reg_LEDs[6:2] = 5'b01100; // dec 3 --> 0110000
			4'b0100: reg_LEDs[6:2] = 5'b00110; // dec 4 --> 0011001
			4'b0101: reg_LEDs[6:2] = 5'b00100; // dec 5 --> 0010010
			4'b0110: reg_LEDs[6:2] = 5'b00000; // dec 6 --> 0000010
			4'b0111: reg_LEDs[6:2] = 5'b11110; // dec 7 --> 1111000
			4'b1000: reg_LEDs[6:2] = 5'b00000; // dec 8 --> 0000000
			4'b1001: reg_LEDs[6:2] = 5'b00100; // dec 9 --> 0010000
			4'b1010: reg_LEDs[6:2] = 5'b00010; // char a -->0001000
			4'b1011: reg_LEDs[6:2] = 5'b00000; // char b -->0000011
			4'b1100: reg_LEDs[6:2] = 5'b10001; // char c -->1000110
			4'b1101: reg_LEDs[6:2] = 5'b01000; // char d -->0100001
			4'b1110: reg_LEDs[6:2] = 5'b00001; // char e -->0000110
			4'b1111: reg_LEDs[6:2] = 5'b00011; // char f -->0001110
		endcase
	end

endmodule


endmodule
