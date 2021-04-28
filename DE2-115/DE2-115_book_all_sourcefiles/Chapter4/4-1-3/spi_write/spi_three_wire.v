// Copyright (C) 1991-2010 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions
// and other software and tools, and its AMPP partner logic
// functions, and any output files from any of the foregoing
// (including device programming or simulation files), and any
// associated documentation or information are expressly subject
// to the terms and conditions of the Altera Program License
// Subscription Agreement, Altera MegaCore Function License
// Agreement, or other applicable license agreement, including,
// without limitation, that your use is for the sole purpose of
// programming logic devices manufactured by Altera and sold by
// Altera or its authorized distributors.  Please refer to the
// applicable agreement for further details.

// Generated by Quartus II Version 10.0 Build 218 06/27/2010 SJ Full Version
// Created on Sun Aug 29 12:17:03 2010

// synthesis message_off 10175

`timescale 1ns/1ns


module spi_three_wire (
        reset,CLK,GO,bitcount, SCLK,bitcountEN,rstbitcount,LDEN,SHEN,SCEN,ORDY,SPC);

    input reset;
    input CLK;
    input GO;
    input [3:0] bitcount;
    tri0 reset;
    tri0 GO;
    tri0 [3:0] bitcount;
    output SCLK;
    output bitcountEN;
    output rstbitcount;
    output LDEN;
    output SHEN;
    output SCEN;
    output ORDY;
    output SPC;
    reg SCLK;
    reg bitcountEN;
    reg rstbitcount;
    reg LDEN;
    reg SHEN;
    reg SCEN;
    reg ORDY;
    reg [3:0] fstate;
    reg [3:0] reg_fstate;
    parameter X_IDLE=0,X_START=1,X_SHIFT=2,X_STOP=3;

    always @(posedge CLK or posedge reset)
    begin
        if (reset)
        begin
            fstate <= X_IDLE;
        end
        else
        begin
            fstate <= reg_fstate;
        end
    end
    assign SPC = SCLK ? 1 : ~CLK;
    always @(fstate or GO or bitcount)
    begin
        SCLK <= 1'b0;
        bitcountEN <= 1'b0;
        rstbitcount <= 1'b0;
        LDEN <= 1'b0;
        SHEN <= 1'b0;
        SCEN <= 1'b0;
        ORDY <= 1'b0;
        case (fstate)
            X_IDLE:
            begin
                if (GO)
                    reg_fstate <= X_START;
                else if (~(GO))
                    reg_fstate <= X_IDLE;
                // Inserting 'else' block to prevent latch inference
                else
                    reg_fstate <= X_IDLE;

                SCLK <= 1'b1;

                bitcountEN <= 1'b0;

                rstbitcount <= 1'b0;

                LDEN <= 1'b0;

                SHEN <= 1'b0;

                SCEN <= 1'b1;

                ORDY <= 1'b0;
            end
            X_START:
            begin
                reg_fstate <= X_SHIFT;

                SCLK <= 1'b1;

                bitcountEN <= 1'b0;

                rstbitcount <= 1'b0;

                LDEN <= 1'b1;

                SHEN <= 1'b0;

                SCEN <= 1'b0;

                ORDY <= 1'b0;
            end
            X_SHIFT:
            begin
                if ((bitcount[3:0] == 4'b1111))
                    reg_fstate <= X_STOP;
                else if ((bitcount[3:0] < 4'b1111))
                    reg_fstate <= X_SHIFT;
                // Inserting 'else' block to prevent latch inference
                else
                    reg_fstate <= X_SHIFT;

                SCLK <= 1'b0;
                //  SCLK <= 1'b1;
                //   SCLK <= !CLK;
                bitcountEN <= 1'b1;

                if ((bitcount[3:0] < 4'b1111))
                    rstbitcount <= 1'b0;
                else if ((bitcount[3:0] == 4'b1111))
                    rstbitcount <= 1'b1;
                // Inserting 'else' block to prevent latch inference
                else
                    rstbitcount <= 1'b0;

                LDEN <= 1'b0;

                SHEN <= 1'b1;

                SCEN <= 1'b0;

                ORDY <= 1'b0;
            end
            X_STOP:
            begin
                reg_fstate <= X_IDLE;

                SCLK <= 1'b1;

                bitcountEN <= 1'b0;

                rstbitcount <= 1'b0;

                LDEN <= 1'b0;

                SHEN <= 1'b0;

                SCEN <= 1'b1;

                ORDY <= 1'b1;
            end
            default:
            begin
                SCLK <= 1'bx;
                bitcountEN <= 1'bx;
                rstbitcount <= 1'bx;
                LDEN <= 1'bx;
                SHEN <= 1'bx;
                SCEN <= 1'bx;
                ORDY <= 1'bx;
                $display ("Reach undefined state");
            end
        endcase
    end
endmodule // spi_three_wire
