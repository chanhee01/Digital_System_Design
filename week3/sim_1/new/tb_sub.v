`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/22 17:45:36
// Design Name: 
// Module Name: tb_sub
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


module tb_sub;
reg[3:0] x1,y1;
reg b01;
wire[3:0] s1;
wire b1;
wire d1;

initial begin
x1 = 4; y1 = 2; b01=0;
#10
x1 = 5; y1 = -2; b01=0;
#10
x1 = 4; y1 = -6; b01=0;
end

Full_sub4bit(x1,y1,b01,b1,s1,d1);

endmodule
