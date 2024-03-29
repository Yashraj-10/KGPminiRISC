`timescale 1ns / 1ps

module JumpControl(
	input [2:0] flag,					// flag = [2-sign,1-zero,0-carry]
	input [2:0] CondJump,
	output reg [0:0] JCout
    );

	always@(*)
		begin
			case(CondJump)
				3'b000:							// not a branch on flag statement
					begin
						JCout <= 1'b0;
					end
				3'b001:							// bltz
					begin
						if(flag[2])
							JCout <= 1'b1;
						else
							JCout <= 1'b0;
					end
				3'b010:							// bz
					begin
						if(flag[1])
							JCout <= 1'b1;
						else
							JCout <= 1'b0;
					end
				3'b011:							// bnz
					begin
						if(flag[1])
							JCout <= 1'b0;
						else
							JCout <= 1'b1;
					end
				3'b100:							// bcy
					begin
						if(flag[0])
							JCout <= 1'b1;
						else
							JCout <= 1'b0;
					end
				3'b101:							// bncy
					begin
						if(flag[0])
							JCout <= 1'b0;
						else
							JCout <= 1'b1;
					end
				default:							// default ---> UncondJump shouldn't happen
					begin
						JCout <= 1'b0;
					end
			endcase
		end
					
endmodule
