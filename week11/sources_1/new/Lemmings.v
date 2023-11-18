`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/15 21:06:27
// Design Name: 
// Module Name: Lemmings
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


module Lemmings(clk, areset, bump_left, bump_right, ground, dig,
                walk_left, walk_right, aaah, digging);
                
input clk, areset, bump_left, bump_right, ground, dig;
output walk_left, walk_right, aaah, digging;

localparam WALK_LEFT  = 3'b000,
           WALK_RIGHT = 3'b001,
           DIG_LEFT   = 3'b010,
           DIG_RIGHT  = 3'b011,
           FALL_LEFT  = 3'b100,
           FALL_RIGHT = 3'b101;

reg[2:0] present_state, next_state;

always @(posedge clk or negedge areset) begin
    if(!areset) present_state <= WALK_LEFT;
    else       present_state <= next_state;
end

always @(*) begin
    case(present_state)
        WALK_LEFT:
            if(!ground) next_state = FALL_LEFT;
            else begin
                if(!dig) next_state = (bump_left) ? WALK_RIGHT : WALK_LEFT;
                else next_state = DIG_LEFT;
            end
        WALK_RIGHT:
            if(!ground) next_state = FALL_RIGHT;
            else begin
                if(!dig) next_state = (bump_right) ? WALK_LEFT : WALK_RIGHT;
                else next_state = DIG_RIGHT;
            end
        DIG_LEFT:
            if(!ground) next_state = FALL_LEFT;
            else next_state = DIG_LEFT;
        DIG_RIGHT:
            if(!ground) next_state = FALL_RIGHT;
            else next_state = DIG_RIGHT;
        FALL_LEFT:
            if(ground) next_state = WALK_LEFT;
            else            next_state = FALL_LEFT;
        FALL_RIGHT:
            if(ground) next_state = WALK_RIGHT;
            else            next_state = FALL_RIGHT;
        default:
            next_state = WALK_LEFT;
        endcase
end

assign walk_left = (present_state == WALK_LEFT);
assign walk_right = (present_state == WALK_RIGHT);
assign aaah = (present_state == FALL_LEFT) || (present_state == FALL_RIGHT);
assign digging = (present_state == DIG_LEFT) || (present_state == DIG_RIGHT);

endmodule
