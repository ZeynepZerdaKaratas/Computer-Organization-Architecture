// ============================================================================
// Modül Adı   : alu_4bit (Hiyerarşik 4-Bit ALU)
// Açıklama    : Full Adder -> Toplayıcı/Çıkarıcı -> ALU Mantığı
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

// 4-Bit Toplayıcı / Çıkarıcı (Ripple Carry + 2's Complement)
module adder_subtractor_4bit (
    input  logic [3:0] A, B,
    input  logic sub, // sub = 0 ise topla, sub = 1 ise çıkar
    output logic [3:0] Sum,
    output logic Cout
);
    logic c1, c2, c3;
    logic [3:0] B_in; 

    // Çıkarma durumunda B bitleri terslenir (B XOR sub)
    assign B_in[0] = B[0] ^ sub;
    assign B_in[1] = B[1] ^ sub;
    assign B_in[2] = B[2] ^ sub;
    assign B_in[3] = B[3] ^ sub;

    // Full Adder zinciri (Çıkarma için ilk cin = sub = 1)
    full_adder fa0 (.a(A[0]), .b(B_in[0]), .cin(sub), .sum(Sum[0]), .cout(c1));
    full_adder fa1 (.a(A[1]), .b(B_in[1]), .cin(c1),  .sum(Sum[1]), .cout(c2));
    full_adder fa2 (.a(A[2]), .b(B_in[2]), .cin(c2),  .sum(Sum[2]), .cout(c3));
    full_adder fa3 (.a(A[3]), .b(B_in[3]), .cin(c3),  .sum(Sum[3]), .cout(Cout));
endmodule

// 4-Bit ALU Ana Modülü
module alu_4bit (
    input  logic [3:0] a,
    input  logic [3:0] b,
    input  logic [1:0] islem, // 00: Topla, 01: Çıkar, 10: AND, 11: OR
    output logic [4:0] sonuc  // Elde taşması dahil 5 bit
);
    logic [3:0] add_sub_sonuc;
    logic add_sub_cout;
    logic [3:0] and_sonuc;
    logic [3:0] or_sonuc;

    adder_subtractor_4bit add_sub_inst (
        .A(a),
        .B(b),
        .sub(islem[0]), 
        .Sum(add_sub_sonuc),
        .Cout(add_sub_cout)
    );

    assign and_sonuc = a & b;
    assign or_sonuc  = a | b;

    always_comb begin
        case(islem)
            2'b00:   sonuc = {add_sub_cout, add_sub_sonuc}; // Toplama
            2'b01:   sonuc = {add_sub_cout, add_sub_sonuc}; // Çıkarma
            2'b10:   sonuc = {1'b0, and_sonuc};             // Mantıksal AND
            2'b11:   sonuc = {1'b0, or_sonuc};              // Mantıksal OR
            default: sonuc = 5'b00000;
        endcase
    end

endmodule