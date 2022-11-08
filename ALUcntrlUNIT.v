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
//	shll	| 000001		| 00010	|	0		|	0110
//	shrl	| 000001		| 00011	|	0		|	0101
//	shllv	| 000000		| 00110	|	0		|	0110
//	shrlv	| 000000		| 00111	|	0		|	0101
//	shra	| 000001		| 00100	|	0		|	0111
//	shrav	| 000000		| 01001	|	0		|	0111
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

//////////////////////////////////////////////////////////////////////////////////
//        Operation                        |    ALU Control Required
//--------------------------------------------------------------------------------
//        Sum                              |    0000 -- 0
//        Compliment                       |    0001 -- 1
//        AND                              |    0010 -- 2
//        XOR                              |    0011 -- 3
//        diff                             |    0100 -- 4
//        Right Shift                      |    0101 -- 5
//        Left Shift                       |    0110 -- 6
//        Arithematic Right Shift          |    0111 -- 7
//        Only Flags                       |    any --- 8+
//////////////////////////////////////////////////////////////////////////////////

module ALUcntrlUNIT(
	input [1:0] ALUop,
	input [4:0] func,
	output reg [3:0] ALUcntrl
    );

	always @ (*)
	 begin
		case(ALUop)
			2'b00:
				begin
					case(func)
						5'b00000:								// add
							begin
								ALUcntrl <= 4'b0000;
							end
						5'b00001:								// comp
							begin
								ALUcntrl <= 4'b0001;
							end
						5'b00010:								// and
							begin
								ALUcntrl <= 4'b0010;
							end
						5'b00011:								// xor
							begin
								ALUcntrl <= 4'b0011;
							end
						// 5'b00100:								// shll
						// 	begin
						// 		ALUcntrl <= 4'b0110;
						// 	end
						// 5'b00101:								// shrl
						// 	begin
						// 		ALUcntrl <= 4'b0101;
						// 	end
						5'b00110:								// shllv
							begin
								ALUcntrl <= 4'b0110;
							end
						5'b00111:								// shrlv
							begin
								ALUcntrl <= 4'b0101;
							end
						// 5'b01000:								// shra
						// 	begin
						// 		ALUcntrl <= 4'b0111;
						// 	end
						5'b01001:								// shrav
							begin
								ALUcntrl <= 4'b0111;
							end
						5'b01010:								// diff
							begin
								ALUcntrl <= 4'b0100;
							end
						default:									// only flags
							begin
								ALUcntrl <= 4'b1000;
							end
					endcase
				end
			2'b01:
				begin
					case(func)
						5'b00000:								// addi
							begin
								ALUcntrl <= 4'b0000;
							end
						5'b00001:								// compi
							begin
								ALUcntrl <= 4'b0001;
							end
						5'b00010:								// shll
							begin
								ALUcntrl <= 4'b0110;
							end
						5'b00011:								// shrl
							begin
								ALUcntrl <= 4'b0101;
							end
						5'b00100:								// shra
							begin
								ALUcntrl <= 4'b0111;
							end
						default:								// only flags
							begin
								ALUcntrl <= 4'b1000;
							end
					endcase
				end
			2'b10:												// lw & sw ---> sum
				begin
					ALUcntrl <= 4'b0000;
				end
			2'b11:												// branch statements ---> only flags
				begin
					ALUcntrl <= 4'b1000;
				end
			default:
				begin
					ALUcntrl <= 4'b1000;						// only flags
				end
		endcase
	end
	
endmodule
