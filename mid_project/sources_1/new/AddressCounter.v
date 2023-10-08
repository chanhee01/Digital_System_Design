`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/25 11:03:34
// Design Name: 
// Module Name: AddressCounter
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


module AddressCounter(clk, rst_n, Start, ReadEn, WriteReg, ReadReg1, ReadReg2, ReadReg3);

input clk, rst_n, Start, ReadEn;
output [3:0] WriteReg, ReadReg1, ReadReg2, ReadReg3;
wire [14:0] data0, data1, data2, data3;

RingCounter counter0(clk, rst_n, Start, data0);
AddressEncoder encoder0(data0, WriteReg);
//WriteReg


RingCounterX3 counter1(clk, rst_n, Start, data3);
AddressEncoder encoder1(data3, ReadReg1);
//ReadReg1


RingCounterX3_1 counter2(clk, rst_n, Start, data2);
AddressEncoder encoder2(data2, ReadReg2);
//ReadReg2


RingCounterX3_2 counter3(clk, rst_n, Start, data1);
AddressEncoder encoder3(data1, ReadReg3);
//ReadReg3


endmodule
