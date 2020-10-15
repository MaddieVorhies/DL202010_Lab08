`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 11:18:59 AM
// Design Name: 
// Module Name: sseg_decoder
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


module add3 (
   input [3:0] num ,
   reg [3:0] modnum
);

   always @*
   
      if ( num > 4)
         modnum = num + 3;
      else
         modnum = num ;
         
endmodule