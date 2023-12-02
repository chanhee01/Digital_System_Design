`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/14 17:13:19
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

module AddressCounter(clk, ReadEn, start,rst_n,ReadReg1,ReadReg2,ReadReg3,WriteReg);

input clk, ReadEn,start,rst_n;
output [3:0] ReadReg1,ReadReg2,ReadReg3,WriteReg;
wire [14:0] data0,data1,data2,data3;

Ringcounter counter0(clk, start, rst_n, data0);
AddressEncoder encoder0(data0, WriteReg);


RingCounterX3_2 counter1(clk, ReadEn, rst_n, data1);
AddressEncoder encoder1(data1, ReadReg1);


RingCounterX3 counter2(clk, ReadEn, rst_n, data2);
AddressEncoder encoder2(data2, ReadReg2);


RingCounterX3_1 counter3(clk, ReadEn, rst_n, data3);
AddressEncoder encoder3(data3, ReadReg3);

endmodule