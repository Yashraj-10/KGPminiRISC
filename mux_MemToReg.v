`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:25:35 10/26/2022 
// Design Name: 
// Module Name:    mux_MemToReg 
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
module mux_MemToReg(
	input [31:0] a,
	input [31:0] b,
	input [31:0] c,
	input [1:0] sel,
	output [31:0] out
    );
		
	assign out = (sel[0]) ? (sel[1] ? 32'b0 : c) : (sel[1] ? b : a);

endmodule
