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
    reg [4:0]current_state,next_state;
    reg [5:0]score;
    reg up,down;
    reg [24:0]row_count;
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
                    IDLE:if(!SW[0] & !SW[1] & !SW[2] & !SW[3] & up==1)next_state=ROLL;
                         else next_state=current_state;
                    ROLL:if(score==50||lose==1)next_state=WINORLOSE;
                        else next_state=current_state;
                    WINORLOSE:if(down==1)next_state=IDLE;
                        else next_state=current_state;
                    default:next_state=IDLE;
            endcase
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
        else if(current_state==ROLL & row_count>=0 & (row_count%1000000==0))
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
    
    //********************winorlose*******************
    always@(posedge clkj or posedge rst)
    begin
        if(rst)lose <= 0;
        else if(current_state==ROLL & row_count==20000000)
            begin
            if(box1==box2 & box1==box3 & box2==box3) lose <= 0; //first column
            else if(box4==box5 & box4==box6 & box5==box6) lose <= 0; //second column
            else if(box7==box8 & box7==box9 & box8==box9) lose <= 0; //third column
            else if(box1==box4 & box1==box7 & box4==box7) lose <= 0; //first row
            else if(box2==box5 & box2==box8 & box5==box8) lose <= 0; //second row
            else if(box3==box6 & box3==box9 & box6==box9) lose <= 0; //third row
            else if(box1==box5 & box1==box9 & box5==box9) lose <= 0; // "\" 
            else if(box3==box5 & box3==box7 & box5==box7) lose <= 0; // "/"
            else lose <= 1;
            end
        else lose <= 0;
    end
    
    //*******************score*************************
    always@(posedge clk or posedge rst)
    begin
        if(rst)
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
        else if() circle <= 1;
        else circle <= 0;
    end
    
    //square
    always@(posedge clk or posedge rst)
    begin
    
    end
    
    //triangle
    always@(posedge clk or posedge rst)
    begin
    
    end
    
    //rectangle
    always@(posedge clk or posedge rst)
    begin
    
    end
    
    //frame
    always@(posedge clk or posedge rst)
    begin
        if(rst) frame<=0;
		else if(((col>=100) & (col<=101) & (row>=100) & (row<=500)) & ((col>=499) & (col<=500) & (row>=100) & (row<=500)) & ((col>=250) & (col<=251) & (row>=100) & (row<=500)) & ((col>=100) & (col<=500) & (row>=100) & (row<=101))& ((col>=100) & (col<=500) & (row>=499) & (row<=500))& ((col>=100) & (col<=500) & (row>=250) & (row<=251))) frame<=1;
		else frame<=0;
    end
    
	//************************ color *********************
    //red
    always@(posedge clk or posedge rst)
    begin
        if (rst) red <= 0;
        else if (visible)
        begin
             if(frame) red <= 0;
             else red <=0 ;
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
             else green <= 0 ;
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
             else blue <= 1 ;
        end
        else blue <= 0;
    end

    
endmodule
