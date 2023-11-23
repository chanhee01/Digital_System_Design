`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/24 20:50:02
// Design Name: 
// Module Name: Galois
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


module Galois(clk, arst_n, r, L, LFSR);

input clk;
input arst_n;
input [2:0] r;
input L;
output reg [2:0] LFSR;

always @(posedge clk or negedge arst_n) begin
    if(!arst_n) LFSR <= 3'b001;
    else begin
        if(!L)
            LFSR <= {LFSR[0], LFSR[2], LFSR[1]^LFSR[0]};
        else
            LFSR <= {r[2], r[1], r[0]};
        end
    end

endmodule
