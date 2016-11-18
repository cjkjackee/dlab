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
parameter get_in=0;
parameter sorting = 1;
parameter show = 2;

integer i = 0;
integer x = 0;
//---------------------------------------------------------------------
//   WIRE AND REG DECLARATION                             
//---------------------------------------------------------------------
reg [1:0] state, nstate;
reg [1:0] hold_op;
reg [3:0] count;
reg [3:0] queue;
reg [4:0] storage[0:9];
reg [4:0] p1,p2,p3,p4,p5,p6,p7,p8,p9,p10;
reg mode_now;
//---------------------------------------------------------------------
//   Finite-State Mechine                                          
//---------------------------------------------------------------------
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) state <= get_in;
	else state <= nstate;
end

always@(*)
begin
	case(state)
		get_in	: if (hold_op==2) nstate = sorting;
			  else nstate = get_in;
		sorting	: if (count==9) nstate = show;
			  else nstate = sorting;
		show	: if (count==9) nstate = get_in;
			  else nstate = show;
	endcase
end
//---------------------------------------------------------------------
//   Design Description                                          
//---------------------------------------------------------------------
//********************** counter **************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) count <= 0;
	else if (count==9) count <= 0;
	else 
	begin
		case (state)
			get_in	: count <= 0;
			default : count <= count + 1;
		endcase
	end
end

//******************** queue counter ****************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) queue <= 0;
	else if (state==show) queue <= 0;
	else if (in_valid1 && op==1) queue <= queue + 1;
	else if (in_valid1 && !op && queue!=0) queue <= queue - 1;
	else queue <= queue;
end

//*********************** hold_op *****************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) hold_op <= 0;
	else if (in_valid1) hold_op <= op;
	else if (state!=get_in) hold_op <= 0;
	else hold_op <= hold_op;
end

//********************** get mode **************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) mode_now <= 0;
	else if (in_valid2) mode_now <= mode;
	else mode_now <= mode_now;
end

//********************** out ****************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) out <= 0;
	else if (state==show) out <= storage[0];
	else out <= 0;
end

//********************* out valid ************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) out_valid <= 0;
	else if (state==show) out_valid <= 1;
	else out_valid <= 0;
end

//*********************** input ***************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n)
	begin
		for (i=0;i<10;i=i+1)
		begin
			storage[i] <= 0;
		end
	end
	//stack
	else if (state==get_in && !mode_now)
	begin
		if (in_valid1)
		begin
			case (op)
				1: begin
					storage[9] <= storage[8];
					storage[8] <= storage[7];
					storage[7] <= storage[6];
					storage[6] <= storage[5];
					storage[5] <= storage[4];
					storage[4] <= storage[3];
					storage[3] <= storage[2];
					storage[2] <= storage[1];
					storage[1] <= storage[0];
					storage[0] <= in;
					p10 <= p9;
					p9 <= p8;
					p8 <= p7;
					p6 <= p5;
					p5 <= p4;
					p4 <= p3;
					p3 <= p2;
					p2 <= p1;
					p1 <= in;
				   end
				0: begin
					storage[9] <= 0;
					storage[8] <= storage[9];
					storage[7] <= storage[8];
					storage[6] <= storage[7];
					storage[5] <= storage[6];
					storage[4] <= storage[5];
					storage[3] <= storage[4];
					storage[2] <= storage[3];
					storage[1] <= storage[2];
					storage[0] <= storage[1];
				   end
				default: begin
						for (i=0;i<10;i=i+1) storage[i] <= storage[i];
				         end
			endcase
		end
		else 
		begin
			for (i=0;i<10;i=i+1) storage[i] <= storage[i];
		end
	end
	//queue
	else if (state==get_in && mode_now)
	begin
		if (in_valid1)
		begin
			case (op)
				1: begin
					storage[queue] <= in;
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
					storage[9] <= 0;
					storage[8] <= storage[9];
					storage[7] <= storage[8];
					storage[6] <= storage[7];
					storage[5] <= storage[6];
					storage[4] <= storage[5];
					storage[3] <= storage[4];
					storage[2] <= storage[3];
					storage[1] <= storage[2];
					storage[0] <= storage[1];
				   end
				default: begin
						for (i=0;i<10;i=i+1) storage[i] <= storage[i];
				         end
			endcase
		end
		else 
		begin
			for (i=0;i<10;i=i+1) storage[i] <= storage[i];
		end
	end
	else if (state==sorting)
	begin
		if (storage[x]<storage[x+1])
		begin
			storage[x] <= storage[x+1];
			storage[x+1] <= storage[x]; 
		end
		else storage[x] <= storage[x];
		
		if (x>9) x <= 0;
		else x <= x + 1;
	end
	else if (state==show)
	begin
		storage[0] <= storage[1];
		storage[1] <= storage[2];
		storage[2] <= storage[3];
		storage[3] <= storage[4];
		storage[4] <= storage[5];
		storage[5] <= storage[6];
		storage[6] <= storage[7];
		storage[7] <= storage[8];
		storage[8] <= storage[9];
		storage[9] <= 0;
	end
	else
	begin
		for (i=0;i<10;i=i+1)
		begin
			storage[i] <= storage[i];
		end
	end
end

endmodule
