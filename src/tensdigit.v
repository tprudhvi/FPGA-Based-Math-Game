module tensdigit(clk,rst,tenthsec,toggle_sw1,timer_out1,donot_borrow_in1,donot_borrow_out1,reconfig1,time_out1);
 
   input[3:0] toggle_sw1;
   input clk,rst,tenthsec,donot_borrow_in1,reconfig1;
 
  output reg[3:0] timer_out1 ;
  output reg donot_borrow_out1,time_out1;
  


always@(posedge clk) 
  begin
   if(rst==0)
      begin
        timer_out1<= 0;
        donot_borrow_out1<= 0;
        time_out1<= 0;
      end
   else
       if(reconfig1==1)
          begin
             timer_out1<=toggle_sw1;
          end
       else
          begin
             if(tenthsec==1)
                begin
                  if(timer_out1== 0)
                     begin
                       if(donot_borrow_in1 == 0)
                          begin
                             timer_out1<=4'b1001;
                             time_out1<= 1;
                             donot_borrow_out1<= 0; 
                          end
                       else 
                          begin
                             timer_out1<=4'b0000;
                             time_out1<=0;  
                          end
                      end
                    else 
                      begin
                        timer_out1<=timer_out1-4'b001;
                          if(timer_out1==4'b0001)
                            begin
                              donot_borrow_out1<= 1;
                            end
                          else
                            begin
                              time_out1<=0; 
                              donot_borrow_out1<= 0;
                            end
                      end
                end
             else
               begin
                  time_out1<= 0;
                  timer_out1<= timer_out1 ;
               end
          end
 end
endmodule

