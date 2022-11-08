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
	 wire [15:0] imm16;
	 wire [31:0] imm32;
	 
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

	 wire [3:0] ALUcntrl;
	 wire [2:0] flag;

	 wire [0:0] JCout;

	 wire [31:0] JumpAddr;

	 wire [31:0] readData1;
	 wire [31:0] readData2;
	 wire [31:0] data2;
	 
	 wire [31:0] PC1;
	 wire [31:0] PC2;
	 wire [31:0] PCin4;

	 wire [31:0] result;

	 wire [31:0] WriteData;
	 
	 mux_imm mux_imm1(.mem_type(instruction[15:0]), .I_type(instruction[20:5]), .I27(instruction[27:27]), .imm(imm16));
	 
	 mux_MemToReg mux_MemToReg1(.a(result), .b(), .c(PCin4), .sel(MemToReg), .out(WriteData));
	 
	 mux_ALUsrc mux_ALUsrc1(.readData2(readData2), .imm(imm32), .ALUsrc(ALUsrc), .b(data2));
	 
	 mux_AddrSel mux_AddrSel1(.a(instruction[25:0]), .b(result), .c(imm16), .sel(AddrSel), .out(JumpAddr));
	 
	 register_file register_file1 (.rs(instruction[25:21]), .rt(instruction[20:16]), .RegDst(RegDst), .WriteData(WriteData), .RegWrite(RegWrite), .clk(clk), .rst(rst), .readData1(readData1), .readData2(readData2));
	 
	 prgrmCntr prgrmCntr1 (.clk(clk), .rst(rst), .PCin(PC1), .PCout(PC2));
	 
	 ALUcntrlUNIT ALUcntrlUNIT1 (.ALUop(ALUop), .func(instruction[4:0]), .ALUcntrl(ALUcntrl));
	 
	 JumpControl JumpControl1 (.flag(flag), .CondJump(CondJump), .JCout(JCout));
	 
	 alu alu1 (.a(readData1), .b(data2), .ALUcntrl(ALUcntrl), .flag(flag), .result(result));
	 
	 branch branch1 (.JCout(JCout), .UncondJump(UncondJump), .PCin(PC2), .JumpAddr(JumpAddr), .PCin4(PCin4),.PCnext(PC1));
	 
	 cntrlUNIT cntrlUNIT1 (.opcode(instruction[31:26]), .RegWrite(RegWrite), .RegDst(RegDst), .MemRead(MemRead), .MemWrite(MemWrite), .MemToReg(MemToReg), .ALUop(ALUop), .CondJump(CondJump), .UncondJump(UncondJump), .AddrSel(AddrSel), .ALUsrc(ALUsrc));
	 
	 signExtender signExtender1 (.extend(imm16), .extended(imm32));
	 
endmodule
