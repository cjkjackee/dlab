module ALU( OUT, A, B, MODE);


//############
// your design
//############
	output[7:0] OUT;
	input[3:0] A, B;
	input[1:0] MODE;
	reg[7:0] OUT;

	always@(*)
	begin
		if ( MODE == 0 ) OUT = A + B;
		else if ( MODE == 1 ) OUT = A & B;
		else if ( MODE == 2 ) 
		begin
				if ( A > B ) OUT = 1;
				else OUT = 0;
		end
		else if ( MODE == 3 ) OUT = A >> B;
	end





endmodule
