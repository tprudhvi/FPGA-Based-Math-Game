//course:ECE 6370
//Homework:5
//Author: Prudhvi Thota,9909
//Design and simulation of Button Shaper
//Button push generates a long low pulse. Button shaper converts that long low pulse into single clock cycle high pulse
//Implemented in two procedure finite state machine verilog coding style

module button_shaper(clk,rst,b_in,b_out);

  input clk,rst,b_in;
  output b_out;
  reg b_out;

  parameter init=0,pulse=1,wait_delay=2;

  reg [1:0] state, next_state;

  always@(state,b_in) begin
   
     case (state)
      
        init: begin
      
            b_out<=0;
           
              if(b_in==1)
    
                next_state<=init;
       
              else
                
                next_state<=pulse;
     
              end
     
        pulse: begin
  
            b_out<=1;
    		if(b_in==0)
                next_state<=wait_delay;
		else
			next_state<=init;
	              end
 
        wait_delay: begin

            b_out<=0;
 
              if(b_in==0)
  
                next_state<=wait_delay;
 
              else
 
                next_state<=init;

                   end

     endcase

  end

  always@(posedge clk) begin

       if(rst==0)
 
            state<=init;

       else

            state<=next_state;

  end

endmodule

