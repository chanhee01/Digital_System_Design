`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/24 20:31:54
// Design Name: 
// Module Name: tb_LFSR
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


module tb_LFSR();

parameter BITWIDTH = 5;
reg clk, arst_n;
wire [BITWIDTH-1:0] LFSR;

initial begin
clk = 0; arst_n = 0;
#5 arst_n = 1;
end

always #5 clk <= ~clk;

LFSR lfsr(clk, arst_n, LFSR);

endmodule
