`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:29:48 10/21/2022 
// Design Name: 
// Module Name:    alu 
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
//		Operation						|	ALU Control Required
//--------------------------------------------------------------------------------
//		Sum								|	0000 -- 0
//		Compliment						|	0001 -- 1
//		AND								|	0010 -- 2
//		XOR								|	0011 -- 3
//		diff								|	0100 -- 4
//		Right Shift						|	0101 -- 5
//		Left Shift						|	0110 -- 6
//		Arithematic Right Shift		|	0111 -- 7
//		Only Flags						|	any --- 8+
//////////////////////////////////////////////////////////////////////////////////

module alu(
	input [31:0] a,
	input [31:0] b,
	input [4:0] shift,
	input [3:0] ALUcntrl,
	output [2:0] flag,			//flag ==> [sign,zero,carry]
	output [31:0] result
    );
	 
	wire [31:0] sum, comp, XOR, AND, diffBit, shiftR, shiftL, shiftRa;
	wire carry_out;
	
	cla32 adder(.a(a), .b(b), .carryInput(), .sum(sum), .carryOutput(carry_out));
	 
	assign comp = ~a + 1'b1;
	assign XOR = a^b;
	assign AND = a&b;
	
	assign shiftL = a<<shift;
	assign shiftR = a>>shift;
	assign shiftRa = a>>>shift;
	
	diff inst1(.a(a), .b(b), .diff(diffBit));
	
	always @(*)
		begin
			flag[2] = a[31] ? 1'b1 : 1'b0;
			flag[1] = a==32'd0 ? 1'b1 : 1'b0;
			
			case(ALUcntrl)
				4'b0000:
					begin
						result = sum;
						flag[0] = carry_out;
					end
				4'b0001:
					begin
						result = comp;
						flag[0] = 1'b0;
					end
				4'b0010:
					begin
						result = AND;
						flag[0] = 1'b0;
					end
				4'b0011:
					begin
						result = XOR;
						flag[0] = 1'b0;
					end
				4'b0100:
					begin
						result = diffBit;
						flag[0] = 1'b0;
					end
				4'b0101:
					begin
						result = shiftR;
						flag[0] = 1'b0;
					end
				4'b0110:
					begin
						result = shiftL;
						flag[0] = 1'b0;
					end
				4'b0111:
					begin
						result = shiftRa;
						flag[0] = 1'b0;
					end
				default:
					begin
						result = 32'd0;
						flag[0] = 1'b0;
					end
			endcase
		end
endmodule
