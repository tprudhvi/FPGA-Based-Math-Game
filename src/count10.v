module count10(clk,rst,count,out);
input clk,rst,count;
output reg out;
reg [6:0] counter;

	always@(posedge clk)
	begin
	
		if(rst==0)
			begin
	
				out<=0;
				counter<=0;

			end

		else
			begin

				if(count==1)
				begin
					counter<=counter+1;
					if(counter==9)
						begin
							out<=1;
							counter<=0;
						end
					else
						begin
							out<=0;
						end
				end
				else
					begin
				
						out<=0;
					end
			end
	end
endmodule

