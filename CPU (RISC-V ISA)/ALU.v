module ALU(operand0, operand1, funcSel, out, status);

	input [2:0] funcSel;
	input [31:0] operand0, operand1;
	output [31:0] out;
	output [1:0] status; // negative[1], zero[0]
	
	reg [31:0] out;
	
	// funcSel 000 Arithmetic Addition
	// funcSel 001 Logic bitwise Xor
	// funcSel 010 Logic bitwise And
	// funcSel 011 Logic bitwise Or
	// funcSel 100 Logic bitwise Nor
	// funcSel 101 Register right logic shift
	// funcSel 110 Register left logic shift
	// funcSel 111 disable
	
	always @(*) begin
	
		case (funcSel)
			3'b000 : out = operand0 + operand1;
			3'b001 : out = operand0 ^ operand1;
			3'b010 : out = operand0 & operand1;
			3'b011 : out = operand0 | operand1;
			3'b100 : out = ~(operand0 | operand1);
			3'b101 : out = operand0 >> 1;
			3'b110 : out = operand0 << 1;
			3'b111 : out = operand0 - operand1;
		endcase
			
	end
	
	assign status[0] = (out == 32'b0);
	assign status[1] = (1 == out[31]);
	
endmodule
