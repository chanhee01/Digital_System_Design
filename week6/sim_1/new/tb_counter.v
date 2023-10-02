`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/09 16:20:22
// Design Name: 
// Module Name: tb_counter
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


module tb_counter();

parameter n = 32;

reg [n-1:0] PCdata;
reg PCload, PCinc, clk, rst_n;
wire [n-1:0] PCout;

initial begin
rst_n = 0;
PCdata = 32;
PCinc = 0;
PCload = 1;
clk = 1;
#30 rst_n = 1;
#20 PCload = 0;
end

always #5 clk <= ~clk;
always #15 PCinc <= ~ PCinc;

counter count(.clk(clk), .rst_n(rst_n), .PCdata(PCdata), .PCload(PCload), .PCinc(PCinc), .PCout(PCout));

endmodule
