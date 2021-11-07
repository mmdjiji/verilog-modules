module seg(d_in, a, b, c, d, e, f, g, dp, ds);
input [3:0] d_in;
output [7:0] ds;
output reg a, b, c, d, e, f, g, dp;
reg [7:0] seg; // g, f, e, d, c, b, a, dp

assign ds = 8'b01111111;
always @(d_in) begin
  case(d_in)
    4'b0000: seg = 8'b01111110; // g, f, e, d, c, b, a, dp
    4'b0001: seg = 8'b00001100;
    4'b0010: seg = 8'b10110110;
    4'b0011: seg = 8'b10011110;
    4'b0100: seg = 8'b11001100;
    4'b0101: seg = 8'b11011010;
    4'b0110: seg = 8'b11111010;
    4'b0111: seg = 8'b00001110;
    4'b1000: seg = 8'b11111110;
    4'b1001: seg = 8'b11011110;
    4'b1010: seg = 8'b11101110;
    4'b1011: seg = 8'b11111000;
    4'b1100: seg = 8'b01110010;
    4'b1101: seg = 8'b10111100;
    4'b1110: seg = 8'b11110010;
    4'b1111: seg = 8'b11100010;
  endcase
  g = seg[7];
  f = seg[6];
  e = seg[5];
  d = seg[4];
  c = seg[3];
  b = seg[2];
  a = seg[1];
  dp = seg[0];
end
endmodule
