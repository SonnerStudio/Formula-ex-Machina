# ⚛️ Formula ex Machina

**Formula ex Machina** ist ein hochpräzises, natives macOS-Formel- und Rechensystem für Universalwissenschaftler, Ingenieure und Formelanwender – entwickelt von **SonnerStudio** (Jan Friske).

[![macOS](https://img.shields.io/badge/macOS-26%2B%20%7C%20Liquid%20Glass-007AFF.svg)](https://apple.com/macos)
[![Swift](https://img.shields.io/badge/Swift-6.4-orange.svg)](https://swift.org)
[![License](https://img.shields.io/badge/License-Open%20Source-green.svg)](LICENSE.md)
[![Languages](https://img.shields.io/badge/Languages-130%20Weltsprachen-blue.svg)](docs/locales/INDEX.md)
[![SonnerStudio](https://img.shields.io/badge/SonnerStudio-Official%20Project-00C7BE.svg)](https://sonnerstudio.net)

---

## 🌟 Was ist Formula ex Machina?

Formula ex Machina vereint eine umfassende wissenschaftliche Formelsammlung aller bekannten Disziplinen mit einer interaktiven Eingabemaske, automatischer symbolischer Formelumstellung und sofortiger Einheitenumrechnung.

- **Universelle Formelsammlung:** Fundierte Wissensbasis aus Physik (Kinematik, Dynamik, Thermodynamik, Strömungslehre, Relativität, Astrophysik), Mathematik (Geometrie, Trigonometrie, Algebra, Analysis), Elektrotechnik, Chemie, Maschinenbau, Informationstheorie und Finanzmathematik.
- **Symbolische Formelumstellung (Gleichungslöser):** Jede Formel kann nach jeder beliebigen Variablen per Klick analytisch umgestellt werden (z. B. $F = m \cdot a \implies m = \frac{F}{a}$, $E = m \cdot c^2 \implies c = \sqrt{\frac{E}{m}}$).
- **Interaktive Eingabemaske:** Schnelle Werteeingabe mit Live-Berechnung und automatischer Einheitenumrechnung (SI, metrisch, imperial).
- **Lösungsweg-Anzeige:** Schritt-für-Schritt-Darstellung der mathematischen Äquivalenzumformungen.
- **130 Weltsprachen:** Sprachauswahlmenü mit Flaggen aller 130 meistgesprochenen Sprachen der Erde.
- **Update-Manager:** Nahtloses Update- und Synchronisationssystem (kompatibel mit der SternenMeister/Zeitmeister24-Methode).
- **100 % Offline:** Keine Cloud-Abhängigkeiten, kein Datenabfluss, höchste Rechengeschwindigkeit.

---

## 🚀 Installation & Build

### Voraussetzungen
- macOS 15, 26 oder neuer
- Swift 6.2+ / Xcode Command Line Tools

```bash
# 1. Repository klonen
git clone https://github.com/SonnerStudio/Formula-ex-Machina.git
cd Formula-ex-Machina

# 2. Kompilieren, signieren und starten
./build.sh --open

# 3. Tests ausführen
swift test --scratch-path /tmp/FormulaExMachina-build
```

---

## 🔄 Update-System (SternenMeister-Methode)

Das Projekt verfügt über einen integrierten Update-Manager, der automatisch Aktualisierungen aus den Git-Remotes (`github` und `central`) abholt, verifiziert und die Anwendung aktualisiert:

```bash
# Update prüfen, kompilieren und App neu starten:
./update.sh --restart
```

Auch direkt innerhalb der laufenden macOS-App über das **Update-Symbol** in der Symbolleiste ausführbar.

---

## 🌍 Sprachauswahl (130 Sprachen)

Formula ex Machina unterstützt 130 Sprachen der Erde mit Flaggen.
Detaillierte README-Dokumentationen in allen 130 Sprachen befinden sich im Verzeichnis [`docs/locales/`](docs/locales/INDEX.md):

- 🇩🇪 [Deutsch](docs/locales/README_de.md)
- 🇬🇧 [English](docs/locales/README_en.md)
- 🇨🇳 [中文 (Mandarin)](docs/locales/README_zh.md)
- 🇪🇸 [Español](docs/locales/README_es.md)
- 🇫🇷 [Français](docs/locales/README_fr.md)
- 🇮🇹 [Italiano](docs/locales/README_it.md)
- 🇯🇵 [日本語](docs/locales/README_ja.md)
- 🇷🇺 [Русский](docs/locales/README_ru.md)
- 🇮🇳 [हिन्दी](docs/locales/README_hi.md)
- 🇸🇦 [العربية](docs/locales/README_ar.md)
- ... und [120 weitere Sprachen](docs/locales/INDEX.md).

---

## 🏛️ Architektur

- **`FormulaEngine`**: Plattformunabhängige mathematische Engine mit abstraktem Syntaxbaum (`MathNode`), Recursive-Descent-Parser, symbolischem Gleichungslöser (`SymbolicIsolator`) und dimensionaler Einheitenumrechnung (`UnitConverter`).
- **`FormulaExMachinaKit`**: Datenmodelle (`FormulaItem`, `FormulaCategoryItem`), universeller Formelkatalog (`FormulaCatalog`), Sprachregister (`LanguageRegistry`) und `CalculationService`.
- **`FormulaExMachina`**: Native macOS-Anwendung in SwiftUI 6 mit `NavigationSplitView`, Live-Masken, Tooltips und Liquid Glass Akzenten.

---

## 📄 Lizenz

Open Source lizenziert unter den Bedingungen der [LICENSE.md](LICENSE.md).

**Entwickelt von SonnerStudio – Jan Friske.**
