`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/21 19:22:14
// Design Name: 
// Module Name: tb_full_adder_32bit
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


module tb_full_adder_32bit;

reg [31:0] x, y;
reg c_in;
wire [31:0] sum;
wire c_out;

initial begin
    x = 0;
    y = 0;
    c_in = 0;
end

always #10 x = 123;
always #20 y = 555;
always #30 c_in = 1;


full_adder_32bit FA32bit(.x(x), .y(y), .c_in(c_in), .sum(sum), .c_out(c_out));

endmodule
