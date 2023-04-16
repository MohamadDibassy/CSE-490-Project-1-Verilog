module mux21(input1,input2,select,out);
 input wire input1, input2, select; 
 output reg out; 
 
 always @ (input1 or input2 or select) 
 begin 
 
 if(select == 1) 
 begin 
 out = input2; 
 end 
 else 
 begin 
 out = input1; 
 end 
 endmodule