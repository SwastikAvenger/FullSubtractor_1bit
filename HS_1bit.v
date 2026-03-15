`timescale 1ns / 1ps 
module HS_1bit(
    input en,
    input a,
    input b,
    output diff,
    output borrow
    );
    
    assign diff = en ? (a^b ): 1'b0;
    assign borrow = en ? ((!a)&b) : 1'b0;
endmodule
