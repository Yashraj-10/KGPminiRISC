`timescale 1ns / 1ps

module mux_MemToReg(
	input [31:0] a,
	input [31:0] b,
	input [31:0] c,
	input [1:0] sel,
	output [31:0] out
    );
		
	assign out = (sel[0]) ? (sel[1] ? 32'b0 : b) : (sel[1] ? c : a);

endmodule
