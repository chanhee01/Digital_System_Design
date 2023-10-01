`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/31 16:35:26
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


module counter(clk, rst_n, data, load, enable, select, out);
    input clk, rst_n;
    input [3:0] data;
    input load, enable, select;
    output reg [3:0] out;
    
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) out <= 4'b0000;
        else begin
            if (load) out <= data;
            else if (!load && enable)
                begin
                if (select) out <= out + 1;
                else if (!select) out <= out - 1;
                end
            else if (!load && !enable) out <= out;
            end
    end

endmodule
