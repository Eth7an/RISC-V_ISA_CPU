module HexToSevenSegment(in, sevenSegment);

	input [3:0] in;
	output reg [6:0] sevenSegment;
	
	always @(in) begin
		case(in)           
			4'h0: sevenSegment <= 7'b0111111;
			4'h1: sevenSegment <= 7'b0000110;
			4'h2: sevenSegment <= 7'b1011011;
			4'h3: sevenSegment <= 7'b1001111;
			4'h4: sevenSegment <= 7'b1100110;
			4'h5: sevenSegment <= 7'b1101101;
			4'h6: sevenSegment <= 7'b1111101;
			4'h7: sevenSegment <= 7'b0000111;
			4'h8: sevenSegment <= 7'b1111111;
			4'h9: sevenSegment <= 7'b1101111;
			4'hA: sevenSegment <= 7'b1110111;
			4'hB: sevenSegment <= 7'b1111100;
			4'hC: sevenSegment <= 7'b0111001;
			4'hD: sevenSegment <= 7'b1011110;
			4'hE: sevenSegment <= 7'b1111001;
			4'hF: sevenSegment <= 7'b1110001;
		endcase
	end
	
endmodule 