module decoder(a, en, y);
	input[2:0] a;
	input en;
	output reg [7:0] y;
	wire[3:0] sel;
	assign sel = {en, a};
	always @(a, en)
		case(sel)
			4'b1000: y = 8'b11111110;
			4'b1001: y = 8'b11111101;
			4'b1010: y = 8'b11111011;
			4'b1011: y = 8'b11110111;
			4'b1100: y = 8'b11101111;
			4'b1101: y = 8'b11011111;
			4'b1110: y = 8'b10111111;
			4'b1111: y = 8'b01111111;
		endcase
endmodule
