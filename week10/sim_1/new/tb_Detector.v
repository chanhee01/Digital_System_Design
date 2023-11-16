`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/10 20:29:31
// Design Name: 
// Module Name: tb_Detector
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


module tb_Detector();


reg clk;
reg rst_n;
reg X;
wire Y;

initial begin
    clk = 0;
    rst_n = 0;
    X = 0;
    #10 rst_n = 1;
    #10 X = 1;
    #10 X = 1;
    #10 X = 1;
    #10 X = 0;
    #10 X = 0;
    #10 X = 1;
    #10 X = 1;
    #10 X = 0;
    #10 $finish;
end

always #5 clk = ~clk;


Detector detector(clk, rst_n, X, Y);

endmodule
