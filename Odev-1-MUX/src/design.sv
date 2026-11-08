// ============================================================================
// Modül Adı   : mux4to1
// Açıklama    : 4'e 1 Çoklayıcı (4-to-1 Multiplexer) Tasarımı
// Dil         : SystemVerilog
// ============================================================================

module mux4to1 (
    input  logic [7:0] d0, d1, d2, d3, // 8 bitlik 4 adet veri girişi
    input  logic [1:0] sel,            // 2 bitlik seçim hattı
    output logic [7:0] y               // 8 bitlik seçilen çıkış hattı
);

    // Seçim hattı veya girişler değiştiğinde çıkış anında güncellenir
    always_comb begin
        case (sel)
            2'b00:   y = d0;
            2'b01:   y = d1;
            2'b10:   y = d2;
            2'b11:   y = d3;
            default: y = 8'h00;
        endcase
    end

endmodule