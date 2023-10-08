`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/25 15:05:59
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
parameter c=10;
parameter b=8;
  
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

multiplicator Multiplicator (.Start(Start), .din0(Image), .din1(Filter), .dout(MultValue));
   

AddressCounter AddressCounter (.clk(clk), .rst_n(rst_n), .Start(Start), .WriteReg(WriteReg), .ReadEn(ReadEn),
        .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3));

RegisterFile #(.M(4), .N(15), .W(8))
        RegisterFile (.clk(clk), .rst_n(rst_n), .WriteEn(Start), .WriteReg(WriteReg), .WriteData(MultValue),
        .ReadEn(ReadEn), .ReadReg1(ReadReg1), .ReadReg2(ReadReg2), .ReadReg3(ReadReg3),
        .ReadData1(ReadData1), .ReadData2(ReadData2), .ReadData3(ReadData3));

Adder ADDER(.clk(clk), .rst_n(rst_n), .data1(ReadData1), .data2(ReadData2), .data3(ReadData3), .out(ConvResult));
    
ReLU relu(.d_in(d_in), .ConvResult(ConvResult));

endmodule