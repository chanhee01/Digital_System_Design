`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/25 15:00:50
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


module RingCounterX3_2(clk, rst_n, Start, out);

input clk, rst_n, Start;
output reg [14:0] out;

always@(posedge clk, negedge rst_n)
begin
if(!rst_n) out <= 15'b000_0000_0000_0100;
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
