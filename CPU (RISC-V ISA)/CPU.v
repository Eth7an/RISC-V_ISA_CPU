module CPU(clk, rst, finalOut, instr, currentPC, thousands, hundreds, tens, ones, displayOnes, displayTens, displayHundreds, displayThousands);

	input clk, rst;
	output [31:0] finalOut, instr, currentPC;
	
	// BCD and display outputs
	output [3:0] thousands, hundreds, tens, ones;
	output [6:0] displayOnes, displayTens, displayHundreds, displayThousands;
	
	
	// Datapath / Control Unit Interconnects
	wire [31:0] instr;
	wire [1:0] immSel;
	wire [1:0] regRW;
	wire ALUsrc;
	wire [1:0] status;
	wire [2:0] ALUop;
	wire MRW;
	wire PCsrc;
	wire WB;
	
	ControlUnit CU(clk, rst, instr, immSel, regRW, ALUsrc, status, ALUop, MRW, PCsrc, WB);
	
	Datapath DP(clk, rst, instr, immSel, regRW, ALUsrc, status, ALUop, MRW, PCsrc, WB, finalOut, currentPC);
	
	
	// BCD conversion and Seven Segment drivers
	wire [3:0] thousands, hundreds, tens, ones;
	wire [6:0] displayOnes, displayTens, displayHundreds, displayThousands;
	
	binaryToBCD BCD(finalOut, thousands, hundreds, tens, ones);
	HexToSevenSegment u0(ones, displayOnes);
	HexToSevenSegment u1(tens, displayTens);
	HexToSevenSegment u2(hundreds, displayHundreds);
	HexToSevenSegment u3(thousands, displayThousands);

endmodule
