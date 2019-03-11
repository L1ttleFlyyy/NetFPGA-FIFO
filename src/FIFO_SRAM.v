///////////////////////////////////////////////////////////////////////////////
//
// Module: FIFO_SRAM.v
// Project: NF2.1
// Description: Convertible network FIFO/SRAM
//
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module FIFO_SRAM 
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

      // cpu interface
      output [7:0]                        head_addr,
      output [7:0]                        tail_addr,
      input [DATA_WIDTH+CTRL_WIDTH-1:0]   cpu_in_data,
      input [7:0]                         cpu_in_addr,
      input                               cpu_in_wen,
      input                               cpu_in_sel,
      input                               cpu_done,
      output [DATA_WIDTH+CTRL_WIDTH-1:0]  cpu_out_data,
      output reg[1:0]                     state,

      // misc
      input                                reset,
      input                                clk
   );

   // Define the log2 function
   // `LOG2_FUNC

   //------------------------- Signals-------------------------------
   
   wire [DATA_WIDTH-1:0]         in_fifo_data_p;
   wire [CTRL_WIDTH-1:0]         in_fifo_ctrl_p;
	
   reg [DATA_WIDTH-1:0]          in_fifo_data;
   reg [CTRL_WIDTH-1:0]          in_fifo_ctrl;
   

   wire                          in_fifo_nearly_full;
   wire                          in_fifo_empty;

   reg                           in_fifo_rd_en;
   reg                           out_wr_int;

   // internal state
   reg [1:0]                     state_next;
   reg                           end_of_pkt, end_of_pkt_next;
   reg                           begin_pkt, begin_pkt_next;

   // local parameter
   parameter                     START = 2'b00;
   parameter                     PACEKT = 2'b10;
   parameter                     CPU_PROC = 2'b11;

 
   //------------------------- Local assignments -------------------------------

   assign in_rdy     = !in_fifo_nearly_full;

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
      .raddr         (head_addr),
      .waddr         (tail_addr),
		.out_sram      (cpu_out_data), // cpu in-out data
		.in_sram       (cpu_in_data), // cpu input data
		.sramwrite     (cpu_in_wen), // 0x00000100
		.sramaddr      (cpu_in_addr), 
		.cpu_sel       (cpu_in_sel) // 0x00000010
   );
   
   always @(*) begin
      state_next = state;
      in_fifo_rd_en = 0;
      end_of_pkt_next = end_of_pkt;
      begin_pkt_next = begin_pkt;
      
      case(state)
         START: begin
            if (!in_fifo_empty && out_rdy) begin
               in_fifo_rd_en = 1; 
               if (in_fifo_ctrl_p != 0) begin
                  state_next = PACEKT;
                  begin_pkt_next = 1;
                  end_of_pkt_next = 0;
               end
            end
         end

         PACEKT: begin
            if (!in_fifo_empty && out_rdy) begin
               in_fifo_rd_en = 1; 
               begin_pkt_next = 0;
               if (in_fifo_ctrl_p != 0) begin
                  state_next = CPU_PROC;
               end 
            end
         end
         
         CPU_PROC: begin //9.7
            if(cpu_done) begin
               end_of_pkt_next = 1;
               state_next = START;
            end 
         end
      endcase // case(state)
   end // always @ (*)
   
   always @(posedge clk) begin
      if(reset) begin
         state <= START;
         begin_pkt <= 0;
         end_of_pkt <= 0;
			in_fifo_ctrl <= 0;
			in_fifo_data <= 0;
      end
      else begin
         state <= state_next;
         begin_pkt <= begin_pkt_next;
         end_of_pkt <= end_of_pkt_next;
			in_fifo_ctrl <= in_fifo_ctrl_p;
			in_fifo_data <= in_fifo_data_p;
			out_wr_int <= in_fifo_rd_en; // clean up logic, the out_wr signal must have a cycle latency after in_fifo_rd_en
      end // else: !if(reset)
   end // always @ (posedge clk)   

endmodule 
