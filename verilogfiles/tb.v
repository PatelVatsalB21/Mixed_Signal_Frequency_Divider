`include "counter.v"
module tb; 
 
	reg CLK; 
	reg COUNT; 
	 
	counter counter1(.CLK(CLK), .COUNT(COUNT));
   
	always 
	begin 
      
		CLK = 0; 
		#2.5; 
     
		CLK = 1; 
      		#2.5; 
	end 
endmodule