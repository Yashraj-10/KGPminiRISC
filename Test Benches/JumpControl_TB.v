`timescale  1ns/1ps

module JumpControl_TB();
    //Inputs
    reg [2:0] flag;
    reg [2:0] CondJump;
    //Outputs
    wire [0:0] JCout;

    JumpControl uut (
        .flag(flag),
        .CondJump(CondJump),
        .JCout(JCout)
    );

    initial begin 
        $monitor("time=%0d, flag = %b, CondJump = %b, JCout = %b",$time, flag, CondJump, JCout);
        #10 flag = 3'b000; CondJump = 3'b000;
        #10 flag = 3'b100; CondJump = 3'b001;
        #10 flag = 3'b011; CondJump = 3'b010;
        #10 flag = 3'b000; CondJump = 3'b011;
        #10 flag = 3'b001; CondJump = 3'b100;
        #10 flag = 3'b000; CondJump = 3'b101;
        #10 flag = 3'b011; CondJump = 3'b011;
        #10 $finish;
    end

endmodule
