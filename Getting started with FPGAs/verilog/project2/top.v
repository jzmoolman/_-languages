module And_Gate_Project
	(input[1:0]  sw,
	 output[0:0] led);
 assign led[0] = sw[0] & sw[1];

 endmodule 


