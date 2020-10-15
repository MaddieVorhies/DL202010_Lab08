`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 11:23:49 AM
// Design Name: 
// Module Name: bcd11
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


module bcd11(
   input [10:0] B,
   output [3:0] ones,
   output [3:0] tens,
   output [3:0] hundreds,
   output [3:0] thousands
);

   reg [3:0] C1_out, C2_out, C3_out, C4_out, C5_out;
   reg [3:0] C6_out, C7_out, C8_out, C9_out, C10_out;
   reg [3:0] C11_out, C12_out, C13_out, C14_out, C15_out;
   
   add3 C1 (
      .num({1'b0, B[10:8]}),
      .modnum(C1_out[3:0])
   );
   
   add3 C2 (
      .num({C1_out[2:0], B[7]}),
      .modnum(C2_out[3:0])
   );
   
   add3 C3 (
      .num({C2_out[2:0], B[6]}),
      .modnum(C3_out[3:0])
   );
   
   add3 C4 (
      .num({C3_out[2:0], B[5]}),
      .modnum(C4_out[3:0])
   );

   add3 C5 (
      .num({C4_out[2:0], B[4]}),
      .modnum(C5_out[3:0])
   );

   add3 C6 (
      .num({C5_out[2:0], B[3]}),
      .modnum(C6_out[3:0])
   );

   add3 C7 (
      .num({C6_out[2:0], B[2]}),
      .modnum(C7_out[3:0])
   );

   add3 C8 (
      .num({C7_out[2:0], B[1]}),
      .modnum(C8_out[3:0])
   );

   add3 C9 (
      .num({1'b0, C1_out[3], C2_out[3], C3_out[3]}),
      .modnum(C9_out[3:0])
   );

   add3 C10 (
      .num({C9_out[2:0], C4_out[3]}),
      .modnum(C10_out[3:0])
   );

   add3 C11 (
      .num({C10_out[2:0], C5_out[3]}),
      .modnum(C11_out[3:0])
   );
   
   add3 C12 (
      .num({C11_out[2:0], C6_out[3]}),
      .modnum(C12_out[3:0])
   );

   add3 C13 (
      .num({C12_out[2:0], C7_out[3]}),
      .modnum(C13_out[3:0])
   );

   add3 C14 (
      .num({1'b0,C9_out[3], C10_out[3], C11_out[3]}),
      .modnum(C14_out[3:0])
   );

   add3 C15 (
      .num({C14_out[2:0], C12_out[3]}),
      .modnum(C15_out[3:0])
   );

   assign ones[3:0] = {C8_out[2:0], B[0]};
   assign tens[3:0] = {C13_out[2:0], C8_out[3]};
   assign hundreds[3:0] = {C15_out[2:0], C13_out[3]};
   assign thousands[3:0] = {2'b00, C14_out[3], C15_out[3]};

endmodule
