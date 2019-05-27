 module mux_8_1_2 (
	input [7:0] x1,
	input [7:0] x2,
	input [2:0] s,
	input en,
	output reg [1:0] y);
	
	always @(s, x1, x2, en)
		if(en)
			y = {x2[s], x1[s]};
		else
			y = 2'b00;
		
endmodule
