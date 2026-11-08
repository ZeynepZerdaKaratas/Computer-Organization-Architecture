# Ödev 4: 4-Bit Dizi Çarpanı (Array Multiplier)

Bu çalışma, **Bilgisayar Organizasyonu ve Mimarisi** dersi kapsamında 4-bitlik işaretsiz iki sayıyı çarparak 8-bitlik sonuç üreten Dizi Çarpanı (Array Multiplier) mimarisinin SystemVerilog ile hiyerarşik olarak modellenmesi ve simülasyonunu içerir.

---

## 📌 Mimari Yapı ve Çalışma Prensibi

Dizi çarpanı mantığı, basamak kaydırma ve kısmi çarpımların toplanması esasına dayanır:

1. **Kısmi Çarpımlar (Partial Products):** 
   * $A$ ve $B$ sayılarının bitleri AND kapılarıyla çarpılarak 4 adet kısmi çarpım satırı elde edilir:
     * $pp0 = A \cdot B[0]$
     * $pp1 = A \cdot B[1]$
     * $pp2 = A \cdot B[2]$
     * $pp3 = A \cdot B[3]$
2. **Kademeli Toplama Katmanı:**
   * $P[0] = pp0[0]$ doğrudan sonuca aktarılır.
   * Kalan bitler 3 adet `adder_4bit` modülü üzerinden bir önceki kademenin taşıma biti (`cout`) ile birlikte sağa kaydırılarak zincirleme toplanır.
   * Sonuç maksimum $15 \times 15 = 225$ değerini alabileceğinden 8-bit ($P[7:0]$) genişliğindedir.

---

## 🛠️ Simülasyon Ortamı
* **Platform:** [EDA Playground](https://edaplayground.com/)
* **Dil:** SystemVerilog
* **Simülatör:** Aldec Riviera-PRO / Icarus Verilog
* **Görüntüleyici:** EPWave

---

## 📊 Konsol Test Sonuçları
```text
Zaman = 0 ns  | A = 5,  B = 3  | Carpim Sonucu (P) = 15
Zaman = 10 ns | A = 8,  B = 9  | Carpim Sonucu (P) = 72
Zaman = 20 ns | A = 15, B = 15 | Carpim Sonucu (P) = 225
Zaman = 30 ns | A = 0,  B = 7  | Carpim Sonucu (P) = 0