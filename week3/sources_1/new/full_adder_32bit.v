`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/21 18:33:27
// Design Name: 
// Module Name: full_adder_32bit
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


module full_adder_32bit(x, y, c_in, sum, c_out);
input [31:0] x, y;
input c_in;
output [31:0] sum;
output c_out;

wire c;


full_adder_16bit FA32_1(x[15:0], y[15:0], c_in, sum[15:0], c);
full_adder_16bit FA32_2(x[31:16], y[31:16], c, sum[31:16], c_out);

endmodule
