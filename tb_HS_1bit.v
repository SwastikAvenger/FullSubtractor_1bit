`timescale 1ns / 1ps
module tb_HS_1bit;

//declaring test signals
    reg en,a,b;
    wire diff,borrow;
    
    //instantiating DUT
    HS_1bit dut(
        .en(en),
        .a(a),
        .b(b),
        .diff(diff),
        .borrow(borrow));
    
    //input stimulation
    initial begin
        $display("A\tB\t | Diff\tBorr");
        $monitor("%b\t%b\t | %b\t%b",a,b,diff,borrow);
        en = 0; a = 0; b = 0; #10;
        en = 1; a = 0; b = 0; #10;
        en = 1; a = 0; b = 1; #10;
        en = 1; a = 1; b = 0; #10;
        en = 1; a = 1; b = 1; #10;
        $finish;
    end
endmodule
