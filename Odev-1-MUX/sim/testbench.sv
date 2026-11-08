// ============================================================================
// Modül Adı   : tb_mux4to1
// Açıklama    : 4'e 1 Çoklayıcı için Testbench ve Doğrulama
// Dil         : SystemVerilog
// ============================================================================

`timescale 1ns/1ns

module tb_mux4to1;

    // Testbench sinyalleri
    logic [7:0] d0, d1, d2, d3;
    logic [1:0] sel;
    logic [7:0] y;

    // Tasarlanan modülü (DUT) test ortamına bağlıyoruz
    mux4to1 uut (
        .d0(d0), 
        .d1(d1), 
        .d2(d2), 
        .d3(d3),
        .sel(sel), 
        .y(y)
    );

    initial begin
        // EPWave dalga grafiğini kaydetmek için gereken yapılandırma
        $dumpfile("dump.vcd");
        $dumpvars(1, tb_mux4to1);

        // Girişlere ayırt edici 16'lık tabanda (hex) test değerleri atanıyor
        d0 = 8'hAA; 
        d1 = 8'hBB; 
        d2 = 8'hCC; 
        d3 = 8'hDD;

        // Senaryo 1: sel = 00 -> Beklenen çıkış: AA
        sel = 2'b00; #10;
        $display("Time: %0t | sel: %b | y: %h | Expected: aa", $time, sel, y);

        // Senaryo 2: sel = 01 -> Beklenen çıkış: BB
        sel = 2'b01; #10; 
        $display("Time: %0t | sel: %b | y: %h | Expected: bb", $time, sel, y);

        // Senaryo 3: sel = 10 -> Beklenen çıkış: CC
        sel = 2'b10; #10; 
        $display("Time: %0t | sel: %b | y: %h | Expected: cc", $time, sel, y);

        // Senaryo 4: sel = 11 -> Beklenen çıkış: DD
        sel = 2'b11; #10; 
        $display("Time: %0t | sel: %b | y: %h | Expected: dd", $time, sel, y);

        $finish;
    end

endmodule