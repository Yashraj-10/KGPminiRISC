`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:31:29 11/08/2022
// Design Name:   KGP_RISC
// Module Name:   /home/yashraj/COA/KGPminiRISC/KGP_RISK_TB.v
// Project Name:  KGPminiRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: KGP_RISC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module KGP_RISK_TB;

	// Inputs
	reg clk = 1'b0;
	reg rst = 1'b0;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	KGP_RISC uut (
		.clk(clk), 
		.rst(rst), 
		.out(out)
	);

	initial begin
        // reset = 0;#100;
        #100;
        rst = 1;#1;
        rst = 0;

        #500;
        $finish;  
    end

    always@(posedge clk)
    begin
        $display("out = %d", out);
    end

    always begin
        #1;
        clk = ~clk;
    end
      
endmodule

