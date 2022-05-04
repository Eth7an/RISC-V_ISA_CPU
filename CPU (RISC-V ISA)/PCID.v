module PCID(PCsrc, offset, clk, rd, rs1, rs2, instr, currentPC, nextPC, offsetPC);

	input PCsrc;
	input [31:0] offset;
	input clk;
	output [4:0] rd;
	output [4:0] rs1;
	output [4:0] rs2;
	output [31:0] instr;
	
	// test outputs
	output [31:0] currentPC, nextPC, offsetPC;
	
	wire [31:0] adderOut;
	wire [31:0] nextPC;
	wire [31:0] currentPC;
	wire [31:0] romOut;
	wire [31:0] offsetPC;
	
	
	ProgramCounter PC(.in(nextPC), .clk(clk), .out(currentPC));
	
	ROM instructionMemory(.address(currentPC), .out(romOut), .enable(1'b1));
	
	InstructionDecoder id(romOut, rd, rs1, rs2, instr);
	
	ALU fourAdder(.operand0(currentPC), .operand1(32'd4), .funcSel(3'b000), .out(adderOut));
	
	ALU offsetAdder(currentPC, offset, 3'b000, offsetPC);
	
	Mux PCmux(.in0(adderOut), .in1(offsetPC), .sel(PCsrc), .out(nextPC));

endmodule
