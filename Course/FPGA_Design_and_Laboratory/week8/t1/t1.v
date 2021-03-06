
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
	HEX7,

	//////////// GPIO, GPIO connect to GPIO Default //////////
	GPIO 
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
output		     [8:0]		LEDG;
output		    [17:0]		LEDR;

//////////// KEY //////////
input 		     [3:0]		KEY;

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

//////////// GPIO, GPIO connect to GPIO Default //////////
inout 		    [35:0]		GPIO;

//=======================================================
//  REG/WIRE declarations
//=======================================================
wire 	clock_1MHz, clock_100ms, clock_10ms, clock_1s;  // clock signal
wire [7:0] t_hour, t_min, t_sec, key_count;
wire [7:0] a_hour, a_min, a_sec, a_count;  // two timer input
wire [7:0] b_hour, b_min, b_sec, b_count; 
wire [3:0] a_key, b_key; // two groups of keys
wire [1:0] k;
reg [31:0] num;
reg [27:0] counter_1;
wire [27:0] rst_time;


assign k = SW[1:0];
assign LEDR[1:0] = k;
//=======================================================
//  Structural coding
//=======================================================
clock_all uc (				// ?????????????????????????????????
	  .clk(CLOCK_50), 
	  .clock_1MHz(clock_1MHz),
	  .clock_100ms(clock_100ms),
	  .clock_10ms(clock_10ms),
	  .clock_1s(clock_1s)
);

clock_timer utimer (		// ???BCD?????? ????????????,???,???,??? 
		.iclk(CLOCK_50), 
		.iclk_sec(clock_1s),
		.ikey(a_key), 
		.okey_count(a_count),  // the output is useless
		.ohour(a_hour),
		.omin(a_min),
		.osec(a_sec)
);

clock_timer utimer2 (		// ???BCD?????? ????????????,???,???,??? , 0.1????????????
		.iclk(CLOCK_50), 
		.iclk_sec(clock_100ms),
		.ikey(b_key), 
		.ohour(b_hour),
		.omin(b_min),
		.osec(b_sec)
);


SEG7_LUT_8 useg(			// 8??????????????????16????????????????????????????????????
//		.iDIG({key_count, t_hour, t_min, t_sec}),
		.iDIG(num),
		.oSEG0(HEX0),
		.oSEG1(HEX1),
		.oSEG2(HEX2),
		.oSEG3(HEX3),
		.oSEG4(HEX4),
		.oSEG5(HEX5),
		.oSEG6(HEX6),
		.oSEG7(HEX7)
);


mux4_1 ucount(
		.D0(8'h01),  .D1(8'h02),  .D2(8'h03), .D3(8'h04), // mode number
		.s1(k[1]), .s0(k[0]), .Y(key_count));
mux4_1 uhour(
		.D0(a_hour), .D1(b_hour), .D2(8'hff), 
		.s1(k[1]), .s0(k[0]), .Y(t_hour));
mux4_1 umin (
		.D0(a_min),  .D1(b_min),  .D2(8'hff),  
		.s1(k[1]), .s0(k[0]), .Y(t_min));
mux4_1 usec (
		.D0(a_sec),  .D1(b_sec),  .D2(8'hff),  
		.s1(k[1]), .s0(k[0]), .Y(t_sec));

demux1_4 udemux(.D(KEY), .Y0(a_key), .Y1(b_key), .s0(k[0]));
defparam udemux.width = 4;


mux4_1 urstime (
		.D0(28'd50000000),  .D1(28'd25000000),  .D2(28'd5000000),  
		.s1(k[1]), .s0(k[0]), .Y(rst_time));
defparam urstime.width = 32;
		
always @(posedge CLOCK_50)
begin
	if (counter_1 == 0) begin
			num <= num + 1;
		counter_1 <= rst_time;
	end       
	else counter_1 <= counter_1 - 1;
end

endmodule
