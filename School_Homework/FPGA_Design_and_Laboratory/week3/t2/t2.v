module t2 (sw,ledr);
input [3:0] sw;
output [3:0] ledr;
reg led;
assign ledr = sw;
endmodule
