`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/24 20:58:27
// Design Name: 
// Module Name: tb_Galois
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


module tb_Galois();

reg clk, arst_n, L;
reg [2:0] r;
wire [2:0] LFSR;

initial begin
clk = 0; arst_n = 0; L = 0;
r = 3'b110;
#5 arst_n = 1;
#35 L = 1;
#10 L = 0;
end

always #5 clk <= ~clk;

Galois galois(clk, arst_n, r, L, LFSR);

endmodule
