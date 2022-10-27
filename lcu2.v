`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:56 10/21/2022 
// Design Name: 
// Module Name:    lcu2 
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
module lcu2(
    input [1:0] p,
    input [1:0] g,
    input [0:0] carryInput,
    output [0:0] carryOutput,
    output [0:0] prop,
    output [0:0] gene,
    output [1:0] c
    );
	
	// calculating the look-ahead carries using generate block and propogate block from the precceding level
	assign c[0] = carryInput;

	assign carryOutput = g[1] | (p[1] & g[0]) | (p[1] & p[0] & carryInput);
	
	// calculating propogate block and generate block for the succeeding level
	assign prop = p[1] & p[0];
   assign gene = g[1] | (p[1] & g[0]);

endmodule
