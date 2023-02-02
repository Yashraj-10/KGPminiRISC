`timescale 1ns / 1ps

module Register_file_TB;
    //Inputs
    reg [4:0] rs;
    reg [4:0] rt;
    reg [1:0] RegDst;
    reg [31:0] WriteData;
    reg [0:0] RegWrite;
    reg clk;
    reg rst;
    //Outputs
    wire [31:0] readData1;
    wire [31:0] readData2;
    wire [31:0] regfileoutput;

    register_file uut (
        .rs(rs),
        .rt(rt),
        .RegDst(RegDst),
        .WriteData(WriteData),
        .RegWrite(RegWrite),
        .clk(clk),
        .rst(rst),
        .readData1(readData1),
        .readData2(readData2),
        .regfileoutput(regfileoutput)
    );

    initial begin 
        clk = 0;
        rst = 0;
        #10 rst = 1;
        $monitor("time=%0d,rs = %d, rt = %d, RegDst = %d, WriteData = %d, RegWrite = %d, clk = %d, rst = %d, readData1 = %d, readData2 = %d, regfileoutput = %d",$time, rs, rt, RegDst, WriteData, RegWrite, clk, rst, readData1, readData2, regfileoutput);
        #10 rst = 1;
        #10 rs= 5'b00000; rt = 5'b00001; RegDst = 2'b00; WriteData = 32'b00000000000000000000000000111111; RegWrite = 1'b1; clk = 1'b0; rst = 1'b0;
        #10 rs= 5'b00010; rt = 5'b00011; RegDst = 2'b01; WriteData = 32'b00000000000000000000000000001000; RegWrite = 1'b1; clk = 1'b0; rst = 1'b0;
        #10 rs= 5'b00100; rt = 5'b00101; RegDst = 2'b10; WriteData = 32'b00000000000000000000000000000100; RegWrite = 1'b0; clk = 1'b0; rst = 1'b1;
        #10 rs= 5'b01000; rt = 5'b01001; RegDst = 2'b00; WriteData = 32'b00000000000000000000000000000010; RegWrite = 1'b1; clk = 1'b0; rst = 1'b0;
        #10 rs= 5'b10000; rt = 5'b10001; RegDst = 2'b10; WriteData = 32'b00000000000000000000000000000001; RegWrite = 1'b1; clk = 1'b0; rst = 1'b0;
        #10 rs= 5'b10100; rt = 5'b11001; RegDst = 2'b10; WriteData = 32'b00000000000000000000000100000001; RegWrite = 1'b1; clk = 1'b0; rst = 1'b0;
        #10 rs= 5'b10010; rt = 5'b10011; RegDst = 2'b10; WriteData = 32'b00000000000000000000000000010001; RegWrite = 1'b1; clk = 1'b0; rst = 1'b0;
        #10 rst = 1'b1; 
        $finish;
    end
    
    always begin
        #10 clk = ~clk;
    end
endmodule
