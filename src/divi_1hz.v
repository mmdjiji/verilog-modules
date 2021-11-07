module divi_1hz(clk, divi_1hz);
input clk;
output reg divi_1hz;
reg [31:0] count_reg1;

always @(posedge clk)
	if(count_reg1 == 24999999)
		begin
			divi_1hz <= ~divi_1hz;
			count_reg1 <= 0;
		end
	else
		begin
			count_reg1 <= count_reg1 + 1;
		end

endmodule
