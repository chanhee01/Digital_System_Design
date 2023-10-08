`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/25 14:57:54
// Design Name: 
// Module Name: RingCounterX3_1
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


module RingCounterX3_1(clk, rst_n, Start, out);

input clk, rst_n, Start;
output reg [14:0] out;

always@(posedge clk, negedge rst_n)
begin
if(!rst_n) out <= 15'b000_0000_0000_0010;
else begin
    if(Start) begin
        out[1] <= out[13];
        out[4] <= out[1];
        out[7] <= out[4];
        out[10] <= out[7];
        out[13] <= out[10];
    end
end
end

endmodule