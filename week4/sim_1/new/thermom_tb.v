`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/04/02 00:04:52
// Design Name: 
// Module Name: thermom_tb
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


module thermom_tb();

reg [2:0] decimal;
wire [6:0] therm;
wire [2:0] out;
reg enable;

initial decimal = 000;

initial begin
enable = 0;
#20 enable = 1;
end

always #10 decimal <= decimal + 1;


thermom DUT (therm, out, decimal, enable);

endmodule

