`timescale 1ns / 1ps

module tb_multiplier ();

    logic [3:0] A_test;
    logic [3:0] B_test;
    logic [7:0] P_test;

    // Tasarlanan çarpan modülü bağlanıyor
    multiplier_4bit uut (
        .A(A_test),
        .B(B_test),
        .P(P_test)
    );

    initial begin
        // EPWave dalga grafiği kaydı
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_multiplier);

        $monitor("Zaman = %0t ns | A = %0d, B = %0d | Carpim Sonucu (P) = %0d", 
                 $time, A_test, B_test, P_test);

        // Test 1: 5 x 3 = 15
        A_test = 4'd5;  B_test = 4'd3;  #10;

        // Test 2: 8 x 9 = 72
        A_test = 4'd8;  B_test = 4'd9;  #10;

        // Test 3: 15 x 15 = 225 (Maksimum sınır testi: 4-bit x 4-bit)
        A_test = 4'd15; B_test = 4'd15; #10;

        // Test 4: 0 x 7 = 0 (Sıfır yutucu eleman testi)
        A_test = 4'd0;  B_test = 4'd7;  #10;
        
        $display("---------------------------------------------------------");
        $display("Carpma islemi dogrulama testleri tamamlandi.");
        $finish;
    end

endmodule