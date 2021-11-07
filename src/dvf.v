module dvf(clk, data_in, div);
input clk;
input [31:0] data_in;
output div;
reg [31:0] cnt1, cnt2, cnt3;

reg div_odd_1, div_odd_2, div_even;

always @(posedge clk) begin
	cnt1 = cnt1 + 1;
	if(cnt1 >= data_in>>1) begin
		cnt1 = 0;
		div_even = ~div_even;
	end
end

always @(posedge clk) begin
	cnt2 = cnt2 + 1;
	if(cnt2 == (data_in+1)>>1) begin
		div_odd_1 = ~div_odd_1;
	end
	else if(cnt2 == data_in) begin
		cnt2 = 0;
		div_odd_1 = ~div_odd_1;
	end
end

always @(negedge clk) begin
	cnt3 = cnt3 + 1;
	if(cnt3 == (data_in+1)>>1) begin
		div_odd_2 = ~div_odd_2;
	end
	else if(cnt3 == data_in) begin
		cnt3 = 0;
		div_odd_2 = ~div_odd_2;
	end
end

assign div = data_in[0] ? (div_odd_1 | div_odd_2) : div_even;

endmodule 