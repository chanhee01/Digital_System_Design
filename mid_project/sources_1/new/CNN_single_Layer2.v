`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/13 15:45:04
// Design Name: 
// Module Name: CNN_single_Layer2
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


module CNN_single_Layer2(clk, rst_n, Start, Image, Filter, ReadEn, ConvResult);

parameter a = 10;
parameter c = 22;
parameter b = 20;

input clk, rst_n, Start;
input [a-1:0] Image;
input signed [a-1:0] Filter;
input ReadEn;
output signed [c-1:0] ConvResult;

wire signed [b-1:0] MultValue;
wire [3:0] WriteReg;
wire [3:0] ReadReg1, ReadReg2, ReadReg3;
wire signed[b-1:0] ReadData1, ReadData2, ReadData3;
wire signed[c-1:0] d_in;

multiplicator #(10, 20) multi (Start, Image, Filter, MultValue);

AddressCounter ac (clk, ReadEn, Start, rst_n, ReadReg1, ReadReg2, ReadReg3, WriteReg);

RegisterFile #(4, 16, 20) rf (clk, rst_n, Start, WriteReg, MultValue, ReadEn, ReadReg1, ReadReg2,
                              ReadReg3, ReadData1, ReadData2, ReadData3);
                              
Adder #(20, 22) adder (clk, rst_n, ReadData1, ReadData2, ReadData3, d_in);

ReLU #(22) relu(d_in, ConvResult);

endmodule
