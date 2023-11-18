`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/15 22:08:59
// Design Name: 
// Module Name: tb_Lemmings
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


module tb_Lemmings();

reg clk, areset, bump_left, bump_right, ground, dig;
wire walk_left, walk_right, aaah, digging;

always #5 clk = ~clk;

initial begin
areset = 0;
clk = 0;
bump_left = 0;
bump_right = 0;
ground = 1;
dig = 0;
#10 areset = 1;
#40 bump_left = 1;
#20 bump_left = 0; bump_right = 1;
#20 bump_right = 0; dig = 1;
#30 bump_left = 1; ground = 0;
#20 dig = 0;
#30 ground = 1; dig = 1;
#10 bump_left = 0; bump_right = 1;
#30 dig = 0;
#50 $finish;
end

Lemmings leam(clk, areset, bump_left, bump_right, ground, dig,
                walk_left, walk_right, aaah, digging);
endmodule
