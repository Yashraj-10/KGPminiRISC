`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:41:52 10/21/2022 
// Design Name: 
// Module Name:    cntrlUNIT 
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
module cntrlUNIT(
	input [5:0] opcode,
	output [0:0] RegWrite,
	output [1:0] RegDst,
	output [0:0] MemRead,
	output [0:0] MemWrite,
	output [1:0] MemToReg,
	output [3:0] ALUop,
	output [0:0] CondJump,
	output [0:0] UncondJump
    );
	 
	 begin
		case(opcode)
			6'b000000:
				begin
				
				end
			6'b000001:
				begin
				
				end
			6'b000010:
				begin
				
				end
			6'b000011:
				begin
				
				end
			6'b000100:
				begin
				
				end
			6'b000101:
				begin
				
				end
			6'b000110:
				begin
				
				end
			6'b000111:
				begin
				
				end
			6'b001000:
				begin
				
				end
			6'b001001:
				begin
				
				end
			6'b001010:
				begin
				
				end
			6'b001011:
				begin
				
				end

endmodule
