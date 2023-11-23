`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/24 20:25:35
// Design Name: 
// Module Name: LFSR
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


module LFSR(clk, arst_n, LFSR);

parameter BITWIDTH = 5;
input clk, arst_n;
output reg [BITWIDTH-1:0] LFSR;

always @(posedge clk or negedge arst_n) begin
    if(!arst_n) LFSR <= 1;
    else        LFSR <= {LFSR[0]^LFSR[2], LFSR[4], LFSR[3], LFSR[2], LFSR[1]};
end

endmodule
