# 4-to-1 Multiplexer (SystemVerilog)

Bu çalışma, **Bilgisayar Organizasyonu ve Mimarisi** dersi kapsamında 8-bit veri genişliğine sahip 4'e 1 Çoklayıcı (4-to-1 Multiplexer) donanım biriminin SystemVerilog ile modellenmesini ve EDA Playground üzerinde simüle edilerek doğrulanmasını içerir.

---

## 📌 Mimari ve Çalışma Mantığı
Çoklayıcı (Multiplexer / MUX), birden fazla kaynaktan gelen veri hatlarından birini, kontrol sinyaline (`sel`) bağlı olarak seçip tek bir çıkış hattına yönlendiren kombinezonsal (combinational) mantık devresidir. İşlemci mimarilerinde veri yollarının kontrolünde ve ALU girişlerinin seçilmesinde temel bir rol oynar.

### Doğruluk Tablosu (Truth Table)
| Seçim Hattı (`sel`) | Aktarılan Giriş | Test Değeri (Hex) | Çıkış (`y`) |
| :---: | :---: | :---: | :---: |
| `00` | `d0` | `0xAA` | `0xAA` |
| `01` | `d1` | `0xBB` | `0xBB` |
| `10` | `d2` | `0xCC` | `0xCC` |
| `11` | `d3` | `0xDD` | `0xDD` |

---

## 🛠️ Simülasyon Ortamı
* **Platform:** [EDA Playground](https://edaplayground.com/)
* **Donanım Tanımlama Dili:** SystemVerilog
* **Simülatör:** Aldec Riviera-PRO 2025.04
* **Dalga Formu Görüntüleyici:** EPWave

---

## 📊 Simülasyon Doğrulama Sonuçları

### 1. Konsol Log Çıktısı
```text
Time: 10 | sel: 00 | y: aa | Expected: aa
Time: 20 | sel: 01 | y: bb | Expected: bb
Time: 30 | sel: 10 | y: cc | Expected: cc
Time: 40 | sel: 11 | y: dd | Expected: dd