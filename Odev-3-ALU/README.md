# Ödev 3: Hiyerarşik 4-Bit ALU (Aritmetik Mantık Birimi)

Bu çalışma, **Bilgisayar Organizasyonu ve Mimarisi** dersi kapsamında 4-bitlik girişler üzerinde toplama, çıkarma, AND ve OR işlemlerini yürüten hiyerarşik bir ALU tasarımını içerir.

---

## 📌 Mimari Katmanlar
1. **1-Bit Full Adder (`full_adder`):** Temel toplama hücresi ($Sum = a \oplus b \oplus cin$, $Cout = ab + cin(a \oplus b)$).
2. **Toplayıcı / Çıkarıcı (`adder_subtractor_4bit`):** Çıkarma için 2'ye tümleyen (2's Complement) prensibi uygulanmıştır. `sub = 1` olduğunda $B$ bitleri XOR ile terslenir ve devreye $Cin = 1$ verilerek $A + \bar{B} + 1 = A - B$ sağlanır.
3. **ALU Üst Modülü (`alu_4bit`):** `islem` kontrol hattı ile işlem seçimi yapılarak sonuç 5-bitlik hatta aktarılır.

### İşlem Seçim Tablosu
| `islem` | Fonksiyon | Açıklama |
| :---: | :---: | :---: |
| `00` | Toplama ($A + B$) | Aritmetik Toplama |
| `01` | Çıkarma ($A - B$) | 2'ye Tümleyen Çıkarma |
| `10` | Mantıksal AND ($A \ \& \ B$) | Bit Düzeyinde VE |
| `11` | Mantıksal OR ($A \ \Vert{} \ B$) | Bit Düzeyinde VEYA |

---

## 📊 Konsol Test Sonuçları ($A = 5, B = 3$)
```text
Zaman = 0 ns  | islem = 00 | a = 0101 (5), b = 0011 (3) | sonuc = 01000 (8)
Zaman = 10 ns | islem = 01 | a = 0101 (5), b = 0011 (3) | sonuc = 10010 (2)
Zaman = 20 ns | islem = 10 | a = 0101 (5), b = 0011 (3) | sonuc = 00001 (1)
Zaman = 30 ns | islem = 11 | a = 0101 (5), b = 0011 (3) | sonuc = 00111 (7)