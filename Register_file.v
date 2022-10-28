`timescale 1ns/1ps

module register_file (
    input [4:0] rs,
    input [4:0] rt,                     // rs and rt are the register numbers
    input [1:0] RegDst,                 // 00: rs, 01: rt, 10: $ra, 11: none  (destination register)
    input [31:0] WriteData,             // WriteData is the data to be written to the register file
    input [0:0] RegWrite,               // 0: no write, 1: write
    input clk,                          // clock
    input rst,                          // reset
    output [31:0] readData1,            //
    output [31:0] readData2,            // readData2 is the output of the register file
    output [31:0] regfileoutput   // for debugging
);

    reg [31:0] registers[31:0];                         // 32 registers of 32 bits each (total 1024 bits)
    integer  i;
    initial begin                                       // initialize the registers
        for (i = 0; i < 32; i = i + 1) begin
            registers[i] = 0;
        end
    end
    always @(posedge clk) begin          // positive edge of clock is used because the registers are updated on the rising edge of the clock and the data is available on the falling edge of the clock 
                                                        // and the positive edge of reset is used because the registers are reset on the rising edge of the reset signal
        if (rst) begin                                  // reset the registers
            for (i = 0; i < 32; i = i + 1) begin
                registers[i] = 0;
            end
        end
        else begin
            if (RegWrite) begin                         // write to the register file
                case (RegDst)                           // select the destination register
                    2'b00: registers[rs] <= WriteData;  //  rs
                    2'b01: registers[rt] <= WriteData;  //  rt
                    2'b10: registers[31] <= WriteData;  //  $ra   
                    2'b11: ;                            //  none
                endcase
            end
        end
    end
    assign readData1 = registers[rs];                   // readData1 is the output of the register file
    assign readData2 = registers[rt];                   // readData2 is the output of the register file
    assign regfileoutput = registers[5'b11111];                   // for debugging
   
endmodule

