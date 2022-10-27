`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:14:05 10/21/2022 
// Design Name: 
// Module Name:    signExtender 
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
module signExtender(
	input [15:0] extend,
	output [31:0] extended
    );
	
	reg [31:0] extended;
	
	always @ (extend)
		begin
			extended[31:0] <= { {16{extend[15]}}, extend[15:0] };
		end

endmodule
