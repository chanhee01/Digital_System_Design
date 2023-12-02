`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/14 17:13:02
// Design Name: 
// Module Name: ReLU
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


module ReLU(d_in, d_out);

parameter a = 10;
input signed [a-1:0] d_in;
output [a-1:0] d_out;

assign d_out = (d_in > 0) ? d_in : 0;
endmodule
