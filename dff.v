`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:41:22 11/08/2022 
// Design Name: 
// Module Name:    dff 
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
