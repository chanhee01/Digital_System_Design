`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/25 11:14:07
// Design Name: 
// Module Name: RingCounter
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


module RingCounter(clk, rst_n, Start, out);

input clk, rst_n, Start;
output reg [14:0] out;

always@(posedge clk, negedge rst_n)
begin
if(!rst_n) out <= 15'b100_0000_0000_0000;
else begin
    if(Start) begin
        out[0] <= out[14];
        out[1] <= out[0];
        out[2] <= out[1];
        out[3] <= out[2];
        out[4] <= out[3];
        out[5] <= out[4];
        out[6] <= out[5];
        out[7] <= out[6];
        out[8] <= out[7];
        out[9] <= out[8];
        out[10] <= out[9];
        out[11] <= out[10];
        out[12] <= out[11];
        out[13] <= out[12];
        out[14] <= out[13];
    end
end
end

endmodule
