`timescale 1ns/1ps
module tb_FS_1bit;

    reg en;
    reg a;
    reg b;
    reg bin;
    wire diff;
    wire borrow;

    // Instantiate the DUT
    FS_1bit uut (
        .en(en),
        .a(a),
        .b(b),
        .bin(bin),
        .diff(diff),
        .borrow(borrow)
    );

    initial begin
        $display("en a b bin | diff borrow");
        $display("-------------------------");
        $monitor("%b  %b %b  %b   |   %b     %b", en,a,b,bin,diff,borrow);
        en = 1;
        a=0; b=0; bin=0; #10;
        a=0; b=0; bin=1; #10;
        a=0; b=1; bin=0; #10;
        a=0; b=1; bin=1; #10;
        a=1; b=0; bin=0; #10;
        a=1; b=0; bin=1; #10;
        a=1; b=1; bin=0; #10;
        a=1; b=1; bin=1; #10;
        en=0; a=1; b=1; bin=1; #10;

        $finish;
    end

endmodule