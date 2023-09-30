`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/22 17:40:26
// Design Name: 
// Module Name: Full_sub4bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Full_sub4bit(x,y,b0,b_out,s,D);
input signed [3:0]x;
input signed [3:0]y;
input b0;
output b_out;
output signed [3:0]s;
output D;
wire b1, b2, b3;

Full_sub1bit a1(x[0],y[0],b0,b1,s[0]);
Full_sub1bit a2(x[1],y[1],b1,b2,s[1]);
Full_sub1bit a3(x[2],y[2],b2,b3,s[2]);
Full_sub1bit a4(x[3],y[3],b3,b_out,s[3]);
assign D = b_out^b3;
endmodule
