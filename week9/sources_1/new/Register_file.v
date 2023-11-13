`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/02 00:28:18
// Design Name: 
// Module Name: Register_file
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


module Register_file(WriteRegA, WriteDataA, WriteEnA, ReadRegA1, ReadRegA2,
                     WriteRegB, WriteDataB, WriteEnB, ReadRegB, clk, rst, start,
                     out1, out2);
                     
input [2:0] WriteRegA, ReadRegA1, ReadRegA2;
input [3:0] WriteDataA;
input [3:0] WriteRegB, ReadRegB;
input [7:0] WriteDataB;
input clk, rst, start, WriteEnA, WriteEnB;

output reg [3:0] out1, out2;

wire [3:0] ReadDataA1, ReadDataA2;
wire [7:0] ReadDataB;

reg [3:0] reg_fileA [0:7];
reg [7:0] reg_fileB [0:15];
integer i;

initial begin
    $readmemh("mem.mem", reg_fileA);
end

assign ReadDataA1 = reg_fileA[ReadRegA1];
assign ReadDataA2 = reg_fileA[ReadRegA2];

always @(posedge clk) begin
    if(rst) begin
        for(i = 0; i < 8; i = i + 1)
            reg_fileA[i] = 8'b0;
    end
    else begin
        if(WriteEnA) reg_fileA[WriteRegA] <= WriteDataA;
    end
end

initial begin
    $readmemh("mem.mem", reg_fileB);
end

assign ReadDataB = reg_fileB[ReadRegB];

always @(posedge clk) begin
    if(rst) begin
        for(i = 0; i < 8; i = i + 1)
            reg_fileB[i] = 16'b0;
    end
    else begin
        if(WriteEnB) reg_fileB[WriteRegB] <= WriteDataB;
    end
end
    
wire [3:0] sum;
wire c_out;

assign sum[3] = ReadDataA1[3]+ReadDataB[7];
assign sum[2] = ReadDataA1[2]+ReadDataB[6];
assign sum[1] = ReadDataA1[1]+ReadDataB[5];
assign sum[0] = ReadDataA1[0]+ReadDataB[4];
              
assign c_out = ReadDataA1[3] & ReadDataB[7];

reg[4:0] out3;

always @(*) begin
    if(start) begin
        if(c_out) begin
            out3 = {c_out, sum};
            out1 = out3[4:1];
            end
        else out1 = sum;
        end
    else out1 = 0;
end

always @(*) begin
    if(start) begin
        if(ReadDataA2 > ReadDataB[3:0]) out2 = ReadDataA2;
        else out2 = ReadDataB[3:0];
    end
    else out2 = 0;
end
endmodule

