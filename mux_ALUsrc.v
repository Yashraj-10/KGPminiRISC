`timescale 1ns / 1ps

module mux_ALUsrc(
	input [31:0] readData2,
	input [31:0] imm,
	input [0:0] ALUsrc,
	output [31:0] b
    );
	 
	assign b = ALUsrc ? imm : readData2 ;

endmodule
