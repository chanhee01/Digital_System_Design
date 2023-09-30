`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/22 17:38:38
// Design Name: 
// Module Name: Full_sub1bit
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


module Full_sub1bit(x,y,b0,b_out,s);

input x,y,b0;
output b_out,s;
wire s0, b1, b2;
sub a0(x,y,b1,s0);
sub a1(s0,b0,b2,s);
assign b_out = b1 + b2;

endmodule
