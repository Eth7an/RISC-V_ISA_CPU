module CPU_testbench();

	// Clock signal
	reg clk = 0;
	always
		#5 clk = ~clk;
		
	// Reset
	reg rst = 0;
	
	// CPU Outputs
	wire [31:0] finalOut;
	wire [31:0] instr;
	wire [31:0] currentPC;
	
	wire [3:0] thousands, hundreds, tens, ones;
	wire [6:0] displayOnes, displayTens, displayHundreds, displayThousands;
	
	CPU DUT(clk, rst, finalOut, instr, currentPC, thousands, hundreds, tens, ones, displayOnes, displayTens, displayHundreds, displayThousands);
	
	
	// Stop testbench when out of instructions (default case is reached in ROM)
	always @(instr) begin
		if(instr == 32'b1111111111111111111111111111111)
			$stop;
	end

endmodule
