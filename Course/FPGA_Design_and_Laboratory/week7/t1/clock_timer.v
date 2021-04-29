// clock_timer.v 
// clock_timer;
// iclk: basic clock, for example: 50 MHz
module clock_timer( iclk, iclk_sec, ikey, okey_count, ohour, omin, osec);

input iclk, iclk_sec;
input [4:0] ikey;
output [7:0] ohour, omin, osec, okey_count;

wire	key2_press, key1_press, clk_sec_edge;
reg [7:0] thour, tmin, tsec, tkey_count;
reg [2:0] key2_dly, key1_dly, clk_sec_dly;

// 16進制轉換至BCD進制
assign osec[3:0] = tsec%10;
assign osec[7:4] = tsec/10;

assign omin[3:0] = tmin%10;
assign omin[7:4] = tmin/10;

assign ohour[3:0] = thour%10;
assign ohour[7:4] = thour/10;

assign okey_count[3:0] = tkey_count%10;
assign okey_count[7:4] = tkey_count/10;

// edge detection key2, key1, clock_second 
assign key2_press = (key2_dly[2] && !key2_dly[1]) ? 1'b1:1'b0;
assign key1_press = (key1_dly[2] && !key1_dly[1]) ? 1'b1:1'b0;
assign clk_sec_edge = (clk_sec_dly[2] && !clk_sec_dly[1]) ? 1'b1:1'b0;

always @(posedge iclk)
begin
	// Chapter 2 edge detection
	key2_dly <= {key2_dly[1:0], ikey[2]};
	key1_dly <= {key1_dly[1:0], ikey[1]};
	clk_sec_dly <= {clk_sec_dly[1:0], iclk_sec};
		
	if (!ikey[0])
	begin
		thour <= 0;
		tmin <= 0;
		tsec <= 0;
		tkey_count <= 0;
	end
	else if (thour==11 && tmin==59 && tsec==59 && clk_sec_edge)
		begin
			thour <= 0;
			tmin <= 0;
			tsec <= 0;
		end
	else if (tmin==59 && tsec==59 && clk_sec_edge)
		begin
			thour <= thour+1;
			tmin <= 0;
			tsec <= 0;
		end
	else if (tsec == 59 && clk_sec_edge)
		begin
			tmin <= tmin+1;
			tsec <= 0;
		end
	else if (clk_sec_edge)
		tsec <= tsec + 1;
	else if (key2_press)
		begin
			tkey_count <= tkey_count+1'b1;
			if (thour==11) thour <= 0; else	thour <=thour+1;
		end
	else if (key1_press)
		begin
			tkey_count <= tkey_count+1'b1;
			if (tmin ==59) tmin<=0; else	tmin <= tmin+1;
		end		
end

endmodule
