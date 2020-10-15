`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 12:25:26 PM
// Design Name: 
// Module Name: mux4_test
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


module mux4_test();

   localparam BITS = 16;
   
   reg [BITS-1:0] in0_t;
   reg [BITS-1:0] in1_t;
   reg [BITS-1:0] in2_t;
   reg [BITS-1:0] in3_t;
   reg sel_t;
   reg [BITS-1:0] out_t;
   
   mux4 #(.BITS(16)) dut (
      .in0(in0_t),
      .in1(in1_t),
      .in2(in2_t),
      .in3(in3_t),
      .sel(sel_t),
      .out(out_t)
   );
   
   initial begin 
      in0_t = 16'h0110 ; in1_t = 16'h1001 ; in2_t = 16'h0110 ; in3_t = 16'h1001 ; sel_t = 0; #10;
      in0_t = 16'h0110 ; in1_t = 16'h1001 ; in2_t = 16'h0110 ; in3_t = 16'h1001 ; sel_t = 1; #10;
      in0_t = 16'h0011 ; in1_t = 16'h1011 ; in2_t = 16'h0110 ; in3_t = 16'h1001 ; sel_t = 0; #10;
      in0_t = 16'h0011 ; in1_t = 16'h1011 ; in2_t = 16'h0110 ; in3_t = 16'h1001 ; sel_t = 1; #10;
      
      $finish;
   
   end
  
endmodule
