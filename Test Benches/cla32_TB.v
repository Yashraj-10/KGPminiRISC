`timescale 1ns / 1ps

//--------------------------------------------------------------------------------
// Assignment - 3
// Computer Oraganisation and Architecture Lab
// Semester - Autumn 2022-23
// Group No 24
// Yashraj Singh - 20CS10079
// Vikas Vijaykumar Bastewad - 20CS10073
//--------------------------------------------------------------------------------

module cla32TB(
    );

	reg [31:0] a = 32'd0;
	reg [31:0] b = 32'd0;
    reg carryInput = 1'b0;

    wire [31:0] sum;
    wire [0:0] carryOutput;

    cla32 cla1(.a(a), .b(b), .carryInput(carryInput), .sum(sum), .carryOutput(carryOutput));

    initial begin
	 
        $monitor("a = %d, b = %d, carry-input = %d, sum = %d, carry-output = %d", a, b, carryInput, sum, carryOutput,);
        
        #5 a = 32'd414; b = 32'd1036;
        #5 a = 32'd5045; b = 32'd45042;
        #5 a = 32'd32768; b = 32'd32768;
        #5 a = 32'd65535; b = 32'd65535;
        #5 a = 32'd1234567; b= 32'd3456789;
        #5 $finish;
    end

endmodule