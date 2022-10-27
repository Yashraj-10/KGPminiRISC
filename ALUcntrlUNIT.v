`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:20 10/21/2022 
// Design Name: 
// Module Name:    ALUcntrlUNIT 
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

//////////////////////////////////////////////////////////////////////////////////
//	instr	|	opcode	|	func	|	ALUop	|	ALUcntrl
//-------|-----------+--------+--------+-----------
//	add	| 000000		| 00000	|	0		|	0000
//	comp	| 000000		| 00001	|	0		|	0001
//	and	| 000000		| 00010	|	0		|	0010
//	xor	| 000000		| 00011	|	0		|	0011
//	shll	| 000000		| 00100	|	0		|	0110
//	shrl	| 000000		| 00101	|	0		|	0101
//	shllv	| 000000		| 00110	|	0		|	0110
//	shrlv	| 000000		| 00111	|	0		|	0101
//	shra	| 000000		| 01000	|	0		|	0101
//	shrav	| 000000		| 01001	|	0		|	0101
// diff	| 000000		| 01010	|	0		|	0100
//	addi	| 000001		| 00000	|	1		|	0000
// compi	| 000001		| 00001	|	1		|	0001
//	lw		| 000010		| 	--		|	2		|	0000
// sw		| 000011		| 	--		|	2		|	0000
//	br		| 000100		| 	--		|	3		|	1000
//	bltz	| 000101		| 	--		|	3		|	1000
// bz		| 000110		| 	--		|	3		|	1000
// bnz	| 000111		| 	--		|	3		|	1000
// b		| 001000		| 	--		|	3		|	1000
// bl		| 001001		| 	--		|	3		|	1000
// bcy	| 001010		| 	--		|	3		|	1000
// bncy	| 001011		| 	--		|	3		|	1000
//////////////////////////////////////////////////////////////////////////////////

module ALUcntrlUNIT(
	input [1:0] ALUop,
	input [4:0] func,
	output [3:0] ALUcntrl
    );

	always @ (*)
	 begin
		case(ALUop)
			2'b00:
				begin
					case(func)
						5'b00000:
							begin
								ALUcntrl <= 4'b0000;
							end
						5'b00001:
							begin
								ALUcntrl <= 4'b0001;
							end
						5'b00010:
							begin
								ALUcntrl <= 4'b0010;
							end
						5'b00011:
							begin
								ALUcntrl <= 4'b0011;
							end
						5'b00100:
							begin
								ALUcntrl <= 4'b0110;
							end
						5'b00101:
							begin
								ALUcntrl <= 4'b0101;
							end
						5'b00110:
							begin
								ALUcntrl <= 4'b0110;
							end
						5'b00111:
							begin
								ALUcntrl <= 4'b0101;
							end
						5'b01000:
							begin
								ALUcntrl <= 4'b0111;
							end
						5'b01001:
							begin
								ALUcntrl <= 4'b0111;
							end
						5'b01010:
							begin
								ALUcntrl <= 4'b00100;
							end
						default:
							begin
								ALUcntrl <= 4'b1000;
							end
					endcase
				end
			2'b01:
				begin
					case(func)
						5'b00000:
							begin
								ALUcntrl <= 4'b0000;
							end
						5'b00001:
							begin
								ALUcntrl <= 4'b0001;
							end
						default:
							begin
								ALUcntrl <= 4'b1000;
							end
					endcase
				end
			2'b10:
				begin
					ALUcntrl <= 4'b0000;
				end
			2'b11:
				begin
					ALUcntrl <= 4'b1000;
				end
			deafult:
				
	
endmodule
