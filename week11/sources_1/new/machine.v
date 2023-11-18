`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/16 21:31:29
// Design Name: 
// Module Name: machine
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


module machine(clk, rst_n, coin, buy, coffee, return);

input clk, rst_n, coin, buy;
output coffee, return;

localparam ZERO    = 3'b000, // 돈 넣기 전
           ONE     = 3'b001, // 100원
           TWO     = 3'b010, // 200원
           THREE   = 3'b011, // 300원
           COFFEE  = 3'b100, // coffe 나옴
           RETURN  = 3'b101; // 동전 반환
           
reg[2:0] present_state, next_state;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) present_state <= ZERO;
    else       present_state <= next_state;
end

always @(*) begin
    case(present_state)
        ZERO:
            if(coin) begin
                if(buy) next_state <= RETURN;
                else next_state <= ONE;
            end
            else begin
                if(buy) next_state <= RETURN;
                else next_state <= ZERO;
            end
        ONE:
            if(coin) begin
                if(buy) next_state <= RETURN;
                else next_state <= TWO;
            end
            else begin
                if(buy) next_state <= RETURN;
                else next_state <= ONE;
            end
        TWO:
            if(coin) begin
                if(buy) next_state <= COFFEE;
                else next_state <= THREE;
            end
            else begin
                if(buy) next_state <= RETURN;
                else next_state <= TWO;
            end
        THREE:
            if(coin) next_state <= RETURN;
            else begin
                if(buy) next_state <= COFFEE;
                else next_state <= THREE;
            end
        COFFEE:
            if(coin) begin
                if(buy) next_state <= RETURN;
                else next_state <= ONE;
            end
            else begin
                if(buy) next_state <= RETURN;
                else next_state <= ZERO;
            end
        RETURN:
            if(coin) begin
                if(buy) next_state <= RETURN;
                else next_state <= ONE;
            end
            else begin
                if(buy) next_state <= RETURN;
                else next_state <= ZERO;
            end
      endcase
end


assign coffee = (present_state == COFFEE);
assign return = (present_state == RETURN);

endmodule
