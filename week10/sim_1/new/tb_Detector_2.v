`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/10 21:33:34
// Design Name: 
// Module Name: tb_Detector_2
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


module tb_Detector_2();

reg clk;
reg rst_n;
reg X;
wire Y;

initial begin
    clk = 0; rst_n = 0; X = 0;
    #5 rst_n = 1;
    #10 X = 1;
    #10 X = 0;
    #10 X = 0;
    #10 X = 1;
    #10 X = 0;
    #10 X = 1;
    #10 X = 0;
    #10 X = 0;
    #10 X = 1;
    #10 X = 0;
    #10 X = 0;
    #10 X = 1;
    #10 X = 1;
    #10 X = 0;
    #10 X = 1;
end

always #5 clk <= ~clk;

Detector_2 detector_2(clk, rst_n, X, Y);

endmodule
