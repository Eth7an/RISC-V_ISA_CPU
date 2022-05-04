module RAM(dataIn, dataOut, address, writeEnable, clk);

	input [31:0] dataIn;
	output [31:0] dataOut;
	input [31:0] address;
	input writeEnable, clk;
	
	reg [31:0] dataOut;
	reg [31:0] memory [31:0];
	
	always @(*) begin
		if(writeEnable)
			memory[address] <= dataIn;
		dataOut <= memory[address];
	end

endmodule
