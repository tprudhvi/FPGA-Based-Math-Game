module access_control(clk,rst,password,button_push,rng_button,rng_out,toggle_switch,load,load_out,enable,reconfig,time_out,donot_borrow,green_led,red_led,timer_enable,timer1s_out);

input [3:0] toggle_switch;
input clk,rst,button_push,rng_button,load,time_out,timer1s_out;
output reg green_led, red_led,load_out,rng_out,enable,reconfig,donot_borrow,timer_enable;
output reg [3:0] password;
reg sofarsogood; 
reg [1:0] count;

reg [3:0] State;
parameter c1=0,c2=1,c3=2,c4=3,c5=4,c6=5,c7=6,c8=7,c9=8,c10=9,c11=10,c12=11;

always@(posedge clk) 
begin 
  if (rst == 0)
     begin 
        password <= 0;
        green_led <= 0;
       red_led<= 0;
       rng_out <= 0;
       load_out <= 0;
      State <= c1;
	enable<=0;
	reconfig<=0;
	donot_borrow<=0;
      sofarsogood <= 0;
	timer_enable<=0;
count<=0;
     end
  else
     begin
       case (State)
             c1: begin
                sofarsogood <= 1;
                green_led <= 0;
                red_led<= 1;
                     if (button_push == 1) 
                      begin
                         password <= toggle_switch ;
                         State <= c2;
                             if(toggle_switch != 4'b1001)
                                sofarsogood <= 0;  
                      end
                     else
                      State <= c1;                 
                    end
     c2: begin 
                green_led <= 0;
                red_led<= 1;
                   if (button_push == 1) 
                      begin
                      password <= toggle_switch ;
                      State <= c3;
                        if(toggle_switch != 4'b1001)
                           sofarsogood <= 0;  
                      end
                     else
                      State <= c2;                 
                    end
      c3: begin 
                green_led <= 0;
                red_led<= 1;
                   if (button_push == 1) 
                      begin
                      password<= toggle_switch ;
                      State <= c4;
                        if(toggle_switch!= 4'b0000)
                           sofarsogood <= 0;   
                      end
                     else
                      State <= c3;                 
                    end
   c4: begin 
                    if (button_push == 1) 
                      begin
                        password <= toggle_switch ;
                        State <= c5;
                            if(toggle_switch != 4'b1001) begin 
                                   sofarsogood <= 0; end
                            else
                              begin 
                                 if (sofarsogood == 1)
                                  begin
                                    green_led <= 1;
                                     red_led <= 0;
				     donot_borrow<=1;
                                   end
                               else 
                                 begin
                                  green_led <= 0;
                                  red_led <= 1; 
				State<=c1;
                                 end  
                             end 
                           end
                     else
                      State <= c4;  
                    end
          c5: begin
			if(button_push==1)
			begin
				reconfig<=1;
				State<=c6;
				end
			else
			begin
				State<=c5;
			end
                  end
           c6: begin
			reconfig<=0;
			if(button_push==1)
			begin
				enable<=1;
				State<=c7;
			end
			else
			begin
				State<=c6;
			end
		end
	  
	  c7: begin
				count<=0;
				State<=c7;
				load_out<=load;
				rng_out<=~rng_button;
				if(button_push==1)
					begin		
						State<=c8;
						timer_enable<=1;
					end
			
		end
	  c8: begin
			if(timer1s_out==0)
			begin
				if(button_push==1)
				begin
					count<=count+1;
				end
			end
			else
			begin
				
				State<=c9;
			end
		end
	


	  c9: begin
		timer_enable<=0;
		if(count==0)
		begin
			State<=c10;
		end
		else if(count==1)
		begin
			State<=c11;
		end
		else if(count==2)		
		begin
			State<=c12;
		end
	end
	c10:begin
			enable<=0;
			if(button_push==1)
			begin
				enable<=1;
				State<=c7;
			end
			end
	c11:begin
			enable<=0;
			reconfig<=1;
			if(button_push==1)
			begin
				State<=c7;
				enable<=1;
				reconfig<=0;
			end
		end
	c12:begin
		red_led<=1;
		green_led<=0;
		State<=c1;
		end
	default: begin
			State<=c1;	
		end	
	         
             endcase
           end
        end
   endmodule

