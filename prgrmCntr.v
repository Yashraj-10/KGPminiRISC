`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:38 11/01/2022 
// Design Name: 
// Module Name:    prgrmCntr 
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
module prgrmCntr(
	input clk,
	input rst,
	input [31:0] PCin,
	output reg [31:0] PCout
    );
	
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
		end

endmodule
