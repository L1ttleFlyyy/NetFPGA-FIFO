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
   
   wire [DATA_WIDTH-1:0]         in_fifo_data_p;
   wire [CTRL_WIDTH-1:0]         in_fifo_ctrl_p;
	
   reg [DATA_WIDTH-1:0]         in_fifo_data;
   reg [CTRL_WIDTH-1:0]         in_fifo_ctrl;
   

   wire                          in_fifo_nearly_full;
   wire                          in_fifo_empty;

   reg                           in_fifo_rd_en;
   reg                           out_wr_int;

   reg			                  out_wr_int_next;
	
   // software registers 
   wire [31:0]                   ids_cmd;
   // hardware registers
   wire [31:0]                   pattern_high;
   wire [31:0]                   pattern_low;
   wire [31:0]                   matches;

   // internal state
   reg [1:0]                     state, state_next;
   reg                           in_pkt_body, in_pkt_body_next;
   reg                           end_of_pkt, end_of_pkt_next;
   reg                           begin_pkt, begin_pkt_next;
   reg [2:0]                     header_counter, header_counter_next;
   reg                           counter;

   // local parameter
   parameter                     START = 2'b00;
   parameter                     HEADER = 2'b01;
   parameter                     PAYLOAD = 2'b10;
   parameter                     CPU_PROC = 2'b11;

 
   //------------------------- Local assignments -------------------------------

   assign in_rdy     = !in_fifo_nearly_full;
   assign matches[23:16] = 8'b0;

   //------------------------- Modules-------------------------------

   fallthrough_small_fifo #(
      .WIDTH(CTRL_WIDTH+DATA_WIDTH),
      .MAX_DEPTH_BITS(2)
   ) input_fifo (
      .din           ({in_ctrl, in_data}),   // Data in
      .wr_en         (in_wr),                // Write enable
      .rd_en         (in_fifo_rd_en),        // Read the next word 
      .dout          ({in_fifo_ctrl_p, in_fifo_data_p}),
      .full          (),
      .nearly_full   (in_fifo_nearly_full),
      .empty         (in_fifo_empty),
      .reset         (reset),
      .clk           (clk)
   );

   dropfifo drop_fifo (
      .clk           (clk), 
      .fiforead      (out_rdy), 
      .fifowrite     (out_wr_int), 
      .firstword     (begin_pkt), 
      .in_fifo       ({in_fifo_ctrl,in_fifo_data}), 
      .lastword      (end_of_pkt), 
      .rst           (reset), 
      .out_fifo      ({out_ctrl,out_data}), 
      .valid_data    (out_wr),
      .raddr         (matches[7:0]),
      .waddr         (matches[15:8]),
		.out_sram      ({matches[31:24], pattern_high, pattern_low}), // cpu in-out data
		.in_sram       (72'haaaaaaaa), // cpu input data
		.sramwrite     (ids_cmd[8]), // 0x00000100
		.sramaddr      (ids_cmd[31:24]), 
		.cpu_sel      (ids_cmd[4]) // 0x00000010
   );

   generic_regs
   #( 
      .UDP_REG_SRC_WIDTH   (UDP_REG_SRC_WIDTH),
      .TAG                 (`IDS_BLOCK_ADDR),          // Tag -- eg. MODULE_TAG
      .REG_ADDR_WIDTH      (`IDS_REG_ADDR_WIDTH),     // Width of block addresses -- eg. MODULE_REG_ADDR_WIDTH
      .NUM_COUNTERS        (0),                 // Number of counters
      .NUM_SOFTWARE_REGS   (1),                 // Number of sw regs
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
      .software_regs    (ids_cmd),

      // --- HW regs interface
      .hardware_regs    ({matches,pattern_low,pattern_high}),

      .clk              (clk),
      .reset            (reset)
    );

   //------------------------- Logic-------------------------------
   
   always @(*) begin
      state_next = state;
      header_counter_next = header_counter;
      in_fifo_rd_en = 0;
      out_wr_int_next = 0;
      end_of_pkt_next = end_of_pkt;
      in_pkt_body_next = in_pkt_body;
      begin_pkt_next = begin_pkt;
      
      if (!in_fifo_empty && out_rdy) begin
         
         case(state)
            START: begin
               out_wr_int_next = 1; //9.6
               in_fifo_rd_en = 1; //9.6
               if (in_fifo_ctrl_p != 0) begin
                  state_next = HEADER;
                  begin_pkt_next = 1;
                  end_of_pkt_next = 0;   // takes matcher out of reset
               end
            end
            HEADER: begin
               out_wr_int_next = 1; //9.6
               in_fifo_rd_en = 1; //9.6
               begin_pkt_next = 0;
               if (in_fifo_ctrl_p == 0) begin
                  header_counter_next = header_counter + 1'b1;
                  if (header_counter_next == 3) begin
                    state_next = PAYLOAD;
                  end
               end
            end
            PAYLOAD: begin
               if (in_fifo_ctrl_p != 0) begin
                  state_next = CPU_PROC;
                  header_counter_next = 0;
                  out_wr_int_next = 0; //9.8
                  in_fifo_rd_en = 0; //9.8
                  in_pkt_body_next = 0;
               end else begin
                  in_fifo_rd_en = 1; //9.8
                  out_wr_int_next = 1; //9.8
                  in_pkt_body_next = 1;
               end
            end
            CPU_PROC: begin //9.7
               if(ids_cmd[0]) begin
                  end_of_pkt_next = 1;
                  state_next = START;
               end else begin
                  end_of_pkt_next = 0;
               end
            end
         endcase // case(state)
      end
   end // always @ (*)
   
   always @(posedge clk) begin
      if(reset) begin
         //matches <= 0;
         header_counter <= 0;
         state <= START;
         begin_pkt <= 0;
         end_of_pkt <= 0;
         in_pkt_body <= 0;
			in_fifo_ctrl <= 0;
			in_fifo_data <= 0;
      end
      else begin
         header_counter <= header_counter_next;
         state <= state_next;
         begin_pkt <= begin_pkt_next;
         end_of_pkt <= end_of_pkt_next;
         in_pkt_body <= in_pkt_body_next;
			in_fifo_ctrl <= in_fifo_ctrl_p;
			in_fifo_data <= in_fifo_data_p;
			out_wr_int <= out_wr_int_next;
         counter <= 0;
      end // else: !if(reset)
   end // always @ (posedge clk)   

endmodule 
