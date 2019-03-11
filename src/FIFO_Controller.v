///////////////////////////////////////////////////////////////////////////////
// vim:set shiftwidth=3 softtabstop=3 expandtab:
// $Id: module_template 2008-03-13 gac1 $
//
// Module: ids.v
// Project: NF2.1
// Description: Defines a simple ids module for the user data path.  The
// modules reads a 64-bit register that contains a pattern to match and
// counts how many packets match.  The register contents are 7 bytes of
// pattern and one byte of mask.  The mask bits are set to one for each
// byte of the pattern that should be included in the mask -- zero bits
// mean "don't care".
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module FIFO_Controller 
   #(
      parameter DATA_WIDTH = 64,
      parameter CTRL_WIDTH = DATA_WIDTH/8,
      parameter UDP_REG_SRC_WIDTH = 2
   )
   (
      input  [DATA_WIDTH-1:0]             in_data,
      input  [CTRL_WIDTH-1:0]             in_ctrl,
      input                               in_wr,
      output                              in_rdy,

      output [DATA_WIDTH-1:0]             out_data,
      output [CTRL_WIDTH-1:0]             out_ctrl,
      output                              out_wr,
      input                               out_rdy,
      
      // --- cpu interface
      input [9:0]                         cpu_in_addr,
      input [63:0]                        cpu_in_data,
      input                               cpu_in_wen,
      output reg[63:0]                    cpu_out_data,

      // misc
      input                                reset,
      input                                clk
   );
   wire[1:0] state;

   wire packet_rdy;
   wire cpu_in_sel;
   wire [7:0] head_addr, tail_addr;
   wire [71:0] sram_out_data;
   
   reg cpu_done;

   //------------------------- Logics--------------------------------

   always@(posedge clk) begin
      if(reset) begin
         cpu_done <= 0;
      end else begin
         // 768: cpu_done
         if (cpu_in_wen&&(cpu_in_addr[9:8]==2'b11)&&(cpu_in_addr[1:0]==2'b00)) begin
            cpu_done <= 1;
         end else begin
            cpu_done <= 0;
         end
      end
   end

   //------------------------- Signals-------------------------------
   assign packet_rdy = (state == 2'b11);
   assign cpu_in_sel = (cpu_in_addr[9:8] == 2'b10);

   always@(*)begin
      if(~cpu_in_wen) begin
         if (cpu_in_addr[9:8]==2'b11) begin
            case(cpu_in_addr[1:0])
               2'b01: // packet_rdy 769
                  cpu_out_data = {63'b0, packet_rdy};
               2'b10: // head_addr 770
                  cpu_out_data = {56'b0, head_addr};
               2'b11: // tail_addr 771
                  cpu_out_data = {56'b0, tail_addr};
               default:
                  cpu_out_data = 0;
            endcase
         end else if (cpu_in_addr[9:8]==2'b10) begin
            cpu_out_data = sram_out_data[63:0];
         end else begin
            cpu_out_data = 0;
         end
      end else begin
         cpu_out_data = 0;
      end
   end

   FIFO_SRAM
   #(
      .DATA_WIDTH(DATA_WIDTH),
      .CTRL_WIDTH(DATA_WIDTH/8),
      .UDP_REG_SRC_WIDTH(UDP_REG_SRC_WIDTH)
   ) FIFO_SRAM1 (
      .in_data(in_data),
      .in_ctrl(in_ctrl),
      .in_wr(in_wr),
      .in_rdy(in_rdy),

      .out_data(out_data),
      .out_ctrl(out_ctrl),
      .out_wr(out_wr),
      .out_rdy(out_rdy),

      // cpu interface
      .head_addr(head_addr),
      .tail_addr(tail_addr),
      .cpu_in_data({8'b0, cpu_in_data}),
      .cpu_in_addr(cpu_in_addr[7:0]),
      .cpu_in_wen(cpu_in_sel & cpu_in_wen),
      .cpu_in_sel(cpu_in_sel),
      .cpu_done(cpu_done),
      .cpu_out_data(sram_out_data),
      .state(state),

      // misc
      .reset(reset),
      .clk(clk)
   );

endmodule 
