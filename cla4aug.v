`timescale 1ns / 1ps

module cla4aug(
    input [3:0] a,
    input [3:0] b,
    input [0:0] carryInput,
    output [3:0] sum,
    output [0:0] carryOutput,
    output [0:0] prop,
    output [0:0] gene
    );
	 
	// wires for storing intermediate values of carry, propagate and generate
	wire [3:0] p;
	wire [3:0] g;
	wire [3:0] c;
	
	assign p = a ^ b;				// calculating the propagate
	assign g = a & b;				// calculating the generate
	
	assign c[0] = carryInput;
	assign c[1] = g[0] | (p[0] & carryInput);
	assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & carryInput);
	assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & carryInput);

	assign sum = p ^ c;					// calculating final sum
	
	// calculating generate block and propagate block for the succeeding level
	assign prop = p[3] & p[2] & p[1] & p[0];
	assign gene = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
	
	assign carryOutput = gene + (prop & carryInput);			// calculating final carry-output
	
endmodule
