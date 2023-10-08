`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/25 10:48:37
// Design Name: 
// Module Name: multiplicator
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


module multiplicator(Start, din0, din1, dout);
input Start;
input [3:0] din0, din1;
output reg [7:0] dout;

always@(*)
begin
    if(Start) dout = din0 * din1;
    else dout = dout;
end

endmodule
