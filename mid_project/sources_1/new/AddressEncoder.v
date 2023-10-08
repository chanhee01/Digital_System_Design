`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/25 11:25:23
// Design Name: 
// Module Name: AddressEncoder
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


module AddressEncoder(AddrIn, AddrOut);

input [14:0] AddrIn;
output reg [3:0] AddrOut;

always@(*) begin
    case(AddrIn)
        15'b100_0000_0000_0000 : AddrOut = 0;
        15'b010_0000_0000_0000 : AddrOut = 14;
        15'b001_0000_0000_0000 : AddrOut = 13;
        15'b000_1000_0000_0000 : AddrOut = 12;
        15'b000_0100_0000_0000 : AddrOut = 11;
        15'b000_0010_0000_0000 : AddrOut = 10;
        15'b000_0001_0000_0000 : AddrOut = 9;
        15'b000_0000_1000_0000 : AddrOut = 8;
        15'b000_0000_0100_0000 : AddrOut = 7;
        15'b000_0000_0010_0000 : AddrOut = 6;
        15'b000_0000_0001_0000 : AddrOut = 5;
        15'b000_0000_0000_1000 : AddrOut = 4;
        15'b000_0000_0000_0100 : AddrOut = 3;
        15'b000_0000_0000_0010 : AddrOut = 2;
        15'b000_0000_0000_0001 : AddrOut = 1;
        default : AddrOut = 0;
    endcase
end
endmodule
