 module mux_8_1_2 (
	input [7:0] x1,
	input [7:0] x2,
	input s,
	output reg [1:0] y);
	
	always @(s)
		y = {x1[s], x2[s]};
		
endmodule
