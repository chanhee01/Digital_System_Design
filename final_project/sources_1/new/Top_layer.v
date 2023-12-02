`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/14 17:19:34
// Design Name: 
// Module Name: Top_layer
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


module Top_layer(clk, rst_n, Start1, Image, Filter1, ReadEn1, Start2, Filter2, ReadEn2, ConvResult);

input clk, rst_n, Start1, ReadEn1, Start2, ReadEn2;
input [3:0] Image;
input signed [3:0] Filter1;
input signed [9:0] Filter2;

output signed [21:0] ConvResult;
wire [9:0] result1;

CNN_Single_Layer layer1(clk, rst_n, Start1, Image, Filter1, ReadEn1, result1);
CNN_single_Layer2 layer2(clk, rst_n, Start2, result1, Filter2, ReadEn2, ConvResult);

endmodule