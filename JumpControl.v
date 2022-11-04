`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:26:40 11/04/2022 
// Design Name: 
// Module Name:    JumpControl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module JumpControl(
	input [2:0] flag,					// flag = [0-carry,1-zero,2-sign]
	input [2:0] CondJump,
	output [0:0] out
    );

	always@(*)
		begin
			case(CondJump)
				3'b000:							// not a branch on flag statement
					begin
						out <= 1'b0;
					end
				3'b001:							// bltz
					begin
						if(flag[2])
							out <= 1'b1;
						else
							out <= 1'b0;
					end
				3'b010:							// bz
					begin
						if(flag[1])
							out <= 1'b1;
						else
							out <= 1'b0;
					end
				3'b011:							// bnz
					begin
						if(flag[1])
							out <= 1'b0;
						else
							out <= 1'b1;
					end
				3'b100:							// bcy
					begin
						if(flag[0])
							out <= 1'b1;
						else
							out <= 1'b0;
					end
				3'b101:							// bncy
					begin
						if(flag[0])
							out <= 1'b0;
						else
							out <= 1'b1;
					end
				default:							// default ---> UncondJump shouldn't happen
					begin
						out <= 1'b0;
					end
			endcase
		end
					
endmodule
