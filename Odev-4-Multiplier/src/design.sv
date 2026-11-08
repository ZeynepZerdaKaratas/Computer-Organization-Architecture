// ============================================================================
// Modül Adı   : full_adder, adder_4bit, multiplier_4bit
// Açıklama    : 4-Bit Dizi Çarpanı (Array Multiplier) Tasarımı
// Dil         : SystemVerilog
// ============================================================================

// 1-Bit Full Adder
module full_adder (
    input  logic a, b, cin,
    output logic sum, cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));
endmodule

// 4-Bit Ripple Carry Adder
module adder_4bit (
    input  logic [3:0] a, b,
    input  logic cin,
    output logic [3:0] sum,
    output logic cout
);
    logic c1, c2, c3;
    full_adder fa0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c1));
    full_adder fa1 (.a(a[1]), .b(b[1]), .cin(c1),  .sum(sum[1]), .cout(c2));
    full_adder fa2 (.a(a[2]), .b(b[2]), .cin(c2),  .sum(sum[2]), .cout(c3));
    full_adder fa3 (.a(a[3]), .b(b[3]), .cin(c3),  .sum(sum[3]), .cout(cout));
endmodule

// 4-Bit Dizi Çarpanı Ana Modülü
module multiplier_4bit (
    input  logic [3:0] A, B,
    output logic [7:0] P // 4x4 çarpım sonucu maksimum 8 bit
);
    logic [3:0] pp0, pp1, pp2, pp3; // Kısmi çarpımlar (Partial Products)
    logic [3:0] s1, s2, s3;         // Toplayıcı toplam çıkışları
    logic c1, c2, c3;               // Elde (carry) çıkışları

    // AND kapılarıyla bit düzeyinde kısmi çarpımların oluşturulması
    assign pp0 = {A[3]&B[0], A[2]&B[0], A[1]&B[0], A[0]&B[0]};
    assign pp1 = {A[3]&B[1], A[2]&B[1], A[1]&B[1], A[0]&B[1]};
    assign pp2 = {A[3]&B[2], A[2]&B[2], A[1]&B[2], A[0]&B[2]};
    assign pp3 = {A[3]&B[3], A[2]&B[3], A[1]&B[3], A[0]&B[3]};

    // Çarpım sonucunun 0. biti doğrudan pp0'ın ilk bitidir
    assign P[0] = pp0[0];

    // 1. Kademe: pp0'ın kalan 3 biti sağa kaydırılıp pp1 ile toplanır
    adder_4bit add1 (.a({1'b0, pp0[3:1]}), .b(pp1), .cin(1'b0), .sum(s1), .cout(c1));
    assign P[1] = s1[0];

    // 2. Kademe: s1 toplamı ve c1 eldesi kaydırılıp pp2 ile toplanır
    adder_4bit add2 (.a({c1, s1[3:1]}), .b(pp2), .cin(1'b0), .sum(s2), .cout(c2));
    assign P[2] = s2[0];

    // 3. Kademe: s2 toplamı ve c2 eldesi kaydırılıp pp3 ile toplanır
    adder_4bit add3 (.a({c2, s2[3:1]}), .b(pp3), .cin(1'b0), .sum(s3), .cout(c3));
    assign P[3] = s3[0];

    // Kalan bitler doğrudan sonucun üst 4 bitine aktarılır
    assign P[7:4] = {c3, s3[3:1]};

endmodule