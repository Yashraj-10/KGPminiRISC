`timescale 1ns/1ps

module mux_ALUsrc_TB();
    //Inputs
    reg [31:0] readData2;
    reg [31:0] imm;
    reg [0:0] ALUsrc;
    //Outputs
    wire [31:0] b;
    
    mux_ALUsrc uut (
        .readData2(readData2),
        .imm(imm),
        .ALUsrc(ALUsrc),
        .b(b)
    );

    initial begin 
        $monitor("time=%0d,readData2 = %d, imm = %d, ALUsrc = %d, b = %d",$time, readData2, imm, ALUsrc, b);
        #10 readData2 = 32'b00000000000000000000000000000100; imm = 32'b00000000000000000000000000000000; ALUsrc = 1'b0;
        #10 readData2 = 32'b00000000000000000000000000000101; imm = 32'b00000000000000000000000000000000; ALUsrc = 1'b0;
        #10 readData2 = 32'b00000000000000000000000000000010; imm = 32'b00000000000000000000000000000001; ALUsrc = 1'b1;
        #10 readData2 = 32'b00000000000000000000000000000001; imm = 32'b00000000000000000000000000000001; ALUsrc = 1'b0;
        #10 readData2 = 32'b00000000000000000000000000000000; imm = 32'b00000000000000000000000000000000; ALUsrc = 1'b1;
        #10 readData2 = 32'b00000000000000000000000000000001; imm = 32'b00000000000000000000000000000000; ALUsrc = 1'b1;
        #10 readData2 = 32'b00000000000000000000000000000000; imm = 32'b00000000000000000000000000010001; ALUsrc = 1'b1;
        #10 readData2 = 32'b00000000000000000000000000000001; imm = 32'b00000000000000000000000000001001; ALUsrc = 1'b1;
        #10 $finish;
    end
endmodule