`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 12:09:07 PM
// Design Name: 
// Module Name: mux4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux4
   #(parameter BITS = 4)
   (
   input [BITS-1:0] in0,
   input [BITS-1:0] in1,
   input [BITS-1:0] in2,
   input [BITS-1:0] in3,
   input sel,
   output reg [BITS-1:0] out
   );
   
   always @*
      case (sel)
         
         2'b00: out = in0;
         2'b01: out = in1;
         2'b10: out = in2;
         default: out = in3;
         
      endcase
        
endmodule
