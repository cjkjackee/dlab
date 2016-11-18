
`timescale 1ns/10ps
`define CLK_PERIOD  4.0

module PATTERN(
	clk,
	circle1,
	circle2,
	in,
	in_valid,
	rst_n,
	out,
	out_valid
);

//*********** input output declaration ***************

output		clk;
output	[2:0]	circle1;
output	[2:0]	circle2;
output	[4:0]	in;
output		in_valid;
output		rst_n;
input	[5:0]	out;
input		out_valid;

//************** reg declaration ******************
reg		clk;
reg [2:0]	circle1;
reg [2:0]	circle2;
reg [4:0]	in;
reg		in_valid;
reg		rst_n;
reg [4:0] pixel[0:15];
reg [5:0] sample[0:7];
reg [5:0] tmp;

integer latency, total_latency;
integer i,n,x;
integer turn_1, turn_2;
parameter pattern_num = 5000;

initial 
begin
	total_latency = 0;
end

initial
begin
	clk = 1'b0;
	forever #(`CLK_PERIOD/2.0) clk = ~clk;
end

initial
begin
	rst_n <= 1'b1;
	in_valid <= 1'bx;
	in <= 'bx;
	circle1 <= 'bx;
	circle2 <= 'bx;
	
	@(negedge clk);

	in_valid <= 'b0;

	@(negedge clk);
	rst_n <= 1'b0;
	@(negedge clk);
	rst_n <= 1'b1;

	check_rst;
	
	for (i=0;i<pattern_num;i=i+1)
	begin	
		turn_1 = {$random()}%7+1;
		turn_2 = {$random()}%7+1;
		for (n=0;n<16;n=n+1)
		begin
			pixel[n] = {$random()}%30+1;
			in_valid <= 1'b1;
			in <= pixel[n];
			if (n==0)
			begin
				circle1 <= turn_1;
				circle2 <= turn_2;
			end
			else 
			begin
				circle1 <= 'bx;
				circle2 <= 'bx;
			end
			
			chk_out_valid;

			@(negedge clk);
		end
		
		in <= 'dx;
		in_valid <= 1'b0;
		circle1 <= 'bx;
		circle2 <= 'bx;
		
		count;

		@(negedge clk);

		wait_out;
		
		for (n=0;n<8;n=n+1)
		begin
			chk_out_valid_true;
			if (out!==sample[n])
			begin
				$display ("");
				$display ("===========================================");
				$display ("   failed !!!! pattern %4d is wrong! ",i+1 );
				$display ("   ans is %d     your ans is %d   ",sample[n],out);
				$display ("===========================================");
				$display ("");
				repeat(9)@(negedge clk);
				$finish;
			end
			@(negedge clk);
		end
		
		chk_out_valid;
		
		$display ("");
		$display (" pass pattern %3d ",i+1);

		@(negedge clk);
	end

	@(negedge clk);
	$display ("+++++++++++++++++++++++++++++++++++++++++++++++");
	$display ("             congratulations !              ");
	$display ("       you have passed all patterns !       ");
	$display ("       your total latency is %6d !          ",total_latency);
	$display ("+++++++++++++++++++++++++++++++++++++++++++++++");
	@(negedge clk);
	$finish;
end

//********************* task ************************************

task chk_out_valid;
	if (out_valid !== 1'b0)
	begin
		$display("");
		$display("=======================================");
		$display("       output should be reset !!!      ");
		$display("=======================================");
		$display("");
		@(negedge clk);
			$finish;
	end
endtask

task chk_out_valid_true;
	if (out_valid !== 1'b1)
	begin
		$display ("");
		$display ("======================================");
		$display ("       out_valid too fast   ");
		$display ("======================================");
		$display ("");
		@(negedge clk);
		$finish;
	end
endtask

task check_rst;
begin
	if (out !== 'd0 || out_valid !== 1'b0)
	begin
		$display("");
		$display("======================================");
		$display("   output should be reset !!!!!      ");
		$display("======================================");
		$display("");
		@(negedge clk);
			$finish;
	end
end
endtask

task wait_out;
begin
	latency = 0;
	while (!(out_valid === 1'b1))
	begin
		if (latency > 100)
		begin
			$display("");
			$display("====================================");
			$display("         latency too more !!!!!   ");
			$display("====================================");
			$display("");
			@(negedge clk);
				$finish;
		end
		latency = latency + 1;
		total_latency = total_latency + 1;
		@(negedge clk);
	end
end
endtask

task count;
begin	
	for(n=0;n<turn_1;n=n+1) 
	begin
		tmp = pixel[7];
		{pixel[0],pixel[1],pixel[2],pixel[3],pixel[4],pixel[5],pixel[6],pixel[7]} = {pixel[0],pixel[1],pixel[2],pixel[3],pixel[4],pixel[5],pixel[6],pixel[7]} >> 5;
		pixel[0] = tmp;
	end
	
	for(n=0;n<turn_2;n=n+1) 
	begin
		tmp = pixel[15];
		{pixel[8],pixel[9],pixel[10],pixel[11],pixel[12],pixel[13],pixel[14],pixel[15]} = {pixel[8],pixel[9],pixel[10],pixel[11],pixel[12],pixel[13],pixel[14],pixel[15]}  >> 5;
		pixel[8] = tmp;
	end
	
	x=8;
	for(n=0;n<8;n=n+1) 
	begin
		sample[n] = pixel[n] + pixel[x];
		x=x+1;
	end
	
	for(x=0;x<8;x=x+1)
	begin
		for(n=0;n<7;n=n+1)
		begin
			if(sample[n]>=sample[n+1])
			begin
				tmp = sample[n];
				sample[n] = sample[n+1];
				sample[n+1] = tmp;
			end
		end
	end
end
endtask

endmodule
