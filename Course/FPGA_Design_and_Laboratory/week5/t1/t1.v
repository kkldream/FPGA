
//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module t1(

	//////////// CLOCK //////////
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,

	//////////// LED //////////
	LEDG,
	LEDR,

	//////////// KEY //////////
	KEY,

	//////////// SW //////////
	SW,

	//////////// SEG7 //////////
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7 
);

//=======================================================
//  PARAMETER declarations
//=======================================================


//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input 		          		CLOCK_50;
input 		          		CLOCK2_50;
input 		          		CLOCK3_50;

//////////// LED //////////
output reg		  [8:0]		LEDG = 8'b00000111;
output reg		  [17:0]		LEDR;

//////////// KEY //////////
input		        [3:0]		KEY;

//////////// SW //////////
input 		    [17:0]		SW;

//////////// SEG7 //////////
output		     [6:0]		HEX0;
output		     [6:0]		HEX1;
output		     [6:0]		HEX2;
output		     [6:0]		HEX3;
output		     [6:0]		HEX4;
output		     [6:0]		HEX5;
output		     [6:0]		HEX6;
output		     [6:0]		HEX7;


//=======================================================
//  REG/WIRE declarations
//=======================================================


reg              [2:0]     key0_dly;
reg              [2:0]     key1_dly;
reg				  [27:0]    counter_1;
reg				  [27:0]    counter_2;
reg				      		left_status;


//=======================================================
//  Structural coding
//=======================================================

always @(posedge CLOCK_50)
begin
	if (LEDG == 8'b11100000) left_status = 0;
	else if (LEDG == 8'b00000111) left_status = 1;
	if (counter_1 == 28'd25000000) begin
		if (left_status) LEDG[7:0] <= {LEDG[6:0],1'b0};
		else LEDG[7:0] <= {1'b0,LEDG[7:1]};
		counter_1 <= 28'd0;
//		if (counter_2 == 28'd2) begin
////			LEDG[7] <= ~LEDG[7];
//			LEDG[0] <= ~LEDG[0];
//			counter_2 <= 28'd0;	
//		end   
//		else counter_2 <= counter_2 + 28'd1;	
	end       
	else counter_1 <= counter_1 + 28'd1;
end

endmodule
