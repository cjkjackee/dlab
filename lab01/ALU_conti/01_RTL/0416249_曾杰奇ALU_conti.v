module ALU( OUT, A, B, MODE);
	


//############
// your design
//############
	output[7:0] OUT;
	input[3:0] A, B;
	input[1:0] MODE;
	wire[7:0] m0,m1,m2,m3;


	assign m0 = A + B;
	assign m1 = A & B;
	assign m2 = (A>B)?1:0;
	assign m3 = A >> B;
	
	assign OUT = (MODE[0])?((MODE[1]?(m3):(m1))):((MODE[1])?(m2):(m0));

endmodule
