module Multiplexer(select, out, enable, I0, I1, I2, I3, I4, I5, I6, I7,
												  I8, I9, I10, I11, I12, I13, I14, I15, 
												  I16, I17, I18, I19, I20, I21, I22, I23, 
												  I24, I25, I26, I27, I28, I29, I30, I31);

	input [4:0] select;
	input [31:0] I0, I1, I2, I3, I4, I5, I6, I7,
					 I8, I9, I10, I11, I12, I13, I14, I15, 
					 I16, I17, I18, I19, I20, I21, I22, I23, 
					 I24, I25, I26, I27, I28, I29, I30, I31;
	input enable;
	output [31:0] out;
	
	reg [31:0] out;
	
	always @(*) begin
		if(enable) begin
			case(select)
				5'b00000 : out = I0;
				5'b00001 : out = I1;
				5'b00010 : out = I2;
				5'b00011 : out = I3;
				5'b00100 : out = I4;
				5'b00101 : out = I5;
				5'b00110 : out = I6;
				5'b00111 : out = I7;
				5'b01000 : out = I8;
				5'b01001 : out = I9;
				5'b01010 : out = I10;
				5'b01011 : out = I11;
				5'b01100 : out = I12;
				5'b01101 : out = I13;
				5'b01110 : out = I14;
				5'b01111 : out = I15;
				5'b10000 : out = I16;
				5'b10001 : out = I17;
				5'b10010 : out = I18;
				5'b10011 : out = I19;
				5'b10100 : out = I20;
				5'b10101 : out = I21;
				5'b10110 : out = I22;
				5'b10111 : out = I23;
				5'b11000 : out = I24;
				5'b11001 : out = I25;
				5'b11010 : out = I26;
				5'b11011 : out = I27;
				5'b11100 : out = I28;
				5'b11101 : out = I29;
				5'b11110 : out = I30;
				5'b11111 : out = I31;
			endcase
		end else
			out = 32'bz;
	end	
	
endmodule
