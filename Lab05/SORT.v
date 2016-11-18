module SORT(
  // Input signals
  clk,
  rst_n,
  in_valid1,
  in_valid2,
  in,
  mode,
  op,
  // Output signals
  out_valid,
  out
);
//---------------------------------------------------------------------
//   INPUT AND OUTPUT DECLARATION                         
//---------------------------------------------------------------------
input clk;
input rst_n;
input in_valid1;
input in_valid2;
input [4:0] in;
input mode;
input [1:0] op;
output reg out_valid;
output reg [4:0] out;
//---------------------------------------------------------------------
// PARAMETER DECLARATION
//---------------------------------------------------------------------
parameter get_in = 0;
parameter sorting = 1;
parameter show = 2;
//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------
reg mode_now;
reg [1:0] state, nstate;
reg [1:0] hold_op;
reg [3:0] count;
reg [3:0] queue;
reg [4:0] p1,p2,p3,p4,p5,p6,p7,p8,p9,p10;
//---------------------------------------------------------------------
//   Finite-State Mechine                                          
//---------------------------------------------------------------------
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) state <= get_in;
	else state <= nstate;
end

always@(*)
begin
	case(state)
		get_in	: if (hold_op==2) nstate = sorting;
			  else nstate = get_in;
		sorting: if (count==9) nstate = show;
			  else nstate = sorting;
		show   : if (count==9) nstate = get_in;
			  else nstate = show;
		default: nstate = get_in;
	endcase
end

//---------------------------------------------------------------------
//   Design Description                                          
//---------------------------------------------------------------------
//*********************** counter *************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) count <= 0;
	else if (count==9) count <= 0;
	else 
	begin
		case(state)
			get_in : count <= 0;
			default: count <= count + 1;
		endcase
	end
end

//************************* out ****************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) out <= 0;
	else if (state==show) out <= p1;
	else out <= 0;
end

//************************ out_valid ***********************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) out_valid <= 0;
	else if (state==show) out_valid <= 1;
	else out_valid <= 0;
end

//************************ hold_op **************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) hold_op <= 0;
	else if (state==show) hold_op <= 0;
	else if (in_valid1) hold_op <= op;
	else hold_op <= hold_op;
end

//************************ mode ***************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) mode_now <= 0;
	else if (in_valid2) mode_now <= mode;
	else mode_now <= mode_now;
end

//********************* queue ***************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) queue <= 0;
	else if (state==show) queue <= 0;
	else if (mode_now && in_valid1)
	begin
		case(op)
			1: queue <= queue + 1;
			0: queue <= queue - 1;
			default: queue <= queue;
		endcase
	end
	else queue <= queue;
end

//********************** input *****************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) 
	begin
		p1 <= 0;
		p2 <= 0;
		p3 <= 0;
		p4 <= 0;
		p5 <= 0;
		p6 <= 0;
		p7 <= 0;
		p8 <= 0;
		p9 <= 0;
		p10 <= 0;
	end
	else if (state==get_in)
	begin
		if (!mode_now) //stack
		begin
			if (in_valid1)
			begin
				case(op)
					1: begin
						p10 <= p9;
						p9 <= p8;
						p8 <= p7;
						p7 <= p6;
						p6 <= p5;
						p5 <= p4;
						p4 <= p3;
						p3 <= p2;
						p2 <= p1;
						p1 <= in;
					   end
					0: begin
						p10 <= 0;
						p9 <= p10;
						p8 <= p9;
						p7 <= p8;
						p6 <= p7;
						p5 <= p6;
						p4 <= p5;
						p3 <= p4;
						p2 <= p3;
						p1 <= p2;
					   end
					default: begin
							p1 <= p1;
							p2 <= p2;
							p3 <= p3;
							p4 <= p4;
							p5 <= p5;
							p6 <= p6;
							p7 <= p7;
							p8 <= p8;
							p9 <= p9;
							p10 <= p10;
						 end
				endcase
			end
			else
			begin
				p1 <= p1;
				p2 <= p2;
				p3 <= p3;
				p4 <= p4;
				p5 <= p5;
				p6 <= p6;
				p7 <= p7;
				p8 <= p8;
				p9 <= p9;
				p10 <= p10;
			end
		end
		else
		begin
			if (in_valid1)
			begin
				case(op)
					1: begin
						case(queue)
							0: p1 <= in;
							1: p2 <= in;
							2: p3 <= in;
							3: p4 <= in;
							4: p5 <= in;
							5: p6 <= in;
							6: p7 <= in;
							7: p8 <= in;
							8: p9 <= in;
							9: p10 <= in;
						endcase
					   end
					0: begin
						p1 <= p2;
						p2 <= p3;
						p3 <= p4;
						p4 <= p5;
						p5 <= p6;
						p6 <= p7;
						p7 <= p8;
						p8 <= p9;
						p9 <= p10;
						p10 <= 0;
					   end
					default: begin
							p1 <= p1;
							p2 <= p2;
							p3 <= p3;
							p4 <= p4;
							p5 <= p5;
							p6 <= p6;
							p7 <= p7;
							p8 <= p8;
							p9 <= p9;
							p10 <= p10;
						 end
				endcase
			end
			else
			begin
				p1 <= p1;
				p2 <= p2;
				p3 <= p3;
				p4 <= p4;
				p5 <= p5;
				p6 <= p6;
				p7 <= p7;
				p8 <= p8;
				p9 <= p9;
				p10 <= p10;
			end
		end
	end
	else if (state==sorting)
	begin
		if(!(count%2))
		begin
			if (p2 < p3)
			begin
				p2 <= p3;
				p3 <= p2;
			end
			else 
			begin
				p2 <= p2;
				p3 <= p3;
			end
			if (p4 < p5)
			begin
				p4 <= p5;
				p5 <= p4;
			end
			else
			begin
				p4 <= p4;
				p5 <= p5;
			end
			if (p6 < p7)
			begin
				p6 <= p7;
				p7 <= p6;
			end
			else 
			begin
				p6 <= p6;
				p7 <= p7;
			end
			if (p8 < p9)
			begin
				p8 <= p9;
				p9 <= p8;
			end
			else
			begin
				p8 <= p8;
				p9 <= p9;
			end
		end
		else
		begin
			if (p1 < p2)
			begin
				p1 <= p2;
				p2 <= p1;
			end
			else 
			begin
				p1 <= p1;
				p2 <= p2;
			end
			if (p3 < p4)
			begin
				p3 <= p4;
				p4 <= p3;
			end
			else 
			begin
				p3 <= p3;
				p4 <= p4;
			end
			if (p5 < p6)
			begin
				p5 <= p6;
				p6 <= p5;
			end
			else 
			begin
				p5 <= p5;
				p6 <= p6;
			end
			if (p7 < p8)
			begin
				p7 <= p8;
				p8 <= p7;
			end
			else 
			begin
				p7 <= p7;
				p8 <= p8;
			end
			if (p9 < p10)
			begin
				p9 <= p10;
				p10 <= p9;
			end
			else
			begin
				p9 <= p9;
				p10 <= p10;
			end
		end
	end
	else if (state==show)
	begin
		p1 <= p2;
		p2 <= p3;
		p3 <= p4;
		p4 <= p5;
		p5 <= p6;
		p6 <= p7;
		p7 <= p8;
		p8 <= p9;
		p9 <= p10;
		p10 <= 0;
	end
	else 
	begin
		p1 <= p1;
		p2 <= p2;
		p3 <= p3;
		p4 <= p4;
		p5 <= p5;
		p6 <= p6;
		p7 <= p7;
		p8 <= p8;
		p9 <= p9;
		p10 <= p10;
	end
end

endmodule
