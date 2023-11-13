`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/03 20:09:49
// Design Name: 
// Module Name: MaxMin_Finder
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


module MaxMin_Finder(WriteReg, WriteEn, WriteData, Max, Min, start, clk, rst, valid);

input [2:0] WriteReg;
input [15:0] WriteData;
input WriteEn, clk, rst;
output reg[15:0] Max, Min;
reg[15:0] reg_file[0:7];
reg[3:0] count;
output reg start;
output reg valid;
integer i;

always @(posedge clk or negedge rst) begin
    if(!rst) begin
        count <= 0;
        Max <= 0;
        Min <= 0;
        start <= 0;
    end
    else begin
        if(WriteEn) begin
            reg_file[WriteReg+count] <= WriteData + count;
            count <= count + 1;
        end
    
    if(count == 8) begin
        start <= 1;
        valid <= 1;
        end
    else valid <= 0;
    end
end


always @(posedge clk) begin
    if(start) begin
        for(i = 0; i < 4; i = i +1) begin
            Max <= reg_file[2*i];
            Min <= reg_file[2*i+1];
            if(Max<reg_file[2*i]) Max <= reg_file[2*i];
            else if (Max<reg_file[2*i+1]) Max <= reg_file[2*i+1];
            else Max <= Max;
        end
            
        for(i = 0; i < 4; i = i +1) begin
            if(Min>reg_file[2*i]) Min <= reg_file[2*i];
            else if (Min>reg_file[2*i+1]) Min <= reg_file[2*i+1];
            else Min <= Min;
        end
    end
end       

endmodule


