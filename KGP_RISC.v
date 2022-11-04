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
	 
	 mux_imm mux_imm1();
	 
	 mux_MemToReg mux_MemToReg1();
	 
	 mux_ALUsrc mux_ALUsrc1();
	 
	 mux_AddrSel mux_AddrSel1();
	 
	 register_file register_file1 ();
	 
	 prgrmCntr prgrmCntr1 ();
	 
	 ALUcntrlUNIT ALUcntrlUNIT1 ();
	 
	 JumpControl JumpControl1 ();
	 
	 alu alu1 ();
	 
	 branch branch1 ();
	 
	 cntrlUNIT cntrlUNIT1 ();
	 
	 signExtender signExtender1 ();
	 
endmodule
