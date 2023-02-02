`timescale 1ns / 1ps

module branch(
    input JCout,
    input UncondJump,
    input [31:0] PCin,
    input [31:0] JumpAddr,
    output [31:0] PCin4,
    output [31:0] PCnext
    );

	wire toJump;
	
	assign PCin4 = PCin + 32'd1;
	
	assign toJump = UncondJump | JCout;
	
	assign PCnext = (toJump)? JumpAddr : PCin4 ;

endmodule
