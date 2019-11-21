//ECE 6370
//Author: Prudhvi Thota,9909
// adder
//This module takes two inputs and results the sum of two inputs
module adder(a,b,sum);
input [3:0] a,b;
output [3:0] sum;
reg [3:0] sum;
always@(a,b)
 begin
     sum=a+b;
 end
endmodule

