module random_number_gen(clk,rst,button,random);
input clk,rst,button;
output [3:0] random;

	assign button_invert=~button;
	counter c1(clk,rst,button_invert,random);
endmodule
