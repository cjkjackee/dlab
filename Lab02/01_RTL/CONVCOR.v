module CONVCOR(	
	clk, 
	rst_n, 
	in_valid, 
	in_a,
	in_b,
	in_mode,	
	out_valid, 
	out
);
				
//---------------------------------
//  input and output declaration
//---------------------------------  

input              clk;
input              rst_n;
input              in_valid;
input 	[15:0]     in_a;
input 	[15:0]     in_b;
input 	           in_mode;
output  reg        out_valid;
output  reg [35:0] out;


//----------------------------------
// reg and wire declaration
//--------------------------------- 
reg signed [7:0] a_real, a_img, b_real, b_img;
reg signed [7:0] a0_real, a0_img, a1_real, a1_img, a2_real, a2_img, a3_real, a3_img, a4_real, a4_img;
reg signed [7:0] b0_real, b0_img, b1_real, b1_img, b2_real, b2_img;
reg signed [17:0] out_real, out_img;
reg mode, mode_chk;
reg a_chk, b_chk, a0_chk, a1_chk, a2_chk, a3_chk, a4_chk, b0_chk, b1_chk, b2_chk;
reg cal_valid, clear;
reg signed [35:0] out_tmp;

 //----------------------------------
//
//         My design
//
//----------------------------------

always @( posedge clk ) 
begin
	if (!rst_n) 
	begin
		// reset
		out <= 0;
		out_valid <= 0;
		out_tmp <= 0;
		cal_valid <= 0;
		clear <= 0;
		mode <= 0;
		mode_chk <= 0;
		{a_real,a_img} <= 0;
		{b_real,b_img} <= 0;
		{out_real,out_img} <= 0;
		{a0_real,a0_img} <= 0;
		{a1_real,a1_img} <= 0;
		{a2_real,a2_img} <= 0;
		{a3_real,a3_img} <= 0;
		{a4_real,a4_img} <= 0;
		{b0_real,b0_img} <= 0;
		{b1_real,b1_img} <= 0;
		{b2_real,b2_img} <= 0;
		a_chk <= 0;
		b_chk <= 0;
		a0_chk <= 0;
		a1_chk <= 0;
		a2_chk <= 0;
		a3_chk <= 0;
		a4_chk <= 0;
		b0_chk <= 0;
		b1_chk <= 0;
		b2_chk <= 0;
	end
	else if (in_valid) 
	begin
		{a_real,a_img,a_chk} <= {in_a,1'b1};
		{b_real,b_img,b_chk} <= {in_b,1'b1};
	end
	else if (!cal_valid)
	begin
		out_valid <= 0;
		out <= 0;
	end
	else if (cal_valid)
	begin
		out <= {out_real,out_img};
		out_valid <= 1;
	end
	
	//calculate 
	if (mode==1 && mode_chk==1)
	begin
		//好象是因为多个signed相加而overflow造成存入out_real的值出现错
		//误
		/*if (!(a2_chk&b2_chk))   
		begin
			//shift in_a into reg
			{a0_real,a0_img,a0_chk} <= {a_real,a_img,a_chk};
			{a1_real,a1_img,a1_chk} <= {a0_real,a0_img,a0_chk};
			{a2_real,a2_img,a2_chk} <= {a1_real,a1_img,a1_chk};
			//shift in_b into reg
			{b0_real,b0_img,b0_chk} <= {b_real,-b_img,b_chk};
			{b1_real,b1_img,b1_chk} <= {b0_real,b0_img,b0_chk};
			{b2_real,b2_img,b2_chk} <= {b1_real,b1_img,b1_chk};
		end
		else if ((a2_chk&b2_chk))
		begin
			out_real <= ( ((a0_real*b0_real)-(a0_img*b0_img))+((a1_real*b1_real)-(a1_img*b1_img))+((a2_real*b2_real)-(a2_img*b2_img)) );
			out_img <= ( ((a0_real*b0_img)+(a0_img*b0_real))+((a1_real*b1_img)+(a1_img*b1_real))+((a2_real*b2_img)+(a2_img*b2_real)) );
			cal_valid <= 1;
			clear <= 1;
		end*/
		out_real <= out_real + ((a_real*b_real)-(a_img*-b_img));
		out_img <= out_img + ((a_real*-b_img)+(a_img*b_real));
		if (!in_valid)
		begin
			cal_valid <= 1;
			clear <= 1;
		end
		
	end
	else if (mode==0 && mode_chk==1)
	begin
		if (!(b2_chk))
		begin
			//shift in_a into reg
			{a0_real,a0_img,a0_chk} <= {a_real,a_img,a_chk};
			{a1_real,a1_img,a1_chk} <= {a0_real,a0_img,a0_chk};
			{a2_real,a2_img,a2_chk} <= {a1_real,a1_img,a1_chk};
			//shift in_b into reg
			{b0_real,b0_img,b0_chk} <= {b_real,b_img,b_chk};
			{b1_real,b1_img,b1_chk} <= {b0_real,b0_img,b0_chk};
			{b2_real,b2_img,b2_chk} <= {b1_real,b1_img,b1_chk};
		end
		else if (b2_chk)
		begin
			out_real <= ( ((a2_real*b2_real)-(a2_img*b2_img))+((a3_real*b1_real)-(a3_img*b1_img))+((a4_real*b0_real)-(a4_img*b0_img)) );
			out_img <= ( ((a2_img*b2_real)+(a2_real*b2_img))+((a3_img*b1_real)+(a3_real*b1_img))+((a4_img*b0_real)+(a4_real*b0_img)) );
			{a0_real,a0_img,a0_chk} <= 0;
			{a1_real,a1_img,a1_chk} <= {a0_real,a0_img,a0_chk};
			{a2_real,a2_img,a2_chk} <= {a1_real,a1_img,a1_chk};
			{a3_real,a3_img,a3_chk} <= {a2_real,a2_img,a2_chk};
			{a4_real,a4_img,a4_chk} <= {a3_real,a3_img,a3_chk};
			if (a2_chk||a3_chk||a4_chk) 
			begin
				cal_valid <= 1;
			end
			else 
			begin
				cal_valid <= 0;
				clear <= 1;
			end
		end 
	end

	//get mode 
	if (in_mode) 
	begin
		mode <= 1;
		mode_chk <= 1;
	end
	else if (!in_mode)
	begin
		mode <= 0;
		mode_chk <= 1;
	end
	
	//clear 
	if (clear)
	begin
		cal_valid <= 0;
		mode <= 0;
		mode_chk <= 0;
		{a_real,a_img,a_chk} <= 0;
		{b_real,b_img,b_chk} <= 0;
		{a0_real,a0_img,a0_chk} <= 0;
		{a1_real,a1_img,a1_chk} <= 0;
		{a2_real,a2_img,a2_chk} <= 0;
		{a3_real,a3_img,a3_chk} <= 0;
		{a4_real,a4_img,a4_chk} <= 0;
		{b0_real,b0_img,b0_chk} <= 0;
		{b1_real,b1_img,b1_chk} <= 0;
		{b2_real,b2_img,b2_chk} <= 0;
		{out_real,out_img} <= 0;
		clear <= 0;
	end
	
end

endmodule
