module signExtender(
	input clk,
	input rst,
	input [31:0] PCin,
	output [31:0] PCout
    );
	
	always @ (posedge clk)
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