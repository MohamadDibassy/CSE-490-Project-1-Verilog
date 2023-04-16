module ALU(a,b,alu_op,result);//define module name and port variables 
input [7:0] a,b;//define 8-bit inputs
input alu_op;//define alu opcode
output [7:0] result;//define 8 bit output result
assign result = alu_op ? a<<b : a+b;//alu_op=0 --> addition, alu_op=1 --> shift left
endmodule 


//testbench ALU code
module tb_ALU;
reg [7:0] a,b;//define 8-bit inputs
reg alu_op;//define alu opcode
wire [7:0] result;//define 8 bit output result
ALU uut(a,b,alu_op,result);//module instantiation
initial
begin
//test vector define
a=8'd10; b=8'd26; alu_op=0;
#10 a=8'd51; b=8'd78; alu_op=0;
#10 a=8'b11111111; b=8'd0; alu_op=1;
#10 a=8'b11111111; b=8'd1; alu_op=1;
#10 a=8'b11111111; b=8'd2; alu_op=1;
#10 a=8'b11111111; b=8'd3; alu_op=1;
#10 a=8'b11111111; b=8'd4; alu_op=1;
#10 a=8'b11111111; b=8'd5; alu_op=1;
#10 a=8'b11111111; b=8'd6; alu_op=1;
#10 a=8'b11111111; b=8'd7; alu_op=1;
end
endmodule