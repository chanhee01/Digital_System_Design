`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/15 20:26:24
// Design Name: 
// Module Name: tb_mux
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


module tb_mux;
reg A, B, C, D;
reg s1, s0;
wire out;

initial begin
s0 = 0; s1 = 0;

A=1; B=0; C=0; D=0;

#5 A=0;
#5 s1=0; s0=1;
#5 B=1; 
#5 C=1; B=0; s1=1; s0=0;
#10 C=0; D=1; s0=1;
#5 D=0;


end

mux DUT(.s1(s1), .s0(s0), .A(A), .B(B), .C(C), .D(D), .out(out));

endmodule

