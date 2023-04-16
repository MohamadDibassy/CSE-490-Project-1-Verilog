module processor(clk,reset,PC,inst,Rt_Rd,Rs,Data_t,Data_d,Data_s,A,B,Alu_result);//define module name and ports name
input clk,reset;//define 1 bit inputs
output Rt_Rd,Rs;//1 bit outptu
output [7:0] PC,inst,Data_t,Data_d,Data_s,A,B,Alu_result; //define 8 bit outputs
wire [7:0] PCout,PC_plus_1,instruction,Data_rt,Data_rs,alu_result,Data_MemRead,Data_rd,alu_B;//8 bit internal variables
wire RegWrite,ALUSrc,alu_op,MemWrite,MemRead,MemtoReg;//internal variables
//module instantiation
//all module integration
Control control(.opcode(instruction[7:5]),.RegWrite(RegWrite),.ALUSrc(ALUSrc),.alu_op(alu_op),.MemWrite(MemWrite),.MemRead(MemRead),.MemtoReg(MemtoReg));
PC prgramCounter(.clk(clk),.reset(reset),.Din(PC_plus_1),.Dout(PCout));
PCADD programCounterIncrementor(.Din(PCout),.Dout(PC_plus_1));
instructionMemory InstructionMemory(.read_inst(PCout),.inst_out(instruction));
regfile RegisterFile(.clk(clk),.RegWrite(RegWrite),.rt_rd(instruction[4]),.rs(instruction[3]),.write_rd(Data_rd),.read_rt(Data_rt),.read_rs(Data_rs));
mux_2to1_8bit Mux2to1_8Bit_ALUSrc(.I0(Data_rt),.I1({1'b0,1'b0,1'b0,1'b0,1'b0,instruction[2:0]}),.S(ALUSrc),.Y(alu_B));
ALU alu(.a(Data_rs),.b(alu_B),.alu_op(alu_op),.result(alu_result));
dataMemory DataMemory(.clk(clk),.address(alu_result),.write_data(Data_rt),.MemWrite(MemWrite),.MemRead(MemRead),.read_data(Data_MemRead));
mux_2to1_8bit Mux2to1_8Bit_MemtoReg(.I0(alu_result),.I1(Data_MemRead),.S(MemtoReg),.Y(Data_rd));
//output assignment
assign PC = PCout;
assign inst= instruction;
assign Rt_Rd = instruction[4];
assign Rs = instruction[3];
assign Data_t =Data_rt;
assign Data_d =Data_rd;
assign Data_s =Data_rs;
assign A =Data_rs;
assign B =alu_B;
assign Alu_result =alu_result;
endmodule


//testbench for process
module tb_processor;
reg clk,reset;//define 1 bit inputs
wire Rt_Rd,Rs;//1 bit outptu
wire [7:0] PC,inst,Data_t,Data_d,Data_s,A,B,Alu_result; //define 8 bit outputs
processor uut(clk,reset,PC,inst,Rt_Rd,Rs,Data_t,Data_d,Data_s,A,B,Alu_result);//module instantiation
always 
#5 clk=~clk;//clock cahnges its value after every 5 ns
initial
begin
clk=0; reset=1;
#2 reset=0;
#200 $stop;//stop testbench simulation
end
endmodule