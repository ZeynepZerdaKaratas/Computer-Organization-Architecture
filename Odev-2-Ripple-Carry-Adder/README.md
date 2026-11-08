# Ödev 2: 4-Bit Ripple Carry Adder (Dizi Toplayıcı)

Bu çalışma, **Bilgisayar Organizasyonu ve Mimarisi** dersi kapsamında 4-bit genişliğindeki iki sayıyı toplayan bir Dizi Toplayıcı (Ripple Carry Adder) devresinin SystemVerilog ile hiyerarşik olarak modellenmesi ve simülasyonunu içerir.

---

## 📌 Mimari Yapı
* **1-Bit Full Adder (`full_adder`):** Temel toplama birimidir. Giriş sinyalleri ($a, b, cin$) üzerinden toplam ($sum$) ve elde ($cout$) değerlerini üretir:
  $$sum = a \oplus b \oplus cin$$
  $$cout = (a \cdot b) + (cin \cdot (a \oplus b))$$
* **4-Bit Adder (`adder_4bit`):** 4 adet Full Adder modülü zincirleme bağlanarak her basamağın eldesi bir sonraki basamağa aktarılır.

---

## 🛠️ Simülasyon Ortamı
* **Platform:** [EDA Playground](https://edaplayground.com/)
* **Dil:** SystemVerilog
* **Simülatör:** Aldec Riviera-PRO / Icarus Verilog
* **Görüntüleyici:** EPWave

---

## 📊 Test Senaryoları ve Sonuçlar
* **Test 1:** $A = 5, B = 3, Cin = 0 \rightarrow Sum = 8, Cout = 0$
* **Test 2:** $A = 15, B = 1, Cin = 0 \rightarrow Sum = 0, Cout = 1$ (Taşma/Elde testi: $15+1=16$)
* **Test 3:** $A = 10, B = 10, Cin = 1 \rightarrow Sum = 5, Cout = 1$ ($10+10+1=21 \rightarrow 16 + 5$)