`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/03 21:31:23
// Design Name: 
// Module Name: tb_MaxMin_Finder
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


module tb_MaxMin_Finder();

reg[2:0] WriteReg;
reg[15:0] WriteData;
reg WriteEn, clk, rst;
wire[15:0] Max, Min;
wire start;
wire valid;

always #5 clk = ~clk;
initial begin
rst = 0;
clk = 0;
WriteData = 45;
WriteEn = 0;
WriteReg = 0;
#10 rst = 1;
#5 WriteEn = 1;

end

MaxMin_Finder finder(WriteReg, WriteEn, WriteData, Max, Min, start, clk, rst, valid);

endmodule
