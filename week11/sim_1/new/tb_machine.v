`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/16 22:05:17
// Design Name: 
// Module Name: tb_machine
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


module tb_machine();

reg clk, rst_n, coin, buy;
wire coffee, return;

always #5 clk = ~clk;
initial begin
rst_n = 0; coin = 0; buy = 0; clk = 0;
#10 rst_n = 1; coin = 1;
#30 coin = 0;
#10 buy = 1;
#10 coin = 1; buy = 0;
#20 coin = 0; buy = 1;
#10 $finish;
end

machine m(clk, rst_n, coin, buy, coffee, return);
endmodule
