module count6b(clk, addr);
input clk;
output reg [5:0] addr;

always @(posedge clk) begin
		if (addr == 6'b111111) 
			addr <= 0;
		else
			addr <= addr+1;
end

endmodule
