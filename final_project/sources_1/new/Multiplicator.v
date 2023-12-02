`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/14 17:16:09
// Design Name: 
// Module Name: Multiplicator
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


module Multiplicator(Start, din0, din1, dout);

parameter a=4;
parameter b=8;

input Start;
input signed [a-1:0] din0, din1;
output reg signed [b-1:0] dout;

always@(*) begin
    if(Start) dout = $signed({1'b0,din0}) * $signed(din1);
end

endmodule