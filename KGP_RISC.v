`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:10:24 11/03/2022 
// Design Name: 
// Module Name:    KGP_RISC 
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
module KGP_RISC(
	input clk,
	input rst
    );
	 
	 wire [31:0] instruction;
	 wire [15:0] imm;
	 
	 wire [0:0] RegWrite;
	 wire [1:0] RegDst;
	 wire [0:0] MemRead;
	 wire [0:0] MemWrite;
	 wire [1:0] MemToReg;
	 wire [1:0] ALUop;
	 wire [0:0] CondJump;
	 wire [2:0] UncondJump;
	 
	 
	 mux_imm mux_imm1(.mem_type(instruction[15:0]), .I_type(instruction[20:5]), .I27(instruction[27:27]), .imm(imm));
	 
	 mux_MemToReg mux_MemToReg1();
	 
	 mux_ALUsrc mux_ALUsrc1();
	 
	 mux_AddrSel mux_AddrSel1();
	 
	 register_file register_file1 ();
	 
	 prgrmCntr prgrmCntr1 ();
	 
	 ALUcntrlUNIT ALUcntrlUNIT1 ();
	 
	 JumpControl JumpControl1 ();
	 
	 alu alu1 ();
	 
	 branch branch1 ();
	 
	 cntrlUNIT cntrlUNIT1 (.opcode());
	 
	 signExtender signExtender1 ();
	 
endmodule
