`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/14 17:12:30
// Design Name: 
// Module Name: adder
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

module Adder(clk, rst_n, data1, data2, data3, out);

parameter a = 8;
parameter b = 10;

input clk, rst_n;
input signed [a-1:0] data1, data2, data3;
output reg signed [b-1:0] out; 

always@(posedge clk) begin
    if(rst_n) out <= 0;
    else out <= data1 + data2 + data3;
end
endmodule
