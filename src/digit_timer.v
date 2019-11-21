module digit_timer(clk,rst,onesec_in,toggle_switch,toggle_sw1,timer_out,timer_out1,time_out,donot_borrow_in1,reconfig);

input clk,rst,onesec_in,donot_borrow_in1,reconfig;
input [3:0] toggle_switch,toggle_sw1;

output [3:0] timer_out,timer_out1;
output time_out;

wire donot_borrow_out,ten_timer_in,time_out1;

	onesdigit o1(onesec_in,toggle_switch,timer_out,clk,rst,donot_borrow_out,time_out,reconfig,ten_timer_in);
	tensdigit t1(clk,rst,ten_timer_in,toggle_sw1,timer_out1,donot_borrow_in1,donot_borrow_out,reconfig,time_out1);

endmodule

