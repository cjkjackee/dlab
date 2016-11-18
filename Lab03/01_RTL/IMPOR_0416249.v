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
reg [26:0] block;


//****************** current_state *******************
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n) current_state <= IsReady;
	else current_state <= next_state;
end

always@(*)
begin
	case(current_state)
		IsReady	: if (ready) next_state = get_in;
			  else next_state = IsReady;
		get_in	: if (count==8) next_state = get_mode;
			  else next_state = get_in;
		get_mode: if (!mode) next_state = show_out;
			  else next_state = get_mode;
		show_out: if (count==8) next_state = IsReady;
			  else next_state = show_out;
	endcase
end

//******************** counter **********************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) count <= 0;
	else if (current_state==get_mode) count <= 0;
	else if (in_valid) count <= count +1;
	else if (current_state==show_out) count <= count + 1;
	else count <= 0;
end

//****************** out *************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) out <= 0;
	else if (current_state==show_out) out <= block[26:24];
	else out <= 0;
end

//********************** out_valid ******************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) out_valid <= 0;
	else if (current_state==show_out) out_valid <= 1;
	else out_valid <= 0;
end

//****************** ready **********************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) ready <= 1;
	else if (current_state==show_out) ready <= 0;
	else ready <= 1;
end

//******************* block ************************
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n) block <= 0;
	else if (current_state==get_in)
	begin
		case(count)
			0: block[26:24] <= in;	//b1
			1: block[23:21] <= in;	//b2
			2: block[20:18] <= in;	//b3
			3: block[17:15] <= in;	//b4
			4: block[14:12] <= in;	//b5
			5: block[11:9] <= in;	//b6
			6: block[8:6] <= in;	//b7
			7: block[5:3] <= in;	//b8
			8: block[2:0] <= in;	//b9
		endcase
	end
	else if (current_state==get_mode)
	begin
		case(mode)
			1: begin
				block[26:24] <= block[20:18];
				block[17:15] <= block[11:9];
				block[8:6] <= block[2:0];
				block[20:18] <= block[26:24];
				block[11:9] <= block[17:15];
				block[2:0] <= block[8:6];
			   end
			2: begin
				block[26:24] <= block[8:6];
				block[23:21] <= block[5:3];
				block[20:18] <= block[2:0];
				block[8:6] <= block[26:24];
				block[5:3] <= block[23:21];
				block[2:0] <= block[20:18];
			   end
			3: begin
				block[26:24] <= block[20:18];
				block[23:21] <= block[11:9];
				block[20:18] <= block[2:0];
				block[11:9] <= block[5:3];
				block[2:0] <= block[8:6];
				block[5:3] <= block[17:15];
				block[8:6] <= block[26:24];
				block[17:15] <= block[23:21];
			   end
			4: begin
				block[26:24] <= block[8:6];
				block[23:21] <= block[17:15];
				block[20:18] <= block[26:24];
				block[11:9] <= block[23:21];
				block[2:0] <= block[20:18];
				block[5:3] <= block[11:9];
				block[8:6] <= block[2:0];
				block[17:15] <= block[5:3];
			   end
			5: begin
				if (block[26:24]+1<7) block[26:24] <= block[26:24] + 1;
				else block[26:24] <= 7;
				if (block[17:15]+1<7) block[17:15] <= block[17:15] + 1;
				else block[17:15] <= 7;
				if (block[8:6]+1<7) block[8:6] <= block[8:6] + 1;
				else block[8:6] <= 7;
			   end
			6: begin
				if (block[23:21]+1<7) block[23:21] <= block[23:21] + 1;
				else block[23:21] <= 7;
				if (block[14:12]+1<7) block[14:12] <= block[14:12] + 1;
				else block[14:12] <= 7;
				if (block[5:3]+1<7) block[5:3] <= block[5:3] + 1;
				else block[5:3] <= 7;
			   end
			7: begin
				if (block[20:18]+1<7) block[20:18] <= block[20:18] + 1;
				else block[20:18] <= 7;
				if (block[11:9]+1<7) block[11:9] <= block[11:9] + 1;
				else block[11:9] <= 7;
				if (block[2:0]+1<7) block[2:0] <= block[2:0] + 1;
				else block[2:0] <= 7;
			   end
		endcase
	end
	else if (current_state==show_out) block <= block << 3;
	else block <= block;
end

endmodule
