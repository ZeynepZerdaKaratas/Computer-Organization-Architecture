`timescale 1ns / 1ps

module tb_alu ();

    logic [3:0] a_test;
    logic [3:0] b_test;
    logic [1:0] islem_test;
    logic [4:0] sonuc_test;

    alu_4bit uut (
        .a(a_test),
        .b(b_test),
        .islem(islem_test),
        .sonuc(sonuc_test)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_alu);

        $monitor("Zaman = %0t ns | islem = %b | a = %b (%0d), b = %b (%0d) | sonuc = %b (%0d)", 
                 $time, islem_test, a_test, a_test, b_test, b_test, sonuc_test, sonuc_test);

        // a = 5 (0101), b = 3 (0011)
        a_test = 4'b0101; 
        b_test = 4'b0011; 
        
        // 1. Toplama (00) -> 5 + 3 = 8
        islem_test = 2'b00; #10;
        
        // 2. Çıkarma (01) -> 5 - 3 = 2
        islem_test = 2'b01; #10;
        
        // 3. AND (10)     -> 0101 & 0011 = 0001
        islem_test = 2'b10; #10;
        
        // 4. OR (11)      -> 0101 | 0011 = 0111
        islem_test = 2'b11; #10;
        
        $display("---------------------------------------------------------");
        $display("Test tamamlandi.");
        $finish;
    end

endmodule