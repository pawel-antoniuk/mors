module morse_letter_register #(N, M, M_Max, Code) (
	input [N-1:0] index,
	output reg data_out,
	output reg done);
	
	always @(index[3:0]) begin
		
		if(index < M) begin
			data_out = Code[M_Max - 1 - index];
			done = 1'b0;
		end
		else begin
			data_out = 1'b0;
			done = 1'b1;
		end
	end
	
endmodule
