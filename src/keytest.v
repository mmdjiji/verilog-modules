module keytest(clk, rst, keyin, keyout);
input clk, rst, keyin;
output reg keyout = 1;

reg [31:0] count = 0;
reg en = 1;

always @(posedge clk or negedge rst) begin
	if(!rst) begin
		keyout <= 1;
		count <= 0;
	end
	else if(clk) begin
		if(keyin == 0 && count == 0 && en) begin // press
			count <= 12000000; // 240ms
			en <= 0;
		end
		else if(count == 1) begin // release limit
			keyout <= 0;
			count <= 0;
		end
		else if(count != 0) begin // pressing
			count <= count - 1;
			keyout <= 1;
		end
		if(keyin == 1) en <= 1;
	end
end

endmodule
