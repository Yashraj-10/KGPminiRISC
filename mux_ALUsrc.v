`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:18 10/26/2022 
// Design Name: 
// Module Name:    mux_ALUsrc 
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
module mux_ALUsrc(
	input [31:0] readData2,
	input [31:0] imm,
	input [0:0] ALUsrc,
	output [31:0] b
    );
	 
	assign b = ALUsrc ? imm : readData2 ;

endmodule
