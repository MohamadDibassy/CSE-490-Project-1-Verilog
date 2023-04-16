`timescale 1ns / 1ps

module register_file(input readReg_1, input readReg_2, input regWrite, input writeReg, input [7:0] writeData, output [7:0] readData_1, output [7:0] readData_2, input clk);

    /* 8-bit registers $s0, $s1 */
    reg [7:0] s0, s1;
    
    initial
        begin
            s0 = 0;
            s1 = 0;
        end

    /* read from registers */
    assign readData_1 = readReg_1 ? s1 : s0;
    assign readData_2 = readReg_2 ? s1 : s0;

    /* write to register */
    always@(posedge clk)
        begin
            if(regWrite) case(writeReg)
                0: s0 = writeData;
                1: s1 = writeData;
            endcase
        end

endmodule

module tb_register_file();

    reg readReg_1, readReg_2, regWrite, writeReg;
    reg [7:0] writeData;
    wire [7:0] readData_1, readData_2;
    reg clk;
    
    register_file regFile(readReg_1, readReg_2, regWrite, writeReg, writeData, readData_1, readData_2, clk);
    
    initial
        begin
            #0 clk = 0;
            
            /* null input */
            readReg_1 = 0;
            readReg_2 = 0;
            regWrite = 0;
            writeReg = 0;
            writeData = 0;
            
            #10 clk = ~clk;
            #10 clk = ~clk;
            
            /* assign $s0 */
            readReg_1 = 0;
            readReg_2 = 0;
            regWrite = 1;
            writeReg = 0;
            writeData = 'b00001111;
            
            
            #10 clk = ~clk;
            #10 clk = ~clk;
            readReg_1 = 0;
            readReg_2 = 1;
            regWrite = 0;
            writeReg = 0;
            writeData = 0;
            
            
            #10 clk = ~clk;
            #10 clk = ~clk;
            
            /* assign $s1 */
            readReg_1 = 0;
            readReg_2 = 1;
            regWrite = 1;
            writeReg = 1;
            writeData = 'b11110000;
            
            
            #10 clk = ~clk;
            #10 clk = ~clk;
            
            /* read only $s1 */
            readReg_1 = 0;
            readReg_2 = 1;
            regWrite = 0;
            writeReg = 0;
            writeData = 0;
            
            #10 clk = ~clk;
            #10 clk = ~clk;
            
            $finish;
        end
    
    initial
        begin
            #10 $display();
            $display("clk readReg_1   readReg_2   regWrite   writeReg   writeData | readData_1   readData_2");
            //$monitor(" 0     0       0           0          0          0       00000000  |  00000000     00000000  | notes...");
            $monitor(" %b      %b           %b          %b          %b       %b  |  %b     %b  ", clk, readReg_1, readReg_2, regWrite, writeReg, writeData, readData_1, readData_2);
        end

endmodule
