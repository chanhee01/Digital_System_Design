`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/31 16:56:12
// Design Name: 
// Module Name: counter_tb
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


module counter_tb;

    reg [3:0] data;
    reg rst_n;
    reg load;
    reg clk;
    wire [3:0] out;
    reg enable;
    reg select;

initial begin
    enable = 0;
    data[3:0] = 4'b0110;
    load = 1;
    select = 1;
    rst_n = 0;
    clk = 0;
    #40 load = 0;
end

initial #20 rst_n = 1;


always #10 clk = ~clk;
always #20 enable = ~enable;
always #80 select = ~select;


counter DUT(clk, rst_n, data, load, enable, select, out);

endmodule
