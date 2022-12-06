`timescale 1ns/1ps

module mux_MemToReg_TB();
    //Inputs
    reg [31:0] a;
    reg [31:0] b;
    reg [31:0] c;
    reg [1:0] sel;
    //Outputs
    wire [31:0] out;

    mux_MemToReg uut (
        .a(a),
        .b(b),
        .c(c),
        .sel(sel),
        .out(out)
    );

    initial begin
        $monitor("time=%0d, a= %d, b= %d, c= %d, sel= %d, out= %d",$time, a, b, c, sel, out);
        #10 a = 32'b00000000000000000000000000000001; b = 32'b00000000000000000000000000000010; c = 32'b00000000000000000000000000000100; sel = 2'b00; 
        #10 a = 32'b00000000000000000000000000000001; b = 32'b00000000000000000000000000000010; c = 32'b00000000000000000000000000000100; sel = 2'b01; 
        #10 a = 32'b00000000000000000000000000000001; b = 32'b00000000000000000000000000000010; c = 32'b00000000000000000000000000000100; sel = 2'b10; 
        #10 a = 32'b00000000000000000000000000000001; b = 32'b00000000000000000000000000000010; c = 32'b00000000000000000000000000000100; sel = 2'b11; 
        #10 $finish;
    end
endmodule