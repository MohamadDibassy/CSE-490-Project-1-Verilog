`timescale 1ns / 1ps

module sign_extend(input [2:0] imm, output [7:0] signExtImm, input clk);
    assign signExtImm = {imm[2], imm[2], imm[2], imm[2], imm[2], imm[2], imm[1], imm[0]};
endmodule

module tb_sign_extend();

    reg[2:0] x_tb;
    wire[7:0] y_tb;
    
    sign_extend signExt(x_tb, y_tb);
    
    initial
        begin
            #0 x_tb= 0;
            #1 x_tb = 'b001;
            #1 x_tb = 'b010;
            #1 x_tb = 'b011;
            #1 x_tb = 'b100;
            #1 x_tb = 'b101;
            #1 x_tb = 'b110;
            #1 x_tb = 'b111;
            #1 $finish;
        end
    
    initial
        begin
            $display("imm  sign ext");
            $monitor("%b  %b  ",x_tb,y_tb);
        end
        
endmodule