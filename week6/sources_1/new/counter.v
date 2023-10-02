`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/09 16:06:55
// Design Name: 
// Module Name: counter
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


module counter(clk, rst_n, PCdata, PCload, PCinc, PCout);

parameter n = 32;

input clk, rst_n;
input [n-1:0] PCdata;
input PCload, PCinc;
output reg [n-1:0] PCout;

always @(posedge clk, negedge rst_n)
begin
    if(!rst_n) PCout <= 0;
    else if (PCload) PCout <= PCdata;
    else begin
    case(PCinc)
        0 : PCout <= PCout;
        1 : PCout <= PCout + 1;
    endcase
    end
end

endmodule
