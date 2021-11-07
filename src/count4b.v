module count4b(clk, rst, q);
input clk, rst;
output reg [3:0] q;

always @(posedge clk or negedge rst) begin
		if(!rst) 
			q <= 0;
		else if (q == 4'b1111) 
			q <= 0;
		else
			q <= q + 1;
end

endmodule
