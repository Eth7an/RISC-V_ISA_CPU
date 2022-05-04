module Mux(in0, in1, sel, out);

	input [31:0] in0;
	input [31:0] in1;
	input sel;
	output [31:0] out;
	
	reg [31:0] out;
	
	always @(*) begin
		case(sel)
			1'b0 : out <= in0;
			1'b1 : out <= in1;
		endcase
	end

endmodule
