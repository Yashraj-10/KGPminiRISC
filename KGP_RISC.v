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
	 wire [0:0] ALUsrc;
	 wire [1:0] AddrSel;
	 
	 
	 mux_imm mux_imm1(.mem_type(instruction[15:0]), .I_type(instruction[20:5]), .I27(instruction[27:27]), .imm(imm));
	 
	 mux_MemToReg mux_MemToReg1(.a(), .b(), .c(), .sel(), .out());
	 
	 mux_ALUsrc mux_ALUsrc1(.readData2(), .imm(), .ALUsrc(), .b());
	 
	 mux_AddrSel mux_AddrSel1(.a(), .b(), .c(), .sel(), .out());
	 
	 register_file register_file1 (.rs(), .rt(), .RegDst(), .WriteData(), .RegWrite(), .clk(), .rst(), .readData1(), .readData2());
	 
	 prgrmCntr prgrmCntr1 (.clk(), .rst(), .PCin(), .PCout());
	 
	 ALUcntrlUNIT ALUcntrlUNIT1 (.ALUop(), .func(), .ALUcntrl());
	 
	 JumpControl JumpControl1 (.flag(), .CondJump(), .JCout());
	 
	 alu alu1 (.a(), .b(), .shift(), .ALUcntrl(), .flag(), .result());
	 
	 branch branch1 (.JCout(), .UncondJump(), .PCin(), .JumpAddr(), .PCnext());
	 
	 cntrlUNIT cntrlUNIT1 (.opcode(), .RegWrite(), .RegDst(), .MemRead(), .MemWrite(), .MemToReg(), .ALUop(), .CondJump(), .UncondJump(), .AddrSel());
	 
	 signExtender signExtender1 (.extend(), .extended());
	 
endmodule
