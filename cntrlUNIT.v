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
	output [2:0] CondJump,
	output [0:0] UncondJump
    );
	 
	 begin
		case(opcode)
			6'b000000:									//add,comp,and,xor,shll,shrl,shllv,shrlv,shra,shrav,diff
				begin
					RegWrite <= 1'b1 ;
					RegDst <= 2'b00 ;
					MemRead <= 1'b0 ;
					MemWrite <= 1'b0 ;
					MemToReg <= 2'b00 ;
					ALUop <= 2'b00 ;
					CondJump <= 3'b000 ;
					UncondJump <= 1'b0 ;
				end
			6'b000001:									//addi,compi
				begin
					RegWrite <= 1'b1 ;
					RegDst <= 2'b00 ;
					MemRead <= 1'b0 ;
					MemWrite <= 1'b0 ;
					MemToReg <= 2'b00 ;
					ALUop <= 2'b01 ;
					CondJump <= 3'b000 ;
					UncondJump <= 1'b0 ;
				end
			6'b000010:									//lw
				begin
					RegWrite <= 1'b1 ;
					RegDst <= 2'b01 ;
					MemRead <= 1'b1 ;
					MemWrite <= 1'b0 ;
					MemToReg <= 2'b01 ;
					ALUop <= 2'b10 ;
					CondJump <= 3'b000 ;
					UncondJump <= 1'b0 ;
				end
			6'b000011:									//sw
				begin
					RegWrite <= 1'b0 ;
					RegDst <= 2'b00 ;
					MemRead <= 1'b0 ;
					MemWrite <= 1'b0 ;
					MemToReg <= 2'b00 ;
					ALUop <= 2'b10 ;
					CondJump <= 3'b000 ;
					UncondJump <= 1'b0 ;
				end
			6'b000100:									//br
				begin
					RegWrite <= 1'b1 ;
					RegDst <= 2'b00 ;
					MemRead <= 1'b0 ;
					MemWrite <= 1'b1 ;
					MemToReg <= 2'b01 ;
					ALUop <= 2'b11 ;
					CondJump <= 3'b000 ;
					UncondJump <= 1'b1 ;
				end
			6'b000101:									//bltz
				begin
					RegWrite <= 1'b1 ;
					RegDst <= 2'b00 ;
					MemRead <= 1'b0 ;
					MemWrite <= 1'b0 ;
					MemToReg <= 2'b00 ;
					ALUop <= 2'b11 ;
					CondJump <= 3'b001 ;
					UncondJump <= 1'b0 ;
				end
			6'b000110:									//bz
				begin
					RegWrite <= 1'b1 ;
					RegDst <= 2'b00 ;
					MemRead <= 1'b0 ;
					MemWrite <= 1'b0 ;
					MemToReg <= 2'b00 ;
					ALUop <= 2'b11 ;
					CondJump <= 3'b010 ;
					UncondJump <= 1'b0 ;
				end
			6'b000111:									//bnz
				begin
					RegWrite <= 1'b1 ;
					RegDst <= 2'b00 ;
					MemRead <= 1'b0 ;
					MemWrite <= 1'b0 ;
					MemToReg <= 2'b00 ;
					ALUop <= 2'b11 ;
					CondJump <= 3'b011 ;
					UncondJump <= 1'b0 ;
				end
			6'b001000:									//b
				begin
					RegWrite <= 1'b1 ;
					RegDst <= 2'b00 ;
					MemRead <= 1'b0 ;
					MemWrite <= 1'b0 ;
					MemToReg <= 2'b00 ;
					ALUop <= 2'b11 ;
					CondJump <= 3'b000 ;
					UncondJump <= 1'b1 ;
				end
			6'b001001:									//bl
				begin
					RegWrite <= 1'b1 ;
					RegDst <= 2'b00 ;
					MemRead <= 1'b0 ;
					MemWrite <= 1'b0 ;
					MemToReg <= 2'b00 ;
					ALUop <= 2'b11 ;
					CondJump <= 3'b000 ;
					UncondJump <= 1'b1 ;
				end
			6'b001010:									//bcy
				begin
					RegWrite <= 1'b1 ;
					RegDst <= 2'b00 ;
					MemRead <= 1'b0 ;
					MemWrite <= 1'b0 ;
					MemToReg <= 2'b00 ;
					ALUop <= 2'b11 ;
					CondJump <= 3'b100 ;
					UncondJump <= 1'b0 ;
				end
			6'b001011:									//bncy
				begin
					RegWrite <= 1'b1 ;
					RegDst <= 2'b00 ;
					MemRead <= 1'b0 ;
					MemWrite <= 1'b0 ;
					MemToReg <= 2'b00 ;
					ALUop <= 2'b11 ;
					CondJump <= 3'b101 ;
					UncondJump <= 1'b0 ;
				end
			endcase
		end
		
endmodule
