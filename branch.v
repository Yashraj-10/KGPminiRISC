`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:16:14 11/04/2022 
// Design Name: 
// Module Name:    branch 
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
module branch(
    input JCout,
    input UncondJump,
    input [31:0] PCin,
    input [31:0] JumpAddr,
    output [31:0] PCnext
    );

	wire toJump;
	wire PCin4;
	
	assign PCin4 = PCin + 32'd4;
	
	assign toJump = UncondJump | JCout;
	
	assign PCnext = (toJump)? JumpAddr : PCin4 ;

endmodule
