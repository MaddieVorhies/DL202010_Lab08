`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 12:44:59 PM
// Design Name: 
// Module Name: an_decoder_test
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


module an_decoder_test();
   reg [1:0] in_t;
   wire [3:0] out_t;
   integer i;
   
   an_decoder dut (
      .in(in_t),
      .out(out_t)
   );
   
   initial begin 
      for(i = 2'b00; i <= 2'b11; i = i + 2'b01) begin
         in_t = i;
         #10;
      end
      $finish;   
   end

endmodule
