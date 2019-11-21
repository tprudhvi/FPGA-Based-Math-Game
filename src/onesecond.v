module onesecond(clk,rst,enable,out);

input clk,rst,enable;

output out;

wire timer100ms_out;

	timer100ms t1(clk,rst,enable,timer100ms_out);
	count10 c1(clk,rst,timer100ms_out,out);

endmodule
