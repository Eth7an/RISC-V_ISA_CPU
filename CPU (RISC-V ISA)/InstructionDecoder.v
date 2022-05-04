module InstructionDecoder(instrIn, rd, rs1, rs2, instr);

	input [31:0] instrIn;
	output [4:0] rd;
	output [4:0] rs1;
	output [4:0] rs2;
	output [31:0] instr;
	
	assign rd = instrIn[11:7];
	assign rs1 = instrIn[19:15];
	assign rs2 = instrIn[24:20];
	assign instr = instrIn;
	
endmodule
