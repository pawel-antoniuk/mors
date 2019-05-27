module Morse_code(
	input clock,
	input [2:0] SW,
	input [1:0] KEY,
	output [1:0] LEDR);
	
	(* keep *) reg en;
	
	always @(KEY[1], KEY[0], mux_done) begin
		if(KEY[1])
			en = 1'b1;
		if(KEY[0])
			en = 1'b0;	
		if(mux_done)
			en = 1'b0;
	end
	
	(* keep *) wire [3:0] q;
	
	counter_mod_M #(10) counter(
		.clk(clock),
		.enable(en),
		.areset(!KEY[0]),
		.Q(q),
		.rollover());
		
	wire [7:0] dout;
	wire [7:0] done;
	morse_letter_register #(4, 4'd5, 4'd9, 9'b101110000) reg_A (q, dout[0], done[0]);
	morse_letter_register #(4, 4'd9, 4'd9, 9'b111010101) reg_B (q, dout[1], done[1]);
	morse_letter_register #(4, 4'd9, 4'd9, 9'b111011101) reg_C (q, dout[2], done[2]);
	morse_letter_register #(4, 4'd7, 4'd9, 9'b111010100) reg_D (q, dout[3], done[3]);
	morse_letter_register #(4, 4'd1, 4'd9, 9'b100000000) reg_E (q, dout[4], done[4]);
	morse_letter_register #(4, 4'd9, 4'd9, 9'b101011101) reg_F (q, dout[5], done[5]);
	morse_letter_register #(4, 4'd9, 4'd9, 9'b111011101) reg_G (q, dout[6], done[6]);
	morse_letter_register #(4, 4'd7, 4'd9, 9'b101010100) reg_H (q, dout[7], done[7]);
	
	wire mux_out, mux_done;
	mux_8_1_2 mux(dout, done, SW, en, {mux_out, mux_done});
	
	assign LEDR[0] = mux_out;
	assign LEDR[1] = mux_done;
	
endmodule
