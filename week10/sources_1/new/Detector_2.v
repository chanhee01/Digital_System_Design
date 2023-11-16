`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/10 21:22:06
// Design Name: 
// Module Name: Detector_2
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


module Detector_2(clk, rst_n, X, Y);

input clk, rst_n, X;
output Y;
parameter [1:0] S0 = 2'b00,
                 S1 = 2'b01,
                 S2 = 2'b10,
                 S3 = 2'b11;
                 
reg [1:0] present_state, next_state;

always @(posedge clk or negedge rst_n) begin // Next state
    if (!rst_n) present_state <= S0;
    else        present_state <= next_state;
end

always @(present_state or X) begin // Present State
    case(present_state)
        S0 : if(X) next_state = S1; else next_state = S0;
        S1 : if(X) next_state = S1; else next_state = S2;
        S2 : if(X) next_state = S3; else next_state = S0;
        S3 : if(X) next_state = S1; else next_state = S2;
    endcase
end


assign Y = present_state == S3; // OUTPUT °è»ê

endmodule
