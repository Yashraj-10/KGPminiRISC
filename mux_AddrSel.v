`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:24:43 11/01/2022 
// Design Name: 
// Module Name:    mux_AddrSel 
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
module mux_AddrSel(
	input [25:0] a,
	input [31:0] b,
	input [15:0] c,
	input [1:0] sel,
	output [31:0] out
    );
		
	wire [31:0] a1;
	assign a1[31:0] = { {6{0}}, a[25:0] };

	wire [31:0] c1;
	assign c1[31:0] = { {16{0}}, c[15:0] };

	assign out = (sel[0]) ? (sel[1] ? 32'b0 : b) : (sel[1] ? c1 : a1);

endmodule
