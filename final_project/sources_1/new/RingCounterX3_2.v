`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/14 17:19:13
// Design Name: 
// Module Name: RingCounterX3_2
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

module RingCounterX3_2(clk, Start, rst_n, out);

input clk, Start, rst_n;
output reg [14:0] out;

always@(posedge clk) begin
if(rst_n) out=15'b100_0000_0000_0000;
else begin
        if(Start) begin
        out[2] <= out[14];
        out[5] <= out[2];
        out[8] <= out[5];
        out[11] <= out[8];
        out[14] <= out[11];
        end
    end
end
endmodule
