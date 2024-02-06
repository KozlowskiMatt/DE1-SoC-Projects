module lab2tut (input CLOCK_50, input [2:0] KEY, output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

//*** MK ***//

	wire clk_en;
	wire [19:0] ms;
	wire [3:0] digit0,digit1,digit2,digit3, digit4,digit5;
	
	clock_divider #(.factor(50000)) (.Clock(CLOCK_50), .Reset_n(KEY[0]), .clk_ms(clk_en));
	counter(.clk(clk_en), .reset_n(KEY[0]), .start_n(KEY[1]), .stop_n(KEY[2]), .ms_count(ms));
	hex_to_bcd_converter(clk_en, KEY[0], ms, digit0,digit1,digit2,digit3, digit4,digit5);
	
	seven_seg_decoder decoder0(digit0, HEX0); // 1st 7-Seg
	seven_seg_decoder decoder1(digit1, HEX1); // 2nd 7-Seg
	seven_seg_decoder decoder2(digit2, HEX2); // 3rd 7-Seg
	seven_seg_decoder decoder3(digit3, HEX3); // 4th 7-Seg
	seven_seg_decoder decoder4(digit4, HEX4); // 5th 7-Seg
	seven_seg_decoder decoder5(digit5, HEX5); // 6th 7-Seg
	
endmodule
