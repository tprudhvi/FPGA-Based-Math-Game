module onesdigit(onesec_in,toggle_switch,timer_out,clk,rst,donot_borrow_in,time_out,reconfig,ten_timer_in);
 
   input[3:0] toggle_switch;
   input clk,rst,onesec_in,donot_borrow_in,reconfig;
 
  output reg[3:0] timer_out ;
  output reg time_out,ten_timer_in;
 


always@(posedge clk) 
  begin
   if(rst==0)
      begin
        timer_out<= 0;
        time_out<= 0;
        ten_timer_in<= 0;
      end
   else
       if(reconfig==1)
          begin
             timer_out<=toggle_switch;
          end
       else
          begin
             if(onesec_in==1)
                begin
                  if(timer_out == 0)
                     begin
                       if(donot_borrow_in == 0)
                          begin
                             timer_out<=4'b1001;
                             ten_timer_in<= 1; 
                          end
                       else 
                          begin
                             timer_out<=4'b0000;
                             ten_timer_in<=0;
									    
                          end
                      end
                    else 
                      begin
                        timer_out<=timer_out-4'b001;
                        ten_timer_in<= 0;
                      end
                end
             else
               begin
                  ten_timer_in<= 0;
                  timer_out<= timer_out ;
					
               end
          end
 end
endmodule

