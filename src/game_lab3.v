module game_lab3(clk,rst,button_push_pswd,rng_button,load_p2,player2_in,toggle_sw1,toggle_sw2,toggle_sw_pswd,green_led,red_led,sevenseg1,sevenseg2,sevenseg3,sevenseg4,sevenseg5,sevenseg6);

input clk,rst,button_push_pswd,rng_button,load_p2;
input [3:0] player2_in,toggle_sw1,toggle_sw2,toggle_sw_pswd;

output green_led, red_led;

output [6:0] sevenseg1,sevenseg2,sevenseg3,sevenseg4,sevenseg5,sevenseg6;

wire [3:0] player2,rng,timer1_out,timer2_out,sum,password;
wire enable,reconfig,time_out,donot_borrow,onesec_in,button_password,load_out_p2,load_out,rng_in;

	button_shaper b1(clk,rst,button_push_pswd,button_password);
	button_shaper b2(clk,rst,load_p2,load_out);
	
	random_number_gen r1(clk,rst,rng_in,rng);
	
	access_controller_main a1(clk,rst,password,button_password,rng_button,rng_in,toggle_sw_pswd,load_out,load_out_p2,enable,reconfig,time_out,donot_borrow,green_led,red_led);

	adder ad1(rng,player2,sum);

	load_register l1(clk,rst,load_out_p2,player2_in,player2);
		
	seven_seg_decoder_7 s1(password,sevenseg1);
	seven_seg_decoder_7 s2(rng,sevenseg2);
	seven_seg_decoder_7 s3(player2,sevenseg3);
	seven_seg_decoder_7 s4(sum,sevenseg4);
	seven_seg_decoder_7 s5(timer1_out,sevenseg5);
	seven_seg_decoder_7 s6(timer2_out,sevenseg6);
	
	digit_timer d1(clk,rst,onesec_in,toggle_sw1,toggle_sw2,timer1_out,timer2_out,time_out,donot_borrow,reconfig);
	
	onesecond o1(clk,rst,enable,onesec_in);

endmodule
