`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/21 18:26:31
// Design Name: 
// Module Name: full_adder_16bit
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


module full_adder_16bit(x, y, c_in, sum, c_out);
input [15:0] x, y;
input c_in;
output [15:0] sum;
output c_out;

wire c1, c2, c3;

full_adder_4bit FA16_1(x[3:0], y[3:0], c_in, sum[3:0], c1);
full_adder_4bit FA16_2(x[7:4], y[7:4], c1, sum[7:4], c2);
full_adder_4bit FA16_3(x[11:8], y[11:8], c2, sum[11:8], c3);
full_adder_4bit FA16_4(x[15:12], y[15:12], c3, sum[15:12], c_out);

    
endmodule
