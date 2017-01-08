`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:54 01/06/2017 
// Design Name: 
// Module Name:    final 
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
module final(
	input clk,
	input rst,
	input k_clk,
	input k_data,
    input [3:0]SW,
	output reg red,
	output reg green,
	output reg blue,
	output hsync,
	output vsync
    );
    
    // ***************** reg & wire*******************
    reg [10:0] col, row;
    reg [1:0] box1,box2,box3,box4,box5,box6,box7,box8,box9;
    reg circle,triangle,square,rectangle,frame;
	reg scoreboard_1,scoreboard_2;
	wire score_1,score_2;
    reg [4:0]current_state,next_state;
    reg [5:0]score;
    reg up,down;
    reg [24:0]row_count;
    wire key, key_valid;
    // ***************** parameter *******************
    parameter IDLE = 0;
    parameter ROLL = 1;
    parameter WINORLOSE = 2;
    
    //*******************fsm**************************
    always@(posedge clk or negedge rst_n)
    begin
            if(rst)current_state<=IDLE;
            else current_state<=next_state;
    end

    always@(*)
    begin
            case(current_state)
                    IDLE:if(!SW[0] && !SW[1] && !SW[2] && !SW[3] && up==1)next_state=ROLL;
                         else next_state=current_state;
                    ROLL:if(score==50||lose==1)next_state=WINORLOSE;
                        else next_state=current_state;
                    WINORLOSE:if(down==1)next_state=IDLE;
                        else next_state=current_state;
                    default:next_state=IDLE;
            endcase
    end

    //********************* key board **************
    keyboard in(.out(key),.out_valid(key_valid),.clk(clk),.rst(rst),.ps2_clk(k_clk),.ps2_data(k_data));

    //up
    always@(posedge clk or posedge rst)
    begin
        if (rst) up <= 0;
        else if (!key && key_valid) up <= 1;
        else up <= 0;
    end

    //down
    always@(posedge clk or posedge rst)
    begin
        if (rst) down <= 0;
        else if (key && key_valid) down <= 1;
        else down <= 0;
    end
    //********************rolling counter************************
    always@(posedge clk or posedge rst)
    begin
        if(rst) row_count <=0;
        else if(current_state==ROLL) if(row_count <= 20000000)row_count <= row_count+1;
                                     else row_count <= 0;
        else  row_count <= row_count;
    end
   
    //*******************random *************************
    always@(posedge clk or posedge rst)
    begin
        if(rst) 
            begin 
            box1 <= 0; 
            box2 <= 0;
            box3 <= 0;
            box4 <= 0;
            box5 <= 0;
            box6 <= 0;
            box7 <= 0;
            box8 <= 0;
            box9 <= 0;
            end
        else if(current_state==ROLL && row_count>=0 && (row_count%1000000==0))
            begin
                box1 <= (rand()%+4)+1;
                box2 <= (rand()%+4)+1;
                box3 <= (rand()%+4)+1;
                box4 <= (rand()%+4)+1;
                box5 <= (rand()%+4)+1;
                box6 <= (rand()%+4)+1;
                box7 <= (rand()%+4)+1;
                box8 <= (rand()%+4)+1;
                box9 <= (rand()%+4)+1;
            end
         else
            begin 
            box1 <= 0; 
            box2 <= 0;
            box3 <= 0;
            box4 <= 0;
            box5 <= 0;
            box6 <= 0;
            box7 <= 0;
            box8 <= 0;
            box9 <= 0;
        end
    end
    
    //********************lose or not*******************
    always@(posedge clkj or posedge rst)
    begin
        if(rst)lose <= 0;
        else if(current_state==ROLL && row_count==20000000)
            begin
            if(box1==box2 && box1==box3 && box2==box3) lose <= 0; //first column
            else if(box4==box5 && box4==box6 && box5==box6) lose <= 0; //second column
            else if(box7==box8 && box7==box9 && box8==box9) lose <= 0; //third column
            else if(box1==box4 && box1==box7 && box4==box7) lose <= 0; //first row
            else if(box2==box5 && box2==box8 && box5==box8) lose <= 0; //second row
            else if(box3==box6 && box3==box9 && box6==box9) lose <= 0; //third row
            else if(box1==box5 && box1==box9 && box5==box9) lose <= 0; // "\" 
            else if(box3==box5 && box3==box7 && box5==box7) lose <= 0; // "/"
            else lose <= 1;
            end
        else lose <= 0;
    end
    
    //*******************score*************************
    always@(posedge clkj or posedge rst)
    begin
        if(rst)score <= 0;
        else if(current_state==ROLL && row_count==20000000)
            begin
			if(lose==0)begin
				if(box1==box2 && box1==box3 && box2==box3) score <= score + 5; //first column
				else score <= score;
				if(box4==box5 && box4==box6 && box5==box6) score <= score + 5; //second column
				else score <= score;
				if(box7==box8 && box7==box9 && box8==box9) score <= score + 5; //third column
				else score <= score;
				if(box1==box4 && box1==box7 && box4==box7) score <= score + 5; //first row
				else score <= score;
				if(box2==box5 && box2==box8 && box5==box8) score <= score + 5; //second row
				else score <= score;
				if(box3==box6 && box3==box9 && box6==box9) score <= score + 5; //third row
				else score <= score;
				if(box1==box5 && box1==box9 && box5==box9) score <= score + 5; // "\"
				else score <= score;
				if(box3==box5 && box3==box7 && box5==box7) score <= score + 5; // "/"
				else score <= score;
				end
			else score <= 0;
            end
        else score <= 0;
    end
    
    // ***************** pic size ********************
    //col size
    always@(posedge clk or posedge rst)
    begin
        if (rst) col <= 0;
        else if (col==1039) col <= 0;
        else col <= col + 1;
    end
    //row size
    always@(posedge clk or posedge rst)
    begin
        if (rst) row <= 0;
        else if (row==665) row <= 0;
        else if (col==1039) row <= row + 1;
        else row <= row;
    end	
	
	assign hsync = ~((col>=919) & (col<1039));
    assign vsync = ~((row>=659) & (row<665));
    assign visible = ((col>=104) & (col<904) & (row>=23) & (row<623));
	
    //***************** pic function******************

    //circle
    always@(posedge clk or posedge rst)
    begin
        if(rst) circle <= 0;
        else if(col >= 125 && col <= 175 && row >= 325 && row <= 375 && ((col-150)*(col-150)+(row-350)*(row-350)<=25*25)) begin if(box1==1)circle <=1; else circle <= 0; end //box1
        else if(col >= 225 && col <= 275 && row >= 325 && row <= 375 && ((col-250)*(col-250)+(row-350)*(row-350)<=25*25)) begin if(box2==1)circle <=1; else circle <= 0; end //box2
		else if(col >= 325 && col <= 375 && row >= 325 && row <= 375 && ((col-350)*(col-350)+(row-350)*(row-350)<=25*25)) begin if(box3==1)circle <=1; else circle <= 0; end //box3
        else if(col >= 125 && col <= 175 && row >= 225 && row <= 275 && ((col-150)*(col-150)+(row-350)*(row-350)<=25*25)) begin if(box4==1)circle <=1; else circle <= 0; end //box4
		else if(col >= 225 && col <= 275 && row >= 225 && row <= 275 && ((col-250)*(col-250)+(row-350)*(row-350)<=25*25)) begin if(box5==1)circle <=1; else circle <= 0; end //box5
        else if(col >= 325 && col <= 375 && row >= 225 && row <= 275 && ((col-350)*(col-350)+(row-350)*(row-350)<=25*25)) begin if(box6==1)circle <=1; else circle <= 0; end //box6
		else if(col >= 125 && col <= 175 && row >= 125 && row <= 175 && ((col-150)*(col-150)+(row-350)*(row-350)<=25*25)) begin if(box7==1)circle <=1; else circle <= 0; end //box7
        else if(col >= 225 && col <= 275 && row >= 125 && row <= 175 && ((col-250)*(col-250)+(row-350)*(row-350)<=25*25)) begin if(box8==1)circle <=1; else circle <= 0; end //box8
		else if(col >= 325 && col <= 375 && row >= 125 && row <= 175 && ((col-350)*(col-350)+(row-350)*(row-350)<=25*25)) begin if(box9==1)circle <=1; else circle <= 0; end //box9
        else circle <= 0;
    end
    
    //square
    always@(posedge clk or posedge rst)
    begin
		if(rst) square <= 0;
        else if(col >= 125 && col <= 175 && row >= 325 && row <= 375) begin if(box1==1)square <=1; else square <= 0; end //box1
        else if(col >= 225 && col <= 275 && row >= 325 && row <= 375) begin if(box2==1)square <=1; else square <= 0; end //box2
		else if(col >= 325 && col <= 375 && row >= 325 && row <= 375) begin if(box3==1)square <=1; else square <= 0; end //box3
        else if(col >= 125 && col <= 175 && row >= 225 && row <= 275) begin if(box4==1)square <=1; else square <= 0; end //box4
		else if(col >= 225 && col <= 275 && row >= 225 && row <= 275) begin if(box5==1)square <=1; else square <= 0; end //box5
        else if(col >= 325 && col <= 375 && row >= 225 && row <= 275) begin if(box6==1)square <=1; else square <= 0; end //box6
		else if(col >= 125 && col <= 175 && row >= 125 && row <= 175) begin if(box7==1)square <=1; else square <= 0; end //box7
        else if(col >= 225 && col <= 275 && row >= 125 && row <= 175) begin if(box8==1)square <=1; else square <= 0; end //box8
		else if(col >= 325 && col <= 375 && row >= 125 && row <= 175) begin if(box9==1)square <=1; else square <= 0; end //box9
        else square <= 0;
    end
    
    //triangle
    always@(posedge clk or posedge rst)
    begin
		if(rst) triangle <= 0;
        else if(col >= 125 && col <= 175 && row >= 325 && row <= 375 && (col<row-200)&&(col+row>500)) begin if(box1==1)triangle <=1; else triangle <= 0; end //box1
		else if(col >= 225 && col <= 275 && row >= 325 && row <= 375 && (col<row-100)&&(col+row>600)) begin if(box1==1)triangle <=1; else triangle <= 0; end //box2
        else if(col >= 325 && col <= 375 && row >= 325 && row <= 375 && (col<row	)&&(col+row>700)) begin if(box1==1)triangle <=1; else triangle <= 0; end //box3
        else if(col >= 125 && col <= 175 && row >= 225 && row <= 275 && (col<row-200)&&(col+row>500)) begin if(box1==1)triangle <=1; else triangle <= 0; end //box4	
        else if(col >= 225 && col <= 275 && row >= 225 && row <= 275 && (col<row-100)&&(col+row>600)) begin if(box1==1)triangle <=1; else triangle <= 0; end //box5
        else if(col >= 325 && col <= 375 && row >= 225 && row <= 275 && (col<row	)&&(col+row>700)) begin if(box1==1)triangle <=1; else triangle <= 0; end //box6
        else if(col >= 125 && col <= 175 && row >= 125 && row <= 175 && (col<row-200)&&(col+row>500)) begin if(box1==1)triangle <=1; else triangle <= 0; end //box7
        else if(col >= 225 && col <= 275 && row >= 125 && row <= 175 && (col<row-100)&&(col+row>600)) begin if(box1==1)triangle <=1; else triangle <= 0; end //box8
        else if(col >= 325 && col <= 375 && row >= 125 && row <= 175 && (col<row	)&&(col+row>700)) begin if(box1==1)triangle <=1; else triangle <= 0; end //box9		
		else triangle <= 0;
    end
    
    //rectangle
    always@(posedge clk or posedge rst)
    begin
		if(rst) rectangle <= 0;
        else if(col >= 125 && col <= 175 && row >= 305 && row <= 355) begin if(box1==1)rectangle <=1; else rectangle <= 0; end //box1
        else if(col >= 225 && col <= 275 && row >= 305 && row <= 355) begin if(box2==1)rectangle <=1; else rectangle <= 0; end //box2
		else if(col >= 325 && col <= 375 && row >= 305 && row <= 355) begin if(box3==1)rectangle <=1; else rectangle <= 0; end //box3
        else if(col >= 125 && col <= 175 && row >= 205 && row <= 255) begin if(box4==1)rectangle <=1; else rectangle <= 0; end //box4
		else if(col >= 225 && col <= 275 && row >= 205 && row <= 255) begin if(box5==1)rectangle <=1; else rectangle <= 0; end //box5
        else if(col >= 325 && col <= 375 && row >= 205 && row <= 255) begin if(box6==1)rectangle <=1; else rectangle <= 0; end //box6
		else if(col >= 125 && col <= 175 && row >= 105 && row <= 155) begin if(box7==1)rectangle <=1; else rectangle <= 0; end //box7
        else if(col >= 225 && col <= 275 && row >= 105 && row <= 155) begin if(box8==1)rectangle <=1; else rectangle <= 0; end //box8
		else if(col >= 325 && col <= 375 && row >= 105 && row <= 155) begin if(box9==1)rectangle <=1; else rectangle <= 0; end //box9
        else rectangle <= 0;    
    end
    
    //frame
    always@(posedge clk or posedge rst)
    begin
        if(rst) frame<=0;
		else if(((col>=100) & (col<=101) & (row>=100) & (row<=400)) & ((col>=399) & (col<=400) & (row>=100) & (row<=400)) & ((col>=200) & (col<=201) & (row>=100) & (row<=400)) & ((col>=299) & (col<=300) & (ror>=100) & (row<=400))& ((col>=100) & (col<=400) & (row>=100) & (row<=101)) & ((col>=100) & (col<=400) & (row>=399) & (row<=400)) & ((col>=100) & (col<=400) & (row>=200) & (row<=201))	& ((col>=100) & (col<=400) & (row>=299) & (row<=300))) frame<=1;
		else frame<=0;
    end
	
	//scoreboard
	always@(posedge rst or posedge clk)
	begin
		if(rst)begin scoreboard1 <=0; scoreboard2 <= 0;
		else if(current_state==ROLL && row_count==20000000)begin scoreboard1 <= score/10; scoreboard2 <= score%10; end
		else begin scoreboard1 <= scoreboard1; scoreboard2 <= scoreboard2; end
	end
	
	//scoreboard
	SCOREBOARD_1 score1(clk,rst,row,col,scoreboard1,score_1);
	SCOREBOARD_2 score2(clk,rst,row,col,scoreboard2,score_2);
    
	//************************ color *********************
    //red
    always@(posedge clk or posedge rst)
    begin
        if (rst) red <= 0;
        else if (visible)
        begin
             if(frame) red <= 0;
			 else if(circle) red <= 1;
			 else if(square) red <= 0;
			 else if(rectangle) red <= 0;
			 else if(triangle) red <= 1;
			 else if(score1) red <= 0;
			 else if(score2) red <= 0;
             else red <= 1;
        end
        else red <= 0;
    end
    
    //green
    always@(posedge clk or posedge rst)
    begin
        if (rst) green <= 0;
        else if (visible)
        begin
             if(frame) green <= 0;
			 else if(circle) green <= 0;
			 else if(square) green <= 1;
			 else if(rectangle) green <=0;
			 else if(triangle) green <= 1;
			 else if(score1) green <= 0;
			 else if(score2) greeen <= 0;
             else green <= 1;
        end
        else green <= 0;
    end
    
    //blue
    always@(posedge clk or posedge rst)
    begin
        if (rst) blue <= 0;
        else if (visible) 
        begin
             if(frame) blue <= 0;
			 else if(circle) blue <= 0;
			 else if(square) blue <= 0;
			 else if(rectangle) blue <= 1;
			 else if(triangle) blue <= 1;
			 else if(score1) green <= 0;
			 else if(score2) green <= 0;
             else blue <= 1;
        end
        else blue <= 0;
    end

    
endmodule
