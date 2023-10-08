`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/25 14:01:47
// Design Name: 
// Module Name: Adder
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


module Adder(clk, rst_n, Data1, Data2, Data3, out); 
parameter b=8;
parameter c=10;
input clk, rst_n;
input signed [b-1:0] Data1, Data2, Data3; //CNN Layer2���� ���� ����� ��Ʈ ���� �ٲ㼭 ����ؾ� �ϹǷ� �Ķ���ͷ� ��Ʈ �� ���� 
output reg signed [c-1:0] out; //CNN Layer2���� ���� ����� ��Ʈ ���� �ٲ㼭 ����ؾ� �ϹǷ� �Ķ���ͷ� ��Ʈ �� ���� 
always@(posedge clk) begin
if(rst_n) //rst�� 1�̸� out�� 0���� �ʱ�ȭ
out<=0;
else begin
out <= Data1 + Data2 + Data3; //3���� �Է��� ���� convolution �� ����
end
end
endmodule

