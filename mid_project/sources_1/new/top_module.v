`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/13 16:01:23
// Design Name: 
// Module Name: top_module
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


module Top_layer(clk, rst_n, Start1, Image, Filter1, ReadEn1,
                  Start2, Filter2, ReadEn2, ConvResult);
input clk, rst_n;
//Layer 1 input signals
input Start1;
input [3:0] Image;
input signed [3:0] Filter1;
input ReadEn1;
//Layer 2 input signals
input Start2;
input signed [9:0] Filter2;
input ReadEn2;
//Layer 2 output signals
output signed [21:0] ConvResult;
wire [9:0] result1;
CNN_Single_Layer CSL1(clk, rst_n, Start1, Image, Filter1, ReadEn1, result1);
 CNN_single_Layer2 CSL2(clk, rst_n, Start2, result1, Filter2, ReadEn2, ConvResult);
endmodule
