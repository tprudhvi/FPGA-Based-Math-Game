//course: ECE 6370
//Homework 4
//Author: Prudhvi Thota, 9909
//Design and simulation of load register
// Load Register is used for loading input values to output only if load=1

module load_register(clk,rst,load,in,out);

input clk,rst,load;
input [3:0] in;
output [3:0] out;
reg [3:0] out;

always@(posedge clk)
     begin
      
           if(rst==0)
              begin
                     out<=4'b0000;
              end
           else 
              begin
                  if(load==1)                  
                     out<=in;
              end
     end
endmodule
   
    



