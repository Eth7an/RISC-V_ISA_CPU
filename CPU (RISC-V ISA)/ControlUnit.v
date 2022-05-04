module ControlUnit(clk, rst, instr, immSel, regRW, ALUsrc, status, ALUop, MRW, PCsrc, WB);

	// Control unit inputs
	input clk, rst;
	
	// To datapath
	input [31:0] instr;
	output [1:0] immSel;
	output [1:0] regRW;
	output ALUsrc;
	input [1:0] status; // negative[1], zero[0]
	output [3:0] ALUop;
	output MRW;
	output PCsrc;
	output WB;
	
	reg [1:0] immSel;
	reg [1:0] regRW;
	reg ALUsrc;
	reg [3:0] ALUop;
	reg MRW;
	reg PCsrc;
	reg WB;
	
	
	always @(*) begin
	
		if(instr[6:4] == 3'b011) begin // R type instruction
		
			// immSel is not applicable
			regRW <= 2'b11;
			ALUsrc <= 0;
			MRW <= 0;
			PCsrc <= 0;
			WB <= 0;
			
			if(instr[14:12] == 3'h0 && instr[31:25] == 7'h0) // add
				ALUop <= 3'b000;
			else if(instr[14:12] == 3'h0 && instr[31:25] == 7'h20) // sub
				ALUop <= 3'b111;
			else if(instr[14:12] == 3'h4 && instr[31:25] == 7'h0) // xor
				ALUop <= 3'b001;
			else if(instr[14:12] == 3'h6 && instr[31:25] == 7'h0) // or
				ALUop <= 3'b011;
			else if(instr[14:12] == 3'h7 && instr[31:25] == 7'h0) // and
				ALUop <= 3'b010;
			else if(instr[14:12] == 3'h1 && instr[31:25] == 7'h0) // sll
				ALUop <= 3'b110;
			else if(instr[14:12] == 3'h5 && instr[31:25] == 7'h0) // srl
				ALUop <= 3'b101;
		
		end else if(instr[6:5] == 2'b00) begin // I type instruction
		
			immSel <= 2'b00;
			regRW <= 2'b11;
			ALUsrc <= 1;
			MRW <= 0;
			PCsrc <= 0;
			
			if(instr[4] == 1)
				WB <= 0;
			else
				WB <= 1;
			
			if(instr[4] == 1) begin
				if(instr[14:12] == 3'h0) // add
					ALUop <= 3'b000;
				else if(instr[14:12] == 3'h4) // xor
					ALUop <= 3'b001;
				else if(instr[14:12] == 3'h6) // or
					ALUop <= 3'b011;
				else if(instr[14:12] == 3'h7) // and
					ALUop <= 3'b010;
				else if(instr[14:12] == 3'h1) // sll
					ALUop <= 3'b110;
				else if(instr[14:12] == 3'h5 && instr[31:25] == 7'h00) // srl
					ALUop <= 3'b101;
			end else
				ALUop <= 3'b000;
		
		end else if(instr[6:4] == 3'b010) begin // S type instruction
		
			immSel <= 2'b01;
			regRW <= 2'b10;
			ALUsrc <= 1;
			ALUop <= 3'b000;
			MRW <= 1;
			PCsrc <= 0;
			// WB is not applicable
		
		end else if(instr[6:4] == 3'b110) begin // B type instruction
		
			immSel <= 2'b10;
			regRW <= 2'b10;
			ALUsrc <= 0;
			ALUop <= 3'b111;
			MRW <= 0;
			// WB is not applicable
			
			// Calculate PCsrc (1 if branch) based on status flag: negative[1], zero[0]
			if(instr[14:12] == 3'h0) begin // Equal
				PCsrc <= status[0];
			end else if(instr[14:12] == 3'h1) begin // Not equal
				PCsrc <= !status[0];
			end else if(instr[14:12] == 3'h4) begin // Less than
				PCsrc <= status[1];
			end else if(instr[14:12] == 3'h5) begin // Greater than or equal to
				PCsrc <= !status[1];
			end
		
		end
		
	end

endmodule
