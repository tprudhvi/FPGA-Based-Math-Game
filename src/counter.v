module counter(clk,rst,button,count_out);
input clk,rst,button;
output [3:0] count_out;
reg [3:0]count_out;
reg [3:0]count;
	always@(posedge clk)
	begin
		if(rst==0)
		begin
			count<=4'b0000;
			count_out<=4'b0000;
		end
		else 
		begin
				if(button==1)
				begin
					if(count==4'b1111)
					begin
						count<=4'b0000;
					end
					else
					begin
						count<=count+4'b0001;
					end
				end
				else
				begin
					count_out<=count;
				end
		end
	end
endmodule


