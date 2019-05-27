module regn(
	input R,
	input Rin, Clock,
	output reg Q);
	
	always @(posedge Clock)
		if (Rin)
			Q <= R;
endmodule
