module lab1part3(input [9:0]SW, input [3:0]KEY, output [6:0] HEX0);


	// Additional Declarations //

	wire [29:0] counter_clk50_result; // Will store result of the 30-bit counter
	wire [3:0] counter_4bit; // Will store the counts of KEY3
	reg [6:0] reg_LEDs;
	assign HEX0[6:0] = reg_LEDs;
	
	
	counter_clk50 (.clk(CLOCK_50), .reset_n(KEY[0]), .result(counter_clk50_result));
	counter_KEY3 (.enable(KEY[3]), .reset(KEY[0]), .result(counter_4bit));

	always @(*) begin
	
		case (SW[9:8]) 

			2'b11: begin // SW9 ON , SW8 ON --> HEX0 is OFF
				reg_LEDs[6:0] = 7'b1111111;
				end
				
			2'b00: begin // SW9 OFF, SW8 OFF --> HEX0 is controlled by {SW3:SW0}
				
				reg_LEDs[0] = ~ ((SW[1] & ~SW[0]) | (~SW[3] & SW[1]) | (SW[2] & SW[1]) | (~SW[3] & SW[2] & SW[0]) | (~SW[2] & ~SW[0]) | (SW[3] & ~SW[1] & ~SW[0]) | (SW[3] & ~SW[2] & ~SW[1]));  
				reg_LEDs[1] = ~ ((~SW[2]&~SW[0]) | (~SW[3] & ~SW[1] & ~SW[0]) | (~SW[3] & ~SW[2] & SW[0]) | (~SW[3] & SW[1] & SW[0]) | (SW[3] & ~SW[1] & SW[0]));
				
				case (SW[3:0])
				
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
					4'b1111: reg_LEDs[6:0] = 7'b1111111; // OFF
					
				endcase
		
			end
		
			2'b10: begin // SW9 ON, SW8 OFF --> 30-bit counter
			
				case (counter_clk50_result[29:25])
						
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
		
		
		
			2'b01: begin // SW9 OFF, SW8 ON --> 4-bit counter with KEY3
			
				case (counter_4bit[3:0])
						
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
			
		endcase
		
	end
					  
endmodule
