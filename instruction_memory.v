`timescale 1ns / 1ps

module instruction_memory(input [7:0] pc, output reg [7:0] instr);
    
    reg [7:0] Data [0:255];
    
    initial $readmemb ("instructions.mem", Data);
    
    always@ (pc) begin
        instr<= Data[pc];
    end


    
endmodule


//testbench for the instruction memory
module tb_instruction_memory;
	reg [7:0] pc;
	wire [7:0] instr;
	instruction_memory uut(pc,instr);
	
	initial
	begin 
	#10 pc = 8`b00000000;
	#10 pc = 8`b10000000;
	#10 pc = 8`b10100000;
	#10 pc = 8`b11000000;
	#10 pc = 8`b11100000;
	#10 $finish;
	end
endmodule