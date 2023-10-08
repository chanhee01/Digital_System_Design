`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/25 11:19:21
// Design Name: 
// Module Name: RingCounterX3
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


module RingCounterX3(clk, rst_n, Start, out);

input clk, rst_n, Start;
output reg [14:0] out;

always@(posedge clk, negedge rst_n)
begin
if(!rst_n) out <= 15'b000_0000_0000_0001;
else begin
    if(Start) begin
        out[0] <= out[12];
        out[3] <= out[0];
        out[6] <= out[3];
        out[9] <= out[6];
        out[12] <= out[9];
    end
end
end

endmodule
