module cnt8(clk, rst, en, cq, count);
input clk, rst, en;
output reg count;
output reg [2:0] cq;

always @(posedge clk or negedge rst) begin
	if(!rst)
		cq <= 3'b000;
	else if(en == 1) begin
		if(cq == 3'b111)
			begin
				cq <= 3'b000;
				count = 1'b1;
			end
		else
			begin
				cq <= cq + 1;
				count = 1'b0;
			end
	end
end

endmodule
