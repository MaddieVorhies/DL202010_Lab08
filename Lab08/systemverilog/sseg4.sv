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
    
    wire [15:0] bcd11_out;
    wire [15:0] out_mux2;
    wire [3:0] mux4out;
    wire [6:0] dec_out;
    wire [3:0] andec_out;
    wire mux2_sel;
    
    bcd11 bcd (
       .B(data[10:0]),
       .ones(bcd11_out[3:0]),
       .tens(bcd11_out[7:4]),
       .hundreds(bcd11_out[11:8]),
       .thousands(bcd11_out[15:12])
    );
    
    mux2 #(.BITS(16)) mux2_0 (
       .in1(data[15:0]), 
       .in0(bcd11_out[15:0]),
       .out(out_mux2[15:0]),
       .sel(hex_dec)
   );
   
   mux4 #(.BITS(16)) mux4_0 (
      .sel(digit_sel[1:0]),
      .out(mux4out[3:0]),
      .in3(out_mux2[15:12]),
      .in2(out_mux2[11:8]),
      .in1(out_mux2[7:4]),
      .in0(out_mux2[3:0])
   );
   
   sseg_decoder sseg_dec ( 
      .num(mux4out[3:0]), 
      .sseg(dec_out[6:0])
   );
   
   assign mux2_sel = sign & ~andec_out[3];
   assign an = andec_out;
   assign dp = 1'b1;
   
   mux2 #(.BITS(16)) mux2_1 (
      .in1(7'b0111111), 
      .in0(dec_out[6:0]), 
      .sel(mux2_sel),
      .out(seg[6:0])
   );
   
   an_decoder an_dec (
      .in(digit_sel[1:0]), 
      .out(andec_out[3:0])
   ); 
    
endmodule
