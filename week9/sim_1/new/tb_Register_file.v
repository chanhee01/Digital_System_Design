`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/02 16:11:59
// Design Name: 
// Module Name: tb_Register_file
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


module tb_Register_file();

reg [2:0] WriteRegA, ReadRegA1, ReadRegA2;
reg [3:0] WriteDataA, WriteRegB, ReadRegB;
reg [7:0] WriteDataB;
reg WriteEnA, WriteEnB, clk, rst, start;
wire [3:0] out1, out2;

initial begin
WriteEnA = 0; WriteEnB = 0; clk = 0; rst = 1; WriteDataA = 0; WriteDataB = 0;
start = 0;
ReadRegA1 = 4; ReadRegA2 = 6; ReadRegB = 8; WriteRegA = 0; WriteRegB = 0;
#5 rst = 0;
#20 start = 1;
end

always #5 clk <= ~clk;

Register_file reg_file (WriteRegA, WriteDataA, WriteEnA, ReadRegA1, ReadRegA2,
                     WriteRegB, WriteDataB, WriteEnB, ReadRegB, clk, rst, start,
                     out1, out2);
                     
endmodule
