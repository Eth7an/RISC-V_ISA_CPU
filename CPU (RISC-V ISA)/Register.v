module Register(clk, write, writeEnable, clear, read);

	input clk;
	input [31:0] write;
	input writeEnable;
	input clear;
	output [31:0] read;
	
	reg [31:0] read;
	
	always @(posedge clk)
		if(clear)
			read = 0;
		else
			if(writeEnable)
				read = write;
				
endmodule
