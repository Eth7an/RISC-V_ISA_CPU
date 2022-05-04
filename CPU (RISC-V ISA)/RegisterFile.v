module RegisterFile(write, readRS1, readRS2, addressRD, addressRS1, addressRS2, writeEnable, readEnable, clk, clearAll);

	input clk;
	input clearAll;

	input [31:0] write;
	input [4:0] addressRD;
	input writeEnable;
	
	output [31:0] readRS1;
	input [4:0] addressRS1;
	output [31:0] readRS2;
	input [4:0] addressRS2;
	input readEnable;
	
	
	wire [31:0] decodeAddress;
	Decoder u1(.in(addressRD), .out(decodeAddress), .enable(writeEnable));
	
	wire [31:0] I0, I1, I2, I3, I4, I5, I6, I7,
					I8, I9, I10, I11, I12, I13, I14, I15, 
					I16, I17, I18, I19, I20, I21, I22, I23, 
					I24, I25, I26, I27, I28, I29, I30, I31;
	Multiplexer u2(addressRS1, readRS1, readEnable, 32'b0, I1, I2, I3, I4, I5, I6, I7,
												         I8, I9, I10, I11, I12, I13, I14, I15, 
												         I16, I17, I18, I19, I20, I21, I22, I23, 
												         I24, I25, I26, I27, I28, I29, I30, I31);
	Multiplexer u3(addressRS2, readRS2, readEnable, 32'b0, I1, I2, I3, I4, I5, I6, I7,
												         I8, I9, I10, I11, I12, I13, I14, I15, 
												         I16, I17, I18, I19, I20, I21, I22, I23, 
												         I24, I25, I26, I27, I28, I29, I30, I31);

	
	Register r1(.clk(clk), .write(write), .writeEnable(decodeAddress[1]), .clear(clearAll), .read(I1));
	Register r2(.clk(clk), .write(write), .writeEnable(decodeAddress[2]), .clear(clearAll), .read(I2));
	Register r3(.clk(clk), .write(write), .writeEnable(decodeAddress[3]), .clear(clearAll), .read(I3));
	Register r4(.clk(clk), .write(write), .writeEnable(decodeAddress[4]), .clear(clearAll), .read(I4));
	Register r5(.clk(clk), .write(write), .writeEnable(decodeAddress[5]), .clear(clearAll), .read(I5));
	Register r6(.clk(clk), .write(write), .writeEnable(decodeAddress[6]), .clear(clearAll), .read(I6));
	Register r7(.clk(clk), .write(write), .writeEnable(decodeAddress[7]), .clear(clearAll), .read(I7));
	Register r8(.clk(clk), .write(write), .writeEnable(decodeAddress[8]), .clear(clearAll), .read(I8));
	Register r9(.clk(clk), .write(write), .writeEnable(decodeAddress[9]), .clear(clearAll), .read(I9));
	Register r10(.clk(clk), .write(write), .writeEnable(decodeAddress[10]), .clear(clearAll), .read(I10));
	Register r11(.clk(clk), .write(write), .writeEnable(decodeAddress[11]), .clear(clearAll), .read(I11));
	Register r12(.clk(clk), .write(write), .writeEnable(decodeAddress[12]), .clear(clearAll), .read(I12));
	Register r13(.clk(clk), .write(write), .writeEnable(decodeAddress[13]), .clear(clearAll), .read(I13));
	Register r14(.clk(clk), .write(write), .writeEnable(decodeAddress[14]), .clear(clearAll), .read(I14));
	Register r15(.clk(clk), .write(write), .writeEnable(decodeAddress[15]), .clear(clearAll), .read(I15));
	Register r16(.clk(clk), .write(write), .writeEnable(decodeAddress[16]), .clear(clearAll), .read(I16));
	Register r17(.clk(clk), .write(write), .writeEnable(decodeAddress[17]), .clear(clearAll), .read(I17));
	Register r18(.clk(clk), .write(write), .writeEnable(decodeAddress[18]), .clear(clearAll), .read(I18));
	Register r19(.clk(clk), .write(write), .writeEnable(decodeAddress[19]), .clear(clearAll), .read(I19));
	Register r20(.clk(clk), .write(write), .writeEnable(decodeAddress[20]), .clear(clearAll), .read(I20));
	Register r21(.clk(clk), .write(write), .writeEnable(decodeAddress[21]), .clear(clearAll), .read(I21));
	Register r22(.clk(clk), .write(write), .writeEnable(decodeAddress[22]), .clear(clearAll), .read(I22));
	Register r23(.clk(clk), .write(write), .writeEnable(decodeAddress[23]), .clear(clearAll), .read(I23));
	Register r24(.clk(clk), .write(write), .writeEnable(decodeAddress[24]), .clear(clearAll), .read(I24));
	Register r25(.clk(clk), .write(write), .writeEnable(decodeAddress[25]), .clear(clearAll), .read(I25));
	Register r26(.clk(clk), .write(write), .writeEnable(decodeAddress[26]), .clear(clearAll), .read(I26));
	Register r27(.clk(clk), .write(write), .writeEnable(decodeAddress[27]), .clear(clearAll), .read(I27));
	Register r28(.clk(clk), .write(write), .writeEnable(decodeAddress[28]), .clear(clearAll), .read(I28));
	Register r29(.clk(clk), .write(write), .writeEnable(decodeAddress[29]), .clear(clearAll), .read(I29));
	Register r30(.clk(clk), .write(write), .writeEnable(decodeAddress[30]), .clear(clearAll), .read(I30));
	Register r31(.clk(clk), .write(write), .writeEnable(decodeAddress[31]), .clear(clearAll), .read(I31));
	

endmodule
