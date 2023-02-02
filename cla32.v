`timescale 1ns / 1ps

module cla32(
	input [31:0] a,
   input [31:0] b,
   input [0:0] carryInput,
   output [31:0] sum,
   output [0:0] carryOutput
    );
	 
	 wire [1:0] p;
	 wire [1:0] g;
	 wire [1:0] c;
	 
	 cla16 inst1(.a(a[15:0]), .b(b[15:0]), .carryInput(carryInput), .sum(sum[15:0]), .carryOutput(), .prop(p[0]), .gene(g[0]));
	 cla16 inst2(.a(a[31:16]), .b(b[31:16]), .carryInput(c[1]), .sum(sum[31:16]), .carryOutput(), .prop(p[1]), .gene(g[1]));
	 
	lcu2 l(.p(p), .g(g), .carryInput(carryInput), .carryOutput(carryOutput), .c(c));

endmodule

