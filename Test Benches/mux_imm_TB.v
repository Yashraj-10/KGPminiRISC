`timescale 1ns/1ps

module mux_imm_TB();
    //Inputs
    reg [16:0] mem_type;
    reg [16:0] I_type;
    reg [0:0] I27;
    //Outputs
    wire [16:0] imm;

    mux_imm uut (
        .mem_type(mem_type),
        .I_type(I_type),
        .I27(I27),
        .imm(imm)
    );

    initial begin
        $monitor("time=%0d,mem_type = %d, I_type = %d, I27 = %d, imm = %d",$time, mem_type, I_type, I27, imm);
        #10 mem_type = 16'b0000000000000100; I_type = 16'b0000000000000001; I27 = 1'b0;
        #10 mem_type = 16'b0000000000000100; I_type = 16'b0000000000000001; I27 = 1'b1;
        #10 mem_type = 16'b0000000000000100; I_type = 16'b0000000000000001; I27 = 1'b0;
        #10 $finish;
    end
endmodule