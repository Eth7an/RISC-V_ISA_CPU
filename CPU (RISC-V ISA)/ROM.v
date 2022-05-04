module ROM(address, out, enable);

	input [31:0] address;
	input enable;
	output [31:0] out;
	
	reg [31:0] out;
		
	always @(*) begin
	
		if(enable) begin
		
			case(address)
				32'h0 : out = 32'b000000000011_00000_000_00001_0010011; // I type add x0 and 3 to x1
				32'h4 : out = 32'b000000000111_00000_000_00010_0010011; // I type add x0 and 7 to x2
				32'h8 : out = 32'b0000000_00001_00010_000_00011_0110011; // R type add x1 and x2 to x3
				32'hc : out = 32'b0000000_00000_00011_000_00100_0110011; // R type add x0 and x3 to x4
				32'h10 : out = 32'b0000000_00100_00010_010_00001_0100011; // S type sw x4 in RAM[x2+1]
				32'h14 : out = 32'b0000000_00011_00100_000_01000_1100011; // B type PC+8 if x3 == x4
				
				32'h18 : out = 32'b000000010000_00000_000_00111_0010011; // I type add x0 and 16 to x7
				
				32'h1c : out = 32'b000000100000_00000_000_01000_0010011; // I type add x0 and 32 to x8
				32'h20 : out = 32'b000000000001_00010_010_01001_0000011; // I type lw RAM[x2+1] to x9
				32'h24 : out = 32'b0000000_00000_01001_000_01010_0110011; // R type add x0 and x9 to x10
				32'h28 : out = 32'b0000000_00010_00001_100_01000_1100011; // B type PC+8 if x1 < x2
				
				32'h2c : out = 32'b000000010000_00000_000_00111_0010011; // I type add x0 and 16 to x7
				
				32'h30 : out = 32'b000001000000_00000_000_01011_0010011; // I type add x0 and 64 to x11
				32'h34 : out = 32'b010111000100_00010_100_01000_0010011; // I type xor x2 and 10111000100 to x8
				32'h38 : out = 32'b0000000_00010_00001_101_01000_1100011; // B type PC+8 if x1 >= x2
				32'h3c : out = 32'b0000000_00011_00011_000_00011_0110011; // R type add x3 and x3 to x3
				32'h40 : out = 32'b0000000_00000_00011_000_01111_0110011; // R type add x0 and x3 to x16
 
				default : out = 32'b1111111111111111111111111111111; // Stop testbench
			endcase
		end else
			out = 32'bz;
		
	end

endmodule
