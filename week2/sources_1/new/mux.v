`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/15 20:25:53
// Design Name: 
// Module Name: mux
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


module mux(
    A, B, C, D, s0, s1, out
    );
    
input A, B, C, D, s0, s1;
output out;

not (b0, s0);
not (b1, s1);
and (x0, A, b0, b1);
and (x1, B, s0, b1);
and (x2, C, b0, s1);
and (x3, D, s0, s1);

or (out, x0, x1, x2, x3);

endmodule
