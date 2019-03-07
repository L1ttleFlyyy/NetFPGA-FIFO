`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:57 03/06/2019 
// Design Name: 
// Module Name:    mux72 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mux72(
    input [71:0] I0,
    input [71:0] I1,
    input S,
    output [71:0] O
    );
	
	assign O = S?I1:I0;

endmodule
