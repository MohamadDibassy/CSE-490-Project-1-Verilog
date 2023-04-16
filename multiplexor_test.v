`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2023 12:33:53 PM
// Design Name: 
// Module Name: eightbit_adder_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module multiplexor_testbench();
reg input1,input2,select; 
wire out ; 
mux21 uut(input1,input2,select,out); 
initial 
begin 
select=0;input1=0;input2=0; 
#100 select=0;input1=0;input2=1;
#100 select=0;input1=1;input2=0; 
#100 select=0;input1=1;input2=1; 
#100 select=1;input1=0;input2=0;
#100 select=1;input1=0;input2=1; 
#100 select=1;input1=1;input2=0; 
#100 select=1;input1=1;input2=1;
#100 $finish;
 
end 
initial 
begin 
$monitor($time,"input1=%b,input2=%b,select=%b,out=%b",input1,input2,select,out); 

end    
endmodule