module mux4_1 ( D0, D1, D2, D3, s0, s1, Y);

parameter width = 1;

input [width-1:0] D0, D1, D2, D3;
input s1, s0;
output reg [width-1:0] Y;


always @( D0 or D1 or D2 or D3 or s1, s1)
begin
	case ({s1, s0})
		2'b00 : Y <= D0;
		2'b01 : Y <= D1;
		2'b10 : Y <= D2;
		2'b11 : Y <= D3;
	endcase
end

endmodule
