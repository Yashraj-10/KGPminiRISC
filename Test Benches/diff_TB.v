`timescale 1ns/1ps

module diff_TB;

    reg [31:0] a = 32'd0;
    reg [31:0] b = 32'd0;
    wire [31:0] out;

    diff uut(.a(a), .b(b), .diffBit(out));

    initial begin
        $monitor("a = %d, b = %d, diff = %d", a, b, out);
        
        #5 a = 32'd1; b = 32'd0;
        #5 a = 32'd5045; b = 32'd45042;
        #5 a = 32'd32768; b = 32'd32768;
        #5 a = 32'd65535; b = 32'd65535;
        #5 a = 32'd1234567; b= 32'd3456789;
        #5 $finish;
    end
endmodule