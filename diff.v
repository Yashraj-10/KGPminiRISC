`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:28 10/21/2022 
// Design Name: 
// Module Name:    diff 
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
module diff(
	input [31:0] a,
	input [31:0] b,
	output [31:0] diff
    );

	integer i;
	begin
		for(i=0;i<32;i=i+1)
			begin
				if(XOR[i])
					begin
						diff = i; 
						break;
					end
			end
	end

endmodule
