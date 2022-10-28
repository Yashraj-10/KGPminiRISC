`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:23 10/21/2022 
// Design Name: 
// Module Name:    mux_imm 
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
module mux_imm(
	input [16:0] mem_type,
	input [16:0] I_type,
	input [0:0] I27,
	output [16:0] imm
    );

	assign imm = I27 ? mem_type : I-type;

endmodule
