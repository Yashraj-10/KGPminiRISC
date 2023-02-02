`timescale 1ns / 1ps

module signExtender(
	input [15:0] extend,
	output reg [31:0] extended
    );
	
	//reg [31:0] extended;
	
	always @ (extend)
		begin
			extended[31:0] <= { {16{extend[15]}}, extend[15:0] };
		end

endmodule
