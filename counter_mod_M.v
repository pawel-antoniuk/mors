module counter_mod_M #(parameter M) (
	input clk, enable, areset,
	output reg[N-1:0] Q,
	output rollover
);

	localparam N=clogb2(M-1);
		function integer clogb2(input [31:0] v);
			for (clogb2 = 0; v > 0; clogb2 = clogb2 + 1)
				v = v >> 1;
	endfunction

	always @(posedge clk, negedge areset)
	begin
		if (!areset)			Q <= { N{1'b0} };
		else if (Q == M-1)	Q <= { N{1'b0} };
		else if (enable)		Q <= Q + 1'b1;
		else 						Q <= Q;
	end
	
	assign rollover = ~|Q;

endmodule
