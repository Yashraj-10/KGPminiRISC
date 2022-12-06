`timescale 1ns/1ps

module branch_TB();
    //Inputs
    reg [0:0] JCout;
    reg [0:0] UncondJump;
    reg [31:0] PCin;
    reg [31:0] JumpAddr;

    //outputs
    wire [31:0] PCnext;

    branch uut (
        .JCout(JCout),
        .UncondJump(UncondJump),
        .PCin(PCin),
        .JumpAddr(JumpAddr),
        .PCnext(PCnext)
    );

    initial begin 
        $monitor("time=%0d, JCout = %b, UncondJump = %b, PCin = %d, JumpAddr = %d, PCnext = %d",$time, JCout, UncondJump, PCin, JumpAddr, PCnext);
        JCout = 1'b0; UncondJump = 1'b0; PCin = 32'd0; JumpAddr = 32'd0;
        #10 JCout = 1'b0; UncondJump = 1'b0; PCin = 32'd2; JumpAddr = 32'd1;  // 5
        #10 JCout = 1'b1; UncondJump = 1'b0; PCin = 32'd1; JumpAddr = 32'd2;   //2 
        #10 JCout = 1'b0; UncondJump = 1'b1; PCin = 32'd5; JumpAddr = 32'd10;   //10 
        #10 JCout = 1'b1; UncondJump = 1'b1; PCin = 32'd0; JumpAddr = 32'd1;  //1
        #10 $finish;
    end
endmodule