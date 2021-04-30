// megafunction wizard: %FIFO%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: dcfifo_mixed_widths 

// ============================================================
// File Name: Sdram_WR_FIFO.v
// Megafunction Name(s):
// 			dcfifo_mixed_widths
//
// Simulation Library Files(s):
// 			altera_mf
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.1 Build 350 03/24/2010 SP 2 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2010 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module Sdram_WR_FIFO (
	aclr,
	data,
	rdclk,
	rdreq,
	wrclk,
	wrreq,
	q,
	rdusedw);

	input	  aclr;
	input	[15:0]  data;
	input	  rdclk;
	input	  rdreq;
	input	  wrclk;
	input	  wrreq;
	output	[31:0]  q;
	output	[7:0]  rdusedw;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0	  aclr;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire [31:0] sub_wire0;
	wire [7:0] sub_wire1;
	wire [31:0] q = sub_wire0[31:0];
	wire [7:0] rdusedw = sub_wire1[7:0];

	dcfifo_mixed_widths	dcfifo_mixed_widths_component (
				.wrclk (wrclk),
				.rdreq (rdreq),
				.aclr (aclr),
				.rdclk (rdclk),
				.wrreq (wrreq),
				.data (data),
				.q (sub_wire0),
				.rdusedw (sub_wire1)
				// synopsys translate_off
				,
				.rdempty (),
				.rdfull (),
				.wrempty (),
				.wrfull (),
				.wrusedw ()
				// synopsys translate_on
				);
	defparam
		dcfifo_mixed_widths_component.intended_device_family = "Cyclone IV E",
		dcfifo_mixed_widths_component.lpm_numwords = 512,
		dcfifo_mixed_widths_component.lpm_showahead = "OFF",
		dcfifo_mixed_widths_component.lpm_type = "dcfifo",
		dcfifo_mixed_widths_component.lpm_width = 16,
		dcfifo_mixed_widths_component.lpm_widthu = 9,
		dcfifo_mixed_widths_component.lpm_widthu_r = 8,
		dcfifo_mixed_widths_component.lpm_width_r = 32,
		dcfifo_mixed_widths_component.overflow_checking = "ON",
		dcfifo_mixed_widths_component.rdsync_delaypipe = 4,
		dcfifo_mixed_widths_component.underflow_checking = "ON",
		dcfifo_mixed_widths_component.use_eab = "ON",
		dcfifo_mixed_widths_component.write_aclr_synch = "ON",
		dcfifo_mixed_widths_component.wrsync_delaypipe = 4;


endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: AlmostEmpty NUMERIC "0"
// Retrieval info: PRIVATE: AlmostEmptyThr NUMERIC "-1"
// Retrieval info: PRIVATE: AlmostFull NUMERIC "0"
// Retrieval info: PRIVATE: AlmostFullThr NUMERIC "-1"
// Retrieval info: PRIVATE: CLOCKS_ARE_SYNCHRONIZED NUMERIC "0"
// Retrieval info: PRIVATE: Clock NUMERIC "4"
// Retrieval info: PRIVATE: Depth NUMERIC "512"
// Retrieval info: PRIVATE: Empty NUMERIC "1"
// Retrieval info: PRIVATE: Full NUMERIC "1"
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: PRIVATE: LE_BasedFIFO NUMERIC "0"
// Retrieval info: PRIVATE: LegacyRREQ NUMERIC "1"
// Retrieval info: PRIVATE: MAX_DEPTH_BY_9 NUMERIC "0"
// Retrieval info: PRIVATE: OVERFLOW_CHECKING NUMERIC "0"
// Retrieval info: PRIVATE: Optimize NUMERIC "1"
// Retrieval info: PRIVATE: RAM_BLOCK_TYPE NUMERIC "0"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: UNDERFLOW_CHECKING NUMERIC "0"
// Retrieval info: PRIVATE: UsedW NUMERIC "1"
// Retrieval info: PRIVATE: Width NUMERIC "16"
// Retrieval info: PRIVATE: dc_aclr NUMERIC "1"
// Retrieval info: PRIVATE: diff_widths NUMERIC "1"
// Retrieval info: PRIVATE: msb_usedw NUMERIC "0"
// Retrieval info: PRIVATE: output_width NUMERIC "32"
// Retrieval info: PRIVATE: rsEmpty NUMERIC "0"
// Retrieval info: PRIVATE: rsFull NUMERIC "0"
// Retrieval info: PRIVATE: rsUsedW NUMERIC "1"
// Retrieval info: PRIVATE: sc_aclr NUMERIC "0"
// Retrieval info: PRIVATE: sc_sclr NUMERIC "0"
// Retrieval info: PRIVATE: wsEmpty NUMERIC "0"
// Retrieval info: PRIVATE: wsFull NUMERIC "0"
// Retrieval info: PRIVATE: wsUsedW NUMERIC "0"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
// Retrieval info: CONSTANT: LPM_NUMWORDS NUMERIC "512"
// Retrieval info: CONSTANT: LPM_SHOWAHEAD STRING "OFF"
// Retrieval info: CONSTANT: LPM_TYPE STRING "dcfifo"
// Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "16"
// Retrieval info: CONSTANT: LPM_WIDTHU NUMERIC "9"
// Retrieval info: CONSTANT: LPM_WIDTHU_R NUMERIC "8"
// Retrieval info: CONSTANT: LPM_WIDTH_R NUMERIC "32"
// Retrieval info: CONSTANT: OVERFLOW_CHECKING STRING "ON"
// Retrieval info: CONSTANT: RDSYNC_DELAYPIPE NUMERIC "4"
// Retrieval info: CONSTANT: UNDERFLOW_CHECKING STRING "ON"
// Retrieval info: CONSTANT: USE_EAB STRING "ON"
// Retrieval info: CONSTANT: WRITE_ACLR_SYNCH STRING "ON"
// Retrieval info: CONSTANT: WRSYNC_DELAYPIPE NUMERIC "4"
// Retrieval info: USED_PORT: aclr 0 0 0 0 INPUT GND aclr
// Retrieval info: USED_PORT: data 0 0 16 0 INPUT NODEFVAL data[15..0]
// Retrieval info: USED_PORT: q 0 0 32 0 OUTPUT NODEFVAL q[31..0]
// Retrieval info: USED_PORT: rdclk 0 0 0 0 INPUT NODEFVAL rdclk
// Retrieval info: USED_PORT: rdreq 0 0 0 0 INPUT NODEFVAL rdreq
// Retrieval info: USED_PORT: rdusedw 0 0 8 0 OUTPUT NODEFVAL rdusedw[7..0]
// Retrieval info: USED_PORT: wrclk 0 0 0 0 INPUT NODEFVAL wrclk
// Retrieval info: USED_PORT: wrreq 0 0 0 0 INPUT NODEFVAL wrreq
// Retrieval info: CONNECT: @data 0 0 16 0 data 0 0 16 0
// Retrieval info: CONNECT: q 0 0 32 0 @q 0 0 32 0
// Retrieval info: CONNECT: @wrreq 0 0 0 0 wrreq 0 0 0 0
// Retrieval info: CONNECT: @rdreq 0 0 0 0 rdreq 0 0 0 0
// Retrieval info: CONNECT: @rdclk 0 0 0 0 rdclk 0 0 0 0
// Retrieval info: CONNECT: @wrclk 0 0 0 0 wrclk 0 0 0 0
// Retrieval info: CONNECT: rdusedw 0 0 8 0 @rdusedw 0 0 8 0
// Retrieval info: CONNECT: @aclr 0 0 0 0 aclr 0 0 0 0
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_WR_FIFO.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_WR_FIFO.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_WR_FIFO.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_WR_FIFO.bsf TRUE FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_WR_FIFO_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_WR_FIFO_bb.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_WR_FIFO_waveforms.html FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL Sdram_WR_FIFO_wave*.jpg FALSE
// Retrieval info: LIB_FILE: altera_mf
