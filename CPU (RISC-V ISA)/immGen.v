module immGen(instr, immSel, immOut);

	input [31:0] instr;
	input [1:0] immSel;
	output [31:0] immOut;
	
	reg [31:0] immOut;
	
	// IMM Select cases:
	// 00 - I type
	// 01 - S type
	// 10 - B type
	
	always @(*) begin
		case(immSel)
			2'b00 : begin
					if(instr[31] == 0)
						immOut = {20'b0, instr[31:20]};
					else
						immOut = {20'b1, instr[31:20]};
				end
			2'b01 : begin
					if(instr[31] == 0)
						immOut = {20'b0, instr[31:25], instr[11:7]};
					else
						immOut = {20'b1, instr[31:25], instr[11:7]};
				end
			2'b10 : begin
					if(instr[31] == 0)
						immOut = {19'b0, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
					else
						immOut = {19'b1, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
				end
			default : immOut = 32'bz;
		endcase
	end

endmodule
