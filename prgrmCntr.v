`timescale 1ns / 1ps

module MUX_2X1_1bit(A,B,out,sel);
    input wire A,B,sel;
    output wire out;

    assign out = sel ? B : A;
endmodule

// Not complete, need external and internal halt signal and clock wrapper
module wrapper(clkext, clk, halt, cont);
    input wire clkext, halt, cont;
    output wire clk;
    MUX_2X1_1bit mx1(clkext,cont,clk,halt);
endmodule


module prgrmCntr(
	input clkext,
	input rst,
	input [31:0] PCin,
	output reg [31:0] PCout,
	input halt,
	output [0:0] clkout,
	input cont
    );
	 wire clk;
	 wrapper wc(clkext, clk, halt, cont);
	
	assign clkout = clk;
	
	always @ (posedge clk or posedge rst)
		begin
			if(rst)
				begin
					PCout <= 32'd0;
				end
			else
				begin
					PCout <= PCin;
				end
		end

endmodule
