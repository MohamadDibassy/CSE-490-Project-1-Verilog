`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2023 03:12:39 PM
// Design Name: 
// Module Name: Pc_counter_test
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

module pc_counter_testbench();
reg clk, rst;
wire [7:0] out; 
pc_counter uut(clk,rst, out);
initial 
begin
#10 clk=1; rst=1; 
#10 clk=0; rst=0;
#10 clk=1;  
#10 clk=0;
#10 clk=1;
#10 clk=0; 
#10 $finish;
end 
endmodule
