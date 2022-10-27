`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:56 10/21/2022 
// Design Name: 
// Module Name:    cla32 
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
module cla32(
	input [31:0] a,
   input [31:0] b,
   input [0:0] carryInput,
   output [31:0] sum,
   output [0:0] carryOutput,
   output [0:0] prop,
   output [0:0] gene
    );
	 
	 wire [1:0] p;
	 wire [1:0] g;
	 wire [1:0] c;
	 
	 cla16 inst1(.a(a), .b(b), .carryInput(carryInput), .sum(sum[15:0]), .carryOutput(), .prop(p[0]), .gene(g[0]));
	 cla16 inst2(.a(a), .b(b), .carryInput(c[1]), .sum(sum[31:16]), .carryOutput(), .prop(p[1]), .gene(g[1]));
	 
	lcu2 l(.p(p), .g(g), .carryInput(carryInput), .carryOutput(carryOutput), .prop(prop), .gene(gene), .c(c));

endmodule
