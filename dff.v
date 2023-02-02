`timescale 1ns / 1ps

module dff(
	input [31:0] in,
	output[31:0] out,
	input clk
    );
	 
	reg[31:0] buffer = 32'b0;
	
	always@(posedge clk)
	begin
		buffer = in;
	end
	 
	assign out = buffer;

endmodule
