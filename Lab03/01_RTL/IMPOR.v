module IMPOR(
	output reg  [2:0] out,
	output reg  out_valid,
	output reg  ready,
	input  [2:0] in,
	input  [2:0] mode,
	input  in_valid,
	input  clk,
	input  rst_n
);

parameter IsReady=0, get_in=1, get_mode=2, show_out=3;
reg [1:0] current_state, next_state;
reg [3:0] count;
reg [2:0] b1,b2,b3,b4,b5,b6,b7,b8,b9;

//****************** current_state ********************
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) current_state <= IsReady;
	else current_state <= next_state;
end

always@(*)
begin
	case(current_state)
		IsReady	: if (in_valid) next_state = get_in;
			  else next_state = IsReady;
		get_in	: if (count==9) next_state = get_mode;
			  else next_state = get_in;
		get_mode: if (!in_valid) next_state = show_out;
			  else next_state = get_mode;
		show_out: if (count==8) next_state = IsReady;
			  else next_state = show_out;
	endcase
end

//****************** counter *****************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) count <= 0;
	else if (current_state==get_mode) count <= 0;
	else if (in_valid) count <= count + 1;
	else if (current_state==show_out) count <= count + 1;
	else count <= 0;
end

//*************** out *****************
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) out <= 0;
	else if (current_state==show_out) out <= b1;
	else out <= 0;
end

//************** out valid *****************
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) out_valid <= 0;
	else if (current_state==show_out) out_valid <= 1;
	else out_valid <= 0;
end

//************* ready *******************
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) ready <= 1;
	case(current_state)
		IsReady	: ready <= 1;
		get_in	: ready <= 1;
		get_mode: ready <= 1;
		default	: ready <= 0;
	endcase
end

//************ block *******************
always@(negedge clk or negedge rst_n)
begin
	if(!rst_n) {b1,b2,b3,b4,b5,b6,b7,b8,b9} <= 0;
	else if (current_state==get_in)
	begin
		case(count)
			1: b1 <= in;
			2: b2 <= in;
			3: b3 <= in;
			4: b4 <= in;
			5: b5 <= in;
			6: b6 <= in;
			7: b7 <= in;
			8: b8 <= in;
			9: b9 <= in;
		endcase
	end
	else if (current_state==get_mode)
	begin
		case(mode)
			1: begin
				b1 <= b3;
				b4 <= b6;
				b7 <= b9;
				b3 <= b1;
				b6 <= b4;
				b9 <= b7;
			   end
			2: begin
				b1 <= b7;
				b2 <= b8;
				b3 <= b9;
				b7 <= b1;
				b8 <= b2;
				b9 <= b3;
			   end
			3: begin
				b1 <= b3;
				b2 <= b6;
				b3 <= b9;
				b6 <= b8;
				b9 <= b7;
				b8 <= b4;
				b7 <= b1;
				b4 <= b2;
			   end
			4: begin
				b1 <= b7;
				b2 <= b4;
				b3 <= b1;
				b6 <= b2;
				b9 <= b3;
				b8 <= b6;
				b7 <= b9;
				b4 <= b8;
			   end
			5: begin
				if(b1+1<7) b1 <= b1 + 1;
				else b1 <= 7;
				if(b4+1<7) b4 <= b4 + 1;
				else b4 <= 7;
				if(b7+1<7) b7 <= b7 + 1;
				else b7 <= 7;
			   end
			6: begin
				if(b2+1<7) b2 <= b2 + 1;
				else b2 <= 7;
				if(b5+1<7) b5 <= b5 + 1;
				else b5 <= 7;
				if(b8+1<7) b8 <= b8 + 1;
				else b8 <= 7;
			   end
			7: begin
				if(b3+1<7) b3 <= b3 + 1;
				else b3 <= 7;
				if(b6+1<7) b6 <= b6 + 1;
				else b6 <= 7;
				if(b9+1<7) b9 <= b9 + 1;
				else b9 <= 7;
			   end
		endcase
	end
	else if (current_state==show_out && count) {b1,b2,b3,b4,b5,b6,b7,b8,b9} <= {b1,b2,b3,b4,b5,b6,b7,b8,b9} << 3;
	else {b1,b2,b3,b4,b5,b6,b7,b8,b9} <= {b1,b2,b3,b4,b5,b6,b7,b8,b9};
end

endmodule
