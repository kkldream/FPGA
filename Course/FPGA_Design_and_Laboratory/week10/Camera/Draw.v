module	Draw		(	iCLK,
							iRed,
							iGreen,
							iBlue,
							oRed,
							oGreen,
							oBlue,
							iX_Cont,
							iY_Cont
							);
parameter HIGHT = 799; 
parameter WIGHT = 479;

input iCLK;
input iRed;
input iGreen;
input iBlue;
input iX_Cont;
input iY_Cont;
output oRed;
output oGreen;
output oBlue;


always@(negedge iCLK)
begin
	if (iX_Cont > 10 && iX_Cont < 20) begin
		oRed <= 12'd200;
		oGreen <= 12'd200;
		oBlue <= 12'd200;
	end else if (iX_Cont > HIGHT-20 && iX_Cont < HIGHT-10) begin
		oRed <= 12'd200;
		oGreen <= 12'd200;
		oBlue <= 12'd200;
	end else if (iX_Cont > HIGHT/2-50 && iX_Cont < HIGHT/2+50 &&
					iY_Cont > WIGHT/2-50 && iY_Cont < WIGHT/2+50) begin
		oRed <= iRed;
		oGreen <= iRed;
		oBlue <= iRed;
	end else begin
		oRed <= iRed;
		oGreen <= iGreen;
		oBlue <= iBlue;
	end
end


endmodule
