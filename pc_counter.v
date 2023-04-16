module pc_counter (clk,rst, out);




input clk;
input rst;
output reg [7:0] out;

//reg [7:0] out;

//always @(postedge clk)
//if (rst) begin
//out <= 8 'b0;
//end else if (enable) begin
//out <= out + 1;

always@(posedge clk)
begin
if (rst==1)
begin 
out <= 8 'b0;
end 
else
begin
out <= out + 1;
end

end
endmodule