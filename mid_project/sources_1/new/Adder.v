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
input signed [b-1:0] Data1, Data2, Data3; //CNN Layer2에서 같은 모듈을 비트 수만 바꿔서 사용해야 하므로 파라미터로 비트 수 선언 
output reg signed [c-1:0] out; //CNN Layer2에서 같은 모듈을 비트 수만 바꿔서 사용해야 하므로 파라미터로 비트 수 선언 
always@(posedge clk) begin
if(rst_n) //rst이 1이면 out을 0으로 초기화
out<=0;
else begin
out <= Data1 + Data2 + Data3; //3개의 입력을 더한 convolution 값 도출
end
end
endmodule

