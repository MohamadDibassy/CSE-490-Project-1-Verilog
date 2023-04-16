`timescale 1ns / 1ps


module DataMemory(output reg[7:0] data_out,
                  input mem_write,
                  input mem_read,
                  input [7:0] Address,
                  input [7:0] Write_data,
                  input clk);
    
    //initialze Main Memory Array
    reg [7:0] MainMemory [0:255];
    
    always@(negedge clk, posedge clk)
    begin
        if (mem_write) MainMemory[Address] = Write_data;
        if (mem_read) data_out = MainMemory[Address];

    end
    
endmodule
