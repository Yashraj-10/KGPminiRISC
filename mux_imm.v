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
	input [15:0] mem_type,
	input [15:0] I_type,
	input [0:0] I27,
	output [15:0] imm
    );

	assign imm = I27 ? mem_type : I_type;

endmodule
