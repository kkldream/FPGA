module Draw (iCLK,
				 iCLK50,
				 iRed,
				 iGreen,
				 iBlue,
				 oRed,
				 oGreen,
				 oBlue,
				 iX_Cont,
				 iY_Cont);
				 
parameter WIGHT = 799; 
parameter HIGHT = 479;

input iCLK;
input iCLK50;
input [11:0] iRed;
input [11:0] iGreen;
input [11:0] iBlue;
input [15:0] iX_Cont;
input [15:0] iY_Cont;
output [11:0] oRed;
output [11:0] oGreen;
output [11:0] oBlue;
reg [7:0] rRed;
reg [7:0] rGreen;
reg [7:0] rBlue;
assign oRed = {rRed, 4'b0};
assign oGreen = {rGreen, 4'b0};
assign oBlue = {rBlue, 4'b0};

reg [15:0] x_pos = WIGHT/2;
reg [15:0] y_pos = HIGHT/2;

wire [15:0] w_max;
wire [15:0] w_min;
wire [15:0] h_max;
wire [15:0] h_min;

assign w_max = x_pos + 100;
assign w_min = x_pos - 100;
assign h_max = y_pos + 60;
assign h_min = y_pos - 60;

always@(negedge iCLK)
begin
	if (iX_Cont > w_min && iX_Cont < w_max && iY_Cont > h_min && iY_Cont < h_max) begin
		rRed <= x_pos[7:0];
		rGreen <= y_pos[7:0];
		rBlue <= ~x_pos[7:0];
	end else begin
		rRed <= iRed[11:4];
		rGreen <= iGreen[11:4];
		rBlue <= iBlue[11:4];
	end
end

reg [27:0] counter;
reg x_mode, y_mode;
always @(posedge iCLK50)
begin
	if (counter == 28'd500000) begin
	
		if (x_pos < 100) x_mode <= 1;
		else if (x_pos > WIGHT - 100) x_mode <= 0;
		if (y_pos < 60) y_mode <= 1;
		else if (y_pos > HIGHT - 60) y_mode <= 0;
		
		if (x_mode == 1) x_pos <= x_pos + 1;
		else x_pos <= x_pos - 1;
		if (y_mode == 1) y_pos <= y_pos + 1;
		else y_pos <= y_pos - 1;
		
		counter <= 0;
	end else counter <= counter + 1;
end

endmodule
