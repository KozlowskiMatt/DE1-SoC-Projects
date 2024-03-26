module alu (input add_sub, set_low, set_high, input [7:0] operanda , operandb, output reg [7:0] result);

	always @ (*) begin

		if(set_low) begin
			result <= {operanda[7:4],operandb[3:0]};
		end
		
		else if(set_high) begin
			result <= {operandb[3:0],operanda[3:0]};
		end
		
		else if(add_sub) begin
			result <= (operanda[7:0] - operandb[7:0]);
		end
		
		else begin
			result <= (operanda[7:0] + operandb[7:0]);
		end
	end

endmodule