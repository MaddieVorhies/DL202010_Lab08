`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 11:47:13 AM
// Design Name: 
// Module Name: mux2_test
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


module mux2_test();

   localparam BITS = 16;

   reg [BITS-1:0] in0_t;
   reg [BITS-1:0] in1_t;
   reg sel_t;
   wire [BITS-1:0] out_t;

   mux2 #(.BITS(16)) dut (
      .in0(in0_t),
      .in1(in1_t),
      .sel(sel_t),
      .out(out_t)
   );
   
   initial begin
   
      in0_t = 16'h0110 ; in1_t = 16'h1001 ; sel_t = 0; #10;
      in0_t = 16'h0110 ; in1_t = 16'h1001 ; sel_t = 1; #10;
      in0_t = 16'h0011 ; in1_t = 16'h1011 ; sel_t = 0; #10;
      in0_t = 16'h0011 ; in1_t = 16'h1011 ; sel_t = 1; #10;
      
      $finish;
      
   end

endmodule
