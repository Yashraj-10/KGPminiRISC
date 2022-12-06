`timescale 1ns/1ps

module cntrlUNIT_TB();
    // Inputs
    reg [5:0] opcode;
	wire [0:0] RegWrite;
	wire [1:0] RegDst;
	wire [0:0] MemRead;
	wire [0:0] MemWrite;
	wire [1:0] MemToReg;
	wire [3:0] ALUop;
	wire [2:0] CondJump;
	wire [0:0] UncondJump;
    wire [1:0] AddrSel;
    // Outputs
    cntrlUNIT uut(
        .opcode(opcode), 
        .RegWrite(RegWrite),
        .RegDst(RegDst),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemToReg(MemToReg),
        .ALUop(ALUop),
        .CondJump(CondJump),
        .UncondJump(UncondJump),
        .AddrSel(AddrSel)
        );
    
    initial begin
        $monitor("time=%0d, opcode=%d, RegWrite=%d, RegDst=%b, MemRead=%d, MemWrite=%d, MemToReg=%d, ALUop=%d, CondJump=%d, UncondJump=%d, AddrSel=%d",$time,opcode,RegWrite,RegDst,MemRead,MemWrite,MemToReg,ALUop,CondJump,UncondJump,AddrSel);
        #10 opcode= 5'b00000;
        #10 opcode= 5'b00001;
        #10 opcode= 5'b00010;
        #10 opcode= 5'b00011;
        #10 opcode= 5'b00100;
        #10 opcode= 5'b00101;
        #10 opcode= 5'b00110;
        #10 opcode= 5'b00111;
        #10 opcode= 5'b01000;
        #10 opcode= 5'b01001;
        #10 opcode= 5'b01010;
        #10 opcode= 5'b01011;
        #10 $finish;
    end
endmodule