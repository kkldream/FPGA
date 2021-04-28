module demux1_4 ( D, Y0, Y1, Y2, Y3, s0, s1);

parameter width = 8;

input [width-1:0] D;
input s1, s0;
output reg [width-1:0] Y0, Y1, Y2, Y3;


always @( D or s0 or s1)
begin
	case ({s1, s0})
		2'b00 : begin Y0 <= D; Y1 <= 4'b1111; Y2 <= 4'b1111; Y3 <= 4'b1111; end
		2'b01 : begin Y0 <= 4'b1111; Y1 <= D; Y2 <= 4'b1111; Y3 <= 4'b1111; end
		2'b10 : begin Y0 <= 4'b1111; Y1 <= 4'b1111; Y2 <= D; Y3 <= 4'b1111; end
		2'b11 : begin Y0 <= 4'b1111; Y1 <= 4'b1111; Y2 <= 4'b1111; Y3 <= D; end
	endcase
end

endmodule
