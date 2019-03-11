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

module ids 
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
      
      // --- Register interface
      input                               reg_req_in,
      input                               reg_ack_in,
      input                               reg_rd_wr_L_in,
      input  [`UDP_REG_ADDR_WIDTH-1:0]    reg_addr_in,
      input  [`CPCI_NF2_DATA_WIDTH-1:0]   reg_data_in,
      input  [UDP_REG_SRC_WIDTH-1:0]      reg_src_in,

      output                              reg_req_out,
      output                              reg_ack_out,
      output                              reg_rd_wr_L_out,
      output  [`UDP_REG_ADDR_WIDTH-1:0]   reg_addr_out,
      output  [`CPCI_NF2_DATA_WIDTH-1:0]  reg_data_out,
      output  [UDP_REG_SRC_WIDTH-1:0]     reg_src_out,

      // misc
      input                                reset,
      input                                clk
   );

   // Define the log2 function
   // `LOG2_FUNC

   //------------------------- Signals-------------------------------
	
   // software registers 
   wire [31:0]                   cpu_data_high;
   wire [31:0]                   cpu_data_low;
   wire [31:0]                   ids_cmd;
   
   // hardware registers
   wire [31:0]                   pattern_high;
   wire [31:0]                   pattern_low;
   wire [31:0]                   matches;
 

   generic_regs
   #( 
      .UDP_REG_SRC_WIDTH   (UDP_REG_SRC_WIDTH),
      .TAG                 (`IDS_BLOCK_ADDR),          // Tag -- eg. MODULE_TAG
      .REG_ADDR_WIDTH      (`IDS_REG_ADDR_WIDTH),     // Width of block addresses -- eg. MODULE_REG_ADDR_WIDTH
      .NUM_COUNTERS        (0),                 // Number of counters
      .NUM_SOFTWARE_REGS   (3),                 // Number of sw regs
      .NUM_HARDWARE_REGS   (3)                  // Number of hw regs
   ) module_regs (
      .reg_req_in       (reg_req_in),
      .reg_ack_in       (reg_ack_in),
      .reg_rd_wr_L_in   (reg_rd_wr_L_in),
      .reg_addr_in      (reg_addr_in),
      .reg_data_in      (reg_data_in),
      .reg_src_in       (reg_src_in),

      .reg_req_out      (reg_req_out),
      .reg_ack_out      (reg_ack_out),
      .reg_rd_wr_L_out  (reg_rd_wr_L_out),
      .reg_addr_out     (reg_addr_out),
      .reg_data_out     (reg_data_out),
      .reg_src_out      (reg_src_out),

      // --- counters interface
      .counter_updates  (),
      .counter_decrement(),

      // --- SW regs interface
      .software_regs    ({ids_cmd,cpu_data_low,cpu_data_high}),

      // --- HW regs interface
      .hardware_regs    ({matches,pattern_low,pattern_high}),

      .clk              (clk),
      .reset            (reset)
    );

   //------------------------- Logic-------------------------------
   
   FIFO_Controller
   #(
      .DATA_WIDTH(DATA_WIDTH),
      .CTRL_WIDTH(DATA_WIDTH/8),
      .UDP_REG_SRC_WIDTH(UDP_REG_SRC_WIDTH)
   ) FIFO_Controller1 (
      .in_data(in_data),
      .in_ctrl(in_ctrl),
      .in_wr(in_wr),
      .in_rdy(in_rdy),

      .out_data(out_data),
      .out_ctrl(out_ctrl),
      .out_wr(out_wr),
      .out_rdy(out_rdy),

      // cpu interface
      // .head_addr(matches[7:0]),
      // .tail_addr(matches[15:8]),
      // .cpu_in_data({8'b0, cpu_data_high, cpu_data_low}),
      // .cpu_in_addr(ids_cmd[31:24]),
      // .cpu_in_wen(ids_cmd[8]),
      // .cpu_in_sel(ids_cmd[4]),
      // .cpu_done(ids_cmd[0]),
      // .cpu_out_data({matches[31:24], pattern_high, pattern_low}),
      // .state(),

      
      // --- cpu interface
      .cpu_in_addr(ids_cmd[9:0]),
      .cpu_in_data({cpu_data_high, cpu_data_low}),
      .cpu_in_wen(ids_cmd[12]),
      .cpu_out_data({pattern_high, pattern_low}),

      // misc
      .reset(reset),
      .clk(clk)
   );

endmodule 
