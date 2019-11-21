module access_controller_main(clk,rst,password,button_push,rng_button,rng_out,toggle_switch,load,load_out,enable,reconfig,time_out,donot_borrow,green_led,red_led);

input [3:0] toggle_switch;
input clk,rst,button_push,rng_button,load,time_out;
output green_led, red_led,load_out,rng_out,enable,reconfig,donot_borrow;
output [3:0] password;
wire timer_enable,timer1s_out;

access_control a1(clk,rst,password,button_push,rng_button,rng_out,toggle_switch,load,load_out,enable,reconfig,time_out,donot_borrow,green_led,red_led,timer_enable,timer1s_out);
onesecond one(clk,rst,timer_enable,timer1s_out);

endmodule

