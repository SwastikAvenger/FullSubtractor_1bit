`timescale 1ns/1ps
module FS_1bit(
    input en,       //enable
    input a,        //first input
    input b,        //second input
    input bin,      //borrow in input
    output diff,    //difference
    output borrow   //borrow output
);
    wire w1,w2,w3;
    HS_1bit hs1(
        .en(en),
        .a(a),
        .b(b),
        .diff(w1),
        .borrow(w2));
    
    HS_1bit hs2(
        .en(en),
        .a(w1),
        .b(bin),
        .diff(diff),
        .borrow(w3));

    or(borrow,w2,w3);
endmodule