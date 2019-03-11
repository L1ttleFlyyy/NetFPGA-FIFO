////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2008 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____ 
//  /   /\/   / 
// /___/  \  /    Vendor: Xilinx 
// \   \   \/     Version : 10.1.03
//  \   \         Application : sch2verilog
//  /   /         Filename : dropfifo.vf
// /___/   /\     Timestamp : 03/10/2019 19:38:43
// \   \  /  \ 
//  \___\/\___\ 
//
//Command: C:\Xilinx\10.1\ISE\bin\nt\unwrapped\sch2verilog.exe -intstyle ise -family virtex2p -w C:/ISE_projects/FIFOWrapper/dropfifo.sch dropfifo.vf
//Design Name: dropfifo
//Device: virtex2p
//Purpose:
//    This verilog netlist is translated from an ECS schematic.It can be 
//    synthesized and simulated, but it should not be modified. 
//
`timescale 1ns / 1ps

module FTCE_MXILINX_dropfifo(C, 
                             CE, 
                             CLR, 
                             T, 
                             Q);

    input C;
    input CE;
    input CLR;
    input T;
   output Q;
   
   wire TQ;
   wire Q_DUMMY;
   
   assign Q = Q_DUMMY;
   XOR2 I_36_32 (.I0(T), 
                 .I1(Q_DUMMY), 
                 .O(TQ));
   FDCE I_36_35 (.C(C), 
                 .CE(CE), 
                 .CLR(CLR), 
                 .D(TQ), 
                 .Q(Q_DUMMY));
   // synthesis attribute RLOC of I_36_35 is "X0Y0"
   defparam I_36_35.INIT = 1'b0;
endmodule
`timescale 1ns / 1ps

module CB8CE_MXILINX_dropfifo(C, 
                              CE, 
                              CLR, 
                              CEO, 
                              Q, 
                              TC);

    input C;
    input CE;
    input CLR;
   output CEO;
   output [7:0] Q;
   output TC;
   
   wire T2;
   wire T3;
   wire T4;
   wire T5;
   wire T6;
   wire T7;
   wire XLXN_1;
   wire [7:0] Q_DUMMY;
   wire TC_DUMMY;
   
   assign Q[7:0] = Q_DUMMY[7:0];
   assign TC = TC_DUMMY;
   FTCE_MXILINX_dropfifo I_Q0 (.C(C), 
                               .CE(CE), 
                               .CLR(CLR), 
                               .T(XLXN_1), 
                               .Q(Q_DUMMY[0]));
   // synthesis attribute HU_SET of I_Q0 is "I_Q0_6"
   FTCE_MXILINX_dropfifo I_Q1 (.C(C), 
                               .CE(CE), 
                               .CLR(CLR), 
                               .T(Q_DUMMY[0]), 
                               .Q(Q_DUMMY[1]));
   // synthesis attribute HU_SET of I_Q1 is "I_Q1_7"
   FTCE_MXILINX_dropfifo I_Q2 (.C(C), 
                               .CE(CE), 
                               .CLR(CLR), 
                               .T(T2), 
                               .Q(Q_DUMMY[2]));
   // synthesis attribute HU_SET of I_Q2 is "I_Q2_3"
   FTCE_MXILINX_dropfifo I_Q3 (.C(C), 
                               .CE(CE), 
                               .CLR(CLR), 
                               .T(T3), 
                               .Q(Q_DUMMY[3]));
   // synthesis attribute HU_SET of I_Q3 is "I_Q3_4"
   FTCE_MXILINX_dropfifo I_Q4 (.C(C), 
                               .CE(CE), 
                               .CLR(CLR), 
                               .T(T4), 
                               .Q(Q_DUMMY[4]));
   // synthesis attribute HU_SET of I_Q4 is "I_Q4_5"
   FTCE_MXILINX_dropfifo I_Q5 (.C(C), 
                               .CE(CE), 
                               .CLR(CLR), 
                               .T(T5), 
                               .Q(Q_DUMMY[5]));
   // synthesis attribute HU_SET of I_Q5 is "I_Q5_2"
   FTCE_MXILINX_dropfifo I_Q6 (.C(C), 
                               .CE(CE), 
                               .CLR(CLR), 
                               .T(T6), 
                               .Q(Q_DUMMY[6]));
   // synthesis attribute HU_SET of I_Q6 is "I_Q6_1"
   FTCE_MXILINX_dropfifo I_Q7 (.C(C), 
                               .CE(CE), 
                               .CLR(CLR), 
                               .T(T7), 
                               .Q(Q_DUMMY[7]));
   // synthesis attribute HU_SET of I_Q7 is "I_Q7_0"
   AND5 I_36_1 (.I0(Q_DUMMY[7]), 
                .I1(Q_DUMMY[6]), 
                .I2(Q_DUMMY[5]), 
                .I3(Q_DUMMY[4]), 
                .I4(T4), 
                .O(TC_DUMMY));
   AND2 I_36_2 (.I0(Q_DUMMY[4]), 
                .I1(T4), 
                .O(T5));
   AND3 I_36_11 (.I0(Q_DUMMY[5]), 
                 .I1(Q_DUMMY[4]), 
                 .I2(T4), 
                 .O(T6));
   AND4 I_36_15 (.I0(Q_DUMMY[3]), 
                 .I1(Q_DUMMY[2]), 
                 .I2(Q_DUMMY[1]), 
                 .I3(Q_DUMMY[0]), 
                 .O(T4));
   VCC I_36_16 (.P(XLXN_1));
   AND2 I_36_24 (.I0(Q_DUMMY[1]), 
                 .I1(Q_DUMMY[0]), 
                 .O(T2));
   AND3 I_36_26 (.I0(Q_DUMMY[2]), 
                 .I1(Q_DUMMY[1]), 
                 .I2(Q_DUMMY[0]), 
                 .O(T3));
   AND4 I_36_28 (.I0(Q_DUMMY[6]), 
                 .I1(Q_DUMMY[5]), 
                 .I2(Q_DUMMY[4]), 
                 .I3(T4), 
                 .O(T7));
   AND2 I_36_31 (.I0(CE), 
                 .I1(TC_DUMMY), 
                 .O(CEO));
endmodule
`timescale 1ns / 1ps

module COMP8_MXILINX_dropfifo(A, 
                              B, 
                              EQ);

    input [7:0] A;
    input [7:0] B;
   output EQ;
   
   wire AB0;
   wire AB1;
   wire AB2;
   wire AB3;
   wire AB4;
   wire AB5;
   wire AB6;
   wire AB7;
   wire AB03;
   wire AB47;
   
   AND4 I_36_32 (.I0(AB7), 
                 .I1(AB6), 
                 .I2(AB5), 
                 .I3(AB4), 
                 .O(AB47));
   XNOR2 I_36_33 (.I0(B[6]), 
                  .I1(A[6]), 
                  .O(AB6));
   XNOR2 I_36_34 (.I0(B[7]), 
                  .I1(A[7]), 
                  .O(AB7));
   XNOR2 I_36_35 (.I0(B[5]), 
                  .I1(A[5]), 
                  .O(AB5));
   XNOR2 I_36_36 (.I0(B[4]), 
                  .I1(A[4]), 
                  .O(AB4));
   AND4 I_36_41 (.I0(AB3), 
                 .I1(AB2), 
                 .I2(AB1), 
                 .I3(AB0), 
                 .O(AB03));
   XNOR2 I_36_42 (.I0(B[2]), 
                  .I1(A[2]), 
                  .O(AB2));
   XNOR2 I_36_43 (.I0(B[3]), 
                  .I1(A[3]), 
                  .O(AB3));
   XNOR2 I_36_44 (.I0(B[1]), 
                  .I1(A[1]), 
                  .O(AB1));
   XNOR2 I_36_45 (.I0(B[0]), 
                  .I1(A[0]), 
                  .O(AB0));
   AND2 I_36_50 (.I0(AB47), 
                 .I1(AB03), 
                 .O(EQ));
endmodule
`timescale 1ns / 1ps

module FD8CE_MXILINX_dropfifo(C, 
                              CE, 
                              CLR, 
                              D, 
                              Q);

    input C;
    input CE;
    input CLR;
    input [7:0] D;
   output [7:0] Q;
   
   
   FDCE I_Q0 (.C(C), 
              .CE(CE), 
              .CLR(CLR), 
              .D(D[0]), 
              .Q(Q[0]));
   defparam I_Q0.INIT = 1'b0;
   FDCE I_Q1 (.C(C), 
              .CE(CE), 
              .CLR(CLR), 
              .D(D[1]), 
              .Q(Q[1]));
   defparam I_Q1.INIT = 1'b0;
   FDCE I_Q2 (.C(C), 
              .CE(CE), 
              .CLR(CLR), 
              .D(D[2]), 
              .Q(Q[2]));
   defparam I_Q2.INIT = 1'b0;
   FDCE I_Q3 (.C(C), 
              .CE(CE), 
              .CLR(CLR), 
              .D(D[3]), 
              .Q(Q[3]));
   defparam I_Q3.INIT = 1'b0;
   FDCE I_Q4 (.C(C), 
              .CE(CE), 
              .CLR(CLR), 
              .D(D[4]), 
              .Q(Q[4]));
   defparam I_Q4.INIT = 1'b0;
   FDCE I_Q5 (.C(C), 
              .CE(CE), 
              .CLR(CLR), 
              .D(D[5]), 
              .Q(Q[5]));
   defparam I_Q5.INIT = 1'b0;
   FDCE I_Q6 (.C(C), 
              .CE(CE), 
              .CLR(CLR), 
              .D(D[6]), 
              .Q(Q[6]));
   defparam I_Q6.INIT = 1'b0;
   FDCE I_Q7 (.C(C), 
              .CE(CE), 
              .CLR(CLR), 
              .D(D[7]), 
              .Q(Q[7]));
   defparam I_Q7.INIT = 1'b0;
endmodule
`timescale 1ns / 1ps

module dropfifo(clk, 
                cpu_sel, 
                fiforead, 
                fifowrite, 
                firstword, 
                in_fifo, 
                in_sram, 
                lastword, 
                rst, 
                sramaddr, 
                sramwrite, 
                out_fifo, 
                out_sram, 
                raddr, 
                valid_data, 
                waddr);

    input clk;
    input cpu_sel;
    input fiforead;
    input fifowrite;
    input firstword;
    input [71:0] in_fifo;
    input [71:0] in_sram;
    input lastword;
    input rst;
    input [7:0] sramaddr;
    input sramwrite;
   output [71:0] out_fifo;
   output [71:0] out_sram;
   output [7:0] raddr;
   output valid_data;
   output [7:0] waddr;
   
   wire XLXN_5;
   wire XLXN_7;
   wire [7:0] XLXN_12;
   wire XLXN_17;
   wire XLXN_19;
   wire XLXN_21;
   wire XLXN_45;
   wire XLXN_46;
   wire XLXN_134;
   wire [71:0] XLXN_159;
   wire [7:0] XLXN_204;
   wire [71:0] XLXN_205;
   wire [0:0] XLXN_207;
   wire [71:0] XLXN_208;
   wire [0:0] XLXN_209;
   wire [7:0] raddr_DUMMY;
   wire [7:0] waddr_DUMMY;
   
   assign XLXN_208 = 4'h0;
   assign raddr[7:0] = raddr_DUMMY[7:0];
   assign waddr[7:0] = waddr_DUMMY[7:0];
   CB8CE_MXILINX_dropfifo XLXI_2 (.C(clk), 
                                  .CE(XLXN_134), 
                                  .CLR(rst), 
                                  .CEO(), 
                                  .Q(raddr_DUMMY[7:0]), 
                                  .TC());
   // synthesis attribute HU_SET of XLXI_2 is "XLXI_2_12"
   dualportmem9B XLXI_3 (.addra(XLXN_204[7:0]), 
                         .addrb(raddr_DUMMY[7:0]), 
                         .clka(clk), 
                         .clkb(clk), 
                         .dina(XLXN_205[71:0]), 
                         .dinb(XLXN_208[71:0]), 
                         .wea(XLXN_207[0]), 
                         .web(XLXN_209[0]), 
                         .douta(out_sram[71:0]), 
                         .doutb(out_fifo[71:0]));
   reg9B XLXI_4 (.ce(XLXN_17), 
                 .clk(clk), 
                 .clr(rst), 
                 .d(in_fifo[71:0]), 
                 .q(XLXN_159[71:0]));
   COMP8_MXILINX_dropfifo XLXI_5 (.A(waddr_DUMMY[7:0]), 
                                  .B(raddr_DUMMY[7:0]), 
                                  .EQ(XLXN_5));
   // synthesis attribute HU_SET of XLXI_5 is "XLXI_5_11"
   COMP8_MXILINX_dropfifo XLXI_6 (.A(raddr_DUMMY[7:0]), 
                                  .B(XLXN_12[7:0]), 
                                  .EQ(XLXN_7));
   // synthesis attribute HU_SET of XLXI_6 is "XLXI_6_8"
   AND3B2 XLXI_7 (.I0(XLXN_7), 
                  .I1(XLXN_5), 
                  .I2(fiforead), 
                  .O(XLXN_134));
   FD8CE_MXILINX_dropfifo XLXI_8 (.C(clk), 
                                  .CE(XLXN_45), 
                                  .CLR(rst), 
                                  .D(waddr_DUMMY[7:0]), 
                                  .Q(XLXN_12[7:0]));
   // synthesis attribute HU_SET of XLXI_8 is "XLXI_8_10"
   VCC XLXI_9 (.P(XLXN_17));
   FD XLXI_10 (.C(clk), 
               .D(fifowrite), 
               .Q(XLXN_19));
   defparam XLXI_10.INIT = 1'b0;
   FD XLXI_12 (.C(clk), 
               .D(firstword), 
               .Q(XLXN_21));
   defparam XLXI_12.INIT = 1'b0;
   FD XLXI_13 (.C(clk), 
               .D(lastword), 
               .Q(XLXN_46));
   defparam XLXI_13.INIT = 1'b0;
   OR2 XLXI_14 (.I0(XLXN_46), 
                .I1(XLXN_21), 
                .O(XLXN_45));
   FDC XLXI_50 (.C(clk), 
                .CLR(rst), 
                .D(XLXN_134), 
                .Q(valid_data));
   defparam XLXI_50.INIT = 1'b0;
   CB8CE_MXILINX_dropfifo XLXI_52 (.C(clk), 
                                   .CE(XLXN_19), 
                                   .CLR(rst), 
                                   .CEO(), 
                                   .Q(waddr_DUMMY[7:0]), 
                                   .TC());
   // synthesis attribute HU_SET of XLXI_52 is "XLXI_52_9"
   mux72 XLXI_53 (.I0(XLXN_159[71:0]), 
                  .I1(in_sram[71:0]), 
                  .S(cpu_sel), 
                  .O(XLXN_205[71:0]));
   MUXCY XLXI_55 (.CI(sramwrite), 
                  .DI(XLXN_19), 
                  .S(cpu_sel), 
                  .O(XLXN_207[0]));
   mux8 XLXI_70 (.I0(waddr_DUMMY[7:0]), 
                 .I1(sramaddr[7:0]), 
                 .S(cpu_sel), 
                 .O(XLXN_204[7:0]));
   GND XLXI_71 (.G(XLXN_209[0]));
endmodule
