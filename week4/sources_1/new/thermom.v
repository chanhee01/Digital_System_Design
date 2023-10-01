`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/02 00:04:34
// Design Name: 
// Module Name: thermom
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


module thermom(therm, out, decimal, enable);
    input [2:0] decimal;
    input enable;
    output reg [6:0] therm;
    output reg [2:0] out;
    
    always @(*)
    if (enable == 0) out = 3'b000;
    else
    begin
    case (decimal)
        3'b000: out = 3'b000;
        3'b001: out = 3'b001;
        3'b010: out = 3'b011;
        3'b011: out = 3'b010;
        3'b100: out = 3'b110;
        3'b101: out = 3'b111;
        3'b110: out = 3'b101;
        3'b111: out = 3'b100;
    endcase
    end
    
    
    always @(*)
    case (decimal)
        3'b000: therm = 7'b0000000;
        3'b001: therm = 7'b0000001;
        3'b010: therm = 7'b0000011;
        3'b011: therm = 7'b0000111;
        3'b100: therm = 7'b0001111;
        3'b101: therm = 7'b0011111;
        3'b110: therm = 7'b0111111;
        3'b111: therm = 7'b1111111;
    endcase

endmodule
