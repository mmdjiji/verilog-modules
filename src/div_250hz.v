module div_250hz(clk, div);
input clk;
output reg div;
reg [31:0] count_reg1;

always @(posedge clk)
	if(count_reg1 == 99999) // 50000000MHz -> 250Hz
		begin
			div <= ~div;
			count_reg1 <= 0;
		end
	else
		begin
			count_reg1 <= count_reg1 + 1;
		end

endmodule
