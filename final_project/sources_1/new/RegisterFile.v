`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/14 17:16:49
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(clk, rst_n, WriteEn, WriteReg, WriteData, ReadEn, ReadReg1, ReadReg2, ReadReg3,
                    ReadData1, ReadData2, ReadData3);

parameter M = 4;
parameter N = 15;
parameter W = 8;

input clk, rst_n, WriteEn;
input [M-1:0] WriteReg;
input signed [W-1:0] WriteData;
input ReadEn;
input [M-1:0] ReadReg1, ReadReg2, ReadReg3;
output reg signed [W-1:0] ReadData1, ReadData2, ReadData3;
reg [W-1:0] regfile[0:N-1];

always@(posedge clk) begin
    if(rst_n) $readmemh("mem.mem", regfile);
    else begin
        if(WriteEn) regfile[WriteReg] <= WriteData;
        else if(ReadEn)
        begin
            ReadData1 <= regfile[ReadReg1];
            ReadData2 <= regfile[ReadReg2];
            ReadData3 <= regfile[ReadReg3];
        end else begin
            ReadData1 <= 0;
            ReadData2 <= 0;
            ReadData3 <= 0;
        end
    end
end

endmodule
