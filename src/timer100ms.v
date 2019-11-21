module timer100ms(clk,rst,enable,out);

input clk,rst,enable;

output out;

wire onems_out;

	onems t1(clk,rst,enable,onems_out);
	count100 c1(clk,rst,onems_out,out);

endmodule

