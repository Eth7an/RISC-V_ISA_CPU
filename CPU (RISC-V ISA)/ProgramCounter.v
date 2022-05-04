module ProgramCounter(in, clk, out);

	input [31:0] in;
	input clk;
	output [31:0] out;

	reg [31:0] out;
	
	initial
		out = 0;
	
	always @(posedge clk) begin
			out = in;
	end

endmodule
