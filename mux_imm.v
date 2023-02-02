`timescale 1ns / 1ps

module mux_imm(
	input [15:0] mem_type,
	input [15:0] I_type,
	input [0:0] I27,
	output [15:0] imm
    );

	assign imm = I27 ? mem_type : I_type;

endmodule
