module onems(clk,rst,enable,out);

input clk,rst,enable;
output out;
reg out;
reg [15:0] count;

	always@(posedge clk)
		begin
			if(rst==0)
				begin
					out<=0;
					count<=0;
				end
			else
				begin
					if(enable==1)
						begin
							count<=count+1;
								if(count==49999)
									begin
										out<=1;
										count<=0;
									end
								else
									begin
										out<=0;
									end
						end
				end
		end
endmodule

