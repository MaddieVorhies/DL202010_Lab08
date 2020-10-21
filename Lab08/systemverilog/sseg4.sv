`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 01:05:29 PM
// Design Name: 
// Module Name: sseg4
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


module sseg4(
    input [15:0] data,
    input hex_dec,
    input sign,
    input [1:0] digit_sel,
    output [6:0] seg,
    input dp,
    input [3:0] an
    );
    
    wire [15:0] in0_mux2;
    wire [15:0] out_mux2;
    wire [3:0] in;
    wire [6:0] in0_1;
    reg [6:0] in1_1;
    wire and_out;
    
    bcd11 bcd (
       .B(data[10:0]),
       .ones(in0_mux2[3:0]),
       .tens(in0_mux2[7:4]),
       .hundreds(in0_mux2[11:8]),
       .thousands(in0_mux2[15:12])
    );
    
    mux2 mux2_0 (
       .in1(data[15:0]), 
       .in0({thousands, hundreds, tens, ones}),
       .out(out_mux2[15:0]),
       .sel(hex_dec)
   );
   
   mux4 mux4_0 (
      .sel(digit_sel[1:0]),
      .out(in[3:0]),
      .in3(out_mux2[15:12]),
      .in2(out_mux2[11:8]),
      .in1(out_mux2[7:4]),
      .in0(out_mux2[3:0])
   );
   
   sseg_decoder sseg_dec ( 
      .num(in[3:0]), 
      .sseg(in0_1[6:0])
   );
   
   mux2 mux2_1 (
      .in1(in1_1[6:0]), 
      .in0(in0_1[6:0]), 
      .sel(and_out),
      .out(seg[6:0])
   );
   
   an_decoder an_dec (
      .in(digit_sel[1:0]), 
      .out(an[3:0])
   );
    
   assign and_out = sign & ~an[3];
   assign dp = 1'b1;
   assign in1_1[6:0] = 7'b0111111;
   
    
    
    
endmodule
