`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/14 17:14:36
// Design Name: 
// Module Name: CNN_Single_Layer
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


module CNN_Single_Layer(clk, rst_n, Start, Image, Filter, ReadEn, ConvResult);
parameter a=4;
parameter b=8;
parameter c=10;

input clk;
input rst_n;
input Start;
input [a-1:0] Image;
input signed [a-1:0] Filter;
input ReadEn;
output signed [c-1:0] ConvResult;

wire signed[b-1:0] MultValue;
wire [3:0] WriteReg;
wire [3:0] ReadReg1, ReadReg2, ReadReg3;
wire signed[b-1:0] ReadData1, ReadData2, ReadData3;
wire signed[c-1:0] d_in;

Multiplicator multiplicator(Start, Image, Filter, MultValue);

AddressCounter counter(clk, ReadEn, Start, rst_n, ReadReg1, ReadReg2, ReadReg3, WriteReg);

RegisterFile register(clk, rst_n, Start, WriteReg, MultValue, ReadEn, ReadReg1,
                      ReadReg2, ReadReg3, ReadData1, ReadData2, ReadData3);

Adder adder(clk, rst_n, ReadData1, ReadData2, ReadData3, d_in);

ReLU relu(d_in, ConvResult);

endmodule