module Control(opcode,RegWrite,ALUSrc,alu_op,MemWrite,MemRead,MemtoReg);//define module name and ports names
input [2:0] opcode;//3 bit input for opcode
output reg RegWrite,ALUSrc,alu_op,MemWrite,MemRead,MemtoReg;//1 bit output control processor operations

always @(*)//runs on any input change
begin
if (opcode==3'b000)//Add instruction
begin
//assign values to output based on instruction
RegWrite=1'b1;//enable data write operation in regFile
ALUSrc=1'b0;//select rt data
alu_op=1'b0;//select ALU addition
MemWrite=1'b0;//disable write operation into data memory
MemRead=1'b0;//disable read data operation from data memory
MemtoReg=1'b0;//store alu result data into register
end
else if (opcode==3'b100)//Addi instruction
begin
//assign values to output based on instruction
RegWrite=1'b1;//enable data write operation in regFile
ALUSrc=1'b1;//select immediate data
alu_op=1'b0;//select ALU addition
MemWrite=1'b0;//disable write operation into data memory
MemRead=1'b0;//disable read data operation from data memory
MemtoReg=1'b0;//store alu result data into register
end
else if (opcode==3'b101)//Sw instruction
begin
//assign values to output based on instruction
RegWrite=1'b0;//disable data write operation in regFile
ALUSrc=1'b1;//select immediate data
alu_op=1'b0;//select ALU addition
MemWrite=1'b1;//write data in data memory
MemRead=1'b0;//disable read data operation from data memory
MemtoReg=1'b0;
end
else if (opcode==3'b110)//lw instruction
begin
//assign values to output based on instruction
RegWrite=1'b1;//enable data write operation in regFile
ALUSrc=1'b1;//select immediate data
alu_op=1'b0;//select ALU addition
MemWrite=1'b0;//disable write operation into data memory
MemRead=1'b1;//read data from dataMemory
MemtoReg=1'b1;//store data memory data into register
end
else if (opcode==3'b111)//sll instruction
begin
//assign values to output based on instruction
RegWrite=1'b1;//enable data write operation in regFile
ALUSrc=1'b1;//select immediate data
alu_op=1'b1;//select left shift operation
MemWrite=1'b0;//disable write operation into data memory
MemRead=1'b0;//disable read data operation from data memory
MemtoReg=1'b0;//store alu result data into register
end
else
begin
//assign values to output based on instruction
RegWrite=1'b0;//disable data write operation in regFile
ALUSrc=1'b0;//select rt data
alu_op=1'b0;//select ALU addition
MemWrite=1'b0;//disable write operation into data memory
MemRead=1'b0;//disable read data operation from data memory
MemtoReg=1'b0;//store alu result data into register
end
end
endmodule



//testbench for the Control
module tb_Control;
reg [2:0] opcode;//3 bit input for opcode
wire RegWrite,ALUSrc,alu_op,MemWrite,MemRead,MemtoReg;//1 bit output control processor operations
Control uut(opcode,RegWrite,ALUSrc,alu_op,MemWrite,MemRead,MemtoReg);//module instantiation
initial
begin
//test vector
opcode=3'b000;
#10 opcode=3'b001;
#10 opcode=3'b010;
#10 opcode=3'b011;
#10 opcode=3'b100;
#10 opcode=3'b101;
#10 opcode=3'b110;
#10 opcode=3'b111;
#10 $stop;//stop testbench simulation
end
endmodule