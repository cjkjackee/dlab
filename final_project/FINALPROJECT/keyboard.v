`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:53:04 01/08/2017 
// Design Name: 
// Module Name:    frogger 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module keyboard(
    out,
    out_valid,
    clk,
    rst,
    ps2_clk,
    ps2_data
    );
	
	output reg out;
	input clk;
	input rst;
	input ps2_clk;
	input ps2_data;

	//reg && wire
	reg cstate, nstate;
	reg [1:0] state, next;
	reg [4:0] key_count;
	reg [7:0] key_data;
	reg [21:0] key_reg;
	wire chk;

	//parameter
	parameter idle = 0;
	parameter hold = 1;
	parameter up = 2;
	parameter down = 3;

	always@(posedge clk or posedge rst)
	begin
		if (rst) state <= idle;
		else state <= next;
	end

	always@(*)
	begin
		case (state)
			idle:if (key_data=={8'h75} && state!=hold) next = up;
				 else if (key_data=={8'h72} && state!=hold) next = down;
				 else next = idle;
			up: next = hold;
			down: next = hold;
			hold:if (key_data=={8'hF0}) next = idle;
				 else next = hold;
			default: next = idle;
		endcase
	end

	always@(posedge clk or posedge rst)
	begin
		if (rst) out <= 0;
		else if (state==up) out <= 0;
		else if (state==down) out <= 1;
		else out <= out;
	end

	always@(posedge clk or posedge rst)
	begin
		if (rst) out_valid <= 0;
		else
		begin
			case(state)
				up: out_valid <= 1;
				down: out_valid <= 1;
				default: out_valid <= 0;
			endcase
		end
	end

	//********************* c_state *********************
	always@(posedge clk or posedge rst)
	begin
		if (rst) cstate <= 0;
		else cstate <= nstate;
	end
	//********************* n_state **********************
	always@(posedge clk or posedge rst)
	begin
		if (rst) nstate <= 0;
		else nstate <= ps2_clk;
	end

	//********************* key reg *********************
	always@(posedge clk or posedge rst)
	begin
		if (rst) key_reg <= 0;
		else
		begin
			case ({cstate,nstate})
				2'b10:key_reg <= {ps2_data,key_reg[21:1]};
				default: key_reg <= key_reg;
			endcase
		end
	end

	//******************* key check *********************
	assign chk = key_reg[1]^key_reg[2]^key_reg[3]^key_reg[4]^key_reg[5]^key_reg[6]^key_reg[7]^key_reg[8]^key_reg[9] ;

	//******************* key counter *******************
	always@(posedge clk or posedge rst)
	begin
		if (rst) key_count <= 0;
		else if (key_count==11) key_count <= 0;
		else if ({cstate,nstate}==2'b10) key_count <= key_count + 1;
		else key_count <= key_count;
	end

	//******************* key data **********************
	always@(posedge clk or posedge rst)
	begin
		if (rst) key_data <= 0;
		else if (key_count==0 && chk==1)
		begin
			if (key_reg[8:1]==8'hXX) key_data <= 0;
			else key_data <= key_reg[19:12];
		end
		else key_data <= key_data;
	end

endmodule
