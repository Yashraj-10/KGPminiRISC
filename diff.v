`timescale 1ns / 1ps

module diff(
	input [31:0] a,
	input [31:0] b,
	output reg [31:0] diffBit
    );

	always@(*)
	begin
		if(a[0]^b[0])
			diffBit = 32'd0 ;
		else if(a[1]^b[1])
			diffBit = 32'd1;
		else if(a[2]^b[2])
			diffBit = 32'd2;
		else if(a[3]^b[3])
			diffBit = 32'd3;
		else if(a[4]^b[4])
			diffBit = 32'd4;
		else if(a[5]^b[5])
			diffBit = 32'd5;
		else if(a[6]^b[6])
			diffBit = 32'd6;
		else if(a[7]^b[7])
			diffBit = 32'd7;
		else if(a[8]^b[8])
			diffBit = 32'd8;
		else if(a[9]^b[9])
			diffBit = 32'd9;
		else if(a[10]^b[10])
			diffBit = 32'd10;
		else if(a[11]^b[11])
			diffBit = 32'd11;
		else if(a[12]^b[12])
			diffBit = 32'd12;
		else if(a[13]^b[13])
			diffBit = 32'd13;
		else if(a[14]^b[14])
			diffBit = 32'd14;
		else if(a[15]^b[15])
			diffBit = 32'd15;
		else if(a[16]^b[16])
			diffBit = 32'd16;
		else if(a[17]^b[17])
			diffBit = 32'd17;
		else if(a[18]^b[18])
			diffBit = 32'd18;
		else if(a[19]^b[19])
			diffBit = 32'd19;
		else if(a[20]^b[20])
			diffBit = 32'd20;
		else if(a[21]^b[21])
			diffBit = 32'd21;
		else if(a[22]^b[22])
			diffBit = 32'd22;
		else if(a[23]^b[23])
			diffBit = 32'd23;
		else if(a[24]^b[24])
			diffBit = 32'd24;
		else if(a[25]^b[25])
			diffBit = 32'd25;
		else if(a[26]^b[26])
			diffBit = 32'd26;
		else if(a[27]^b[27])
			diffBit = 32'd27;
		else if(a[28]^b[28])
			diffBit = 32'd28;
		else if(a[29]^b[29])
			diffBit = 32'd29;
		else if(a[30]^b[30])
			diffBit = 32'd30;
		else if(a[31]^b[31])
			diffBit = 32'd31;
		else
			diffBit = 32'd32;
	end

endmodule
