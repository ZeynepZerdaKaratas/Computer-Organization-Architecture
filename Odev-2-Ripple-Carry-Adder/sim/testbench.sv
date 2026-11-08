// ============================================================================
// Modül Adı   : tb_adder_4bit
// Açıklama    : 4-Bit Ripple Carry Adder Testbench ve Simülasyonu
// Dil         : SystemVerilog
// ============================================================================

`timescale 1ns / 1ps

module tb_adder_4bit;

    logic [3:0] A, B;
    logic Cin;
    logic [3:0] Sum;
    logic Cout;

    // DUT bağlantısı
    adder_4bit uut (
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum), .Cout(Cout)
    );

    initial begin
        // EPWave dalga grafiği kaydı
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_adder_4bit);

        $monitor("Zaman: %0t ns | Girisler: A = %0d, B = %0d, Cin = %b | Cikislar: Sum = %0d, Cout = %b", 
                 $time, A, B, Cin, Sum, Cout);
        
        // Başlangıç durumu
        A = 0; B = 0; Cin = 0;
        #10;
        
        // Test 1: 5 + 3 = 8
        A = 5; B = 3; Cin = 0;
        #10;
        
        // Test 2: 15 + 1 = 16 (Sum = 0, Cout = 1)
        A = 15; B = 1; Cin = 0;
        #10;
        
        // Test 3: 10 + 10 + 1 = 21 (Sum = 5, Cout = 1)
        A = 10; B = 10; Cin = 1;
        #10;

        $display("---------------------------------------------------------");
        $display("Test tamamlandi.");
        $finish; 
    end

endmodule