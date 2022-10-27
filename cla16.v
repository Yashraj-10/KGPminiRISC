`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:33:38 10/21/2022 
// Design Name: 
// Module Name:    cla16 
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
module cla16(
    input [15:0] a,
    input [15:0] b,
    input [0:0] carryInput,
    output [15:0] sum,
    output [0:0] carryOutput,
    output [0:0] prop,
    output [0:0] gene
    );
	
	// wires for stoting intermediate values of propogates, generates and carries
	wire [3:0] p;
	wire [3:0] g;
	wire [3:0] c;
	
	// using four cascaded 4-bit augmented carry look-ahead adder and a look-ahead carry unit to calculate sum of two 16-bit numbers
	cla4aug cla1(.a(a[3:0]), .b(b[3:0]), .carryInput(carryInput), .sum(sum[3:0]), .carryOutput(), .prop(p[0]), .gene(g[0]));
   cla4aug cla2(.a(a[7:4]), .b(b[7:4]), .carryInput(c[1]), .sum(sum[7:4]), .carryOutput(), .prop(p[1]), .gene(g[1]));
   cla4aug cla3(.a(a[11:8]), .b(b[11:8]), .carryInput(c[2]), .sum(sum[11:8]), .carryOutput(), .prop(p[2]), .gene(g[2]));
   cla4aug cla4(.a(a[15:12]), .b(b[15:12]), .carryInput(c[3]), .sum(sum[15:12]), .carryOutput(), .prop(p[3]), .gene(g[3]));
	
	lcu4 l(.p(p), .g(g), .carryInput(carryInput), .carryOutput(carryOutput), .prop(prop), .gene(gene), .c(c));

endmodule
