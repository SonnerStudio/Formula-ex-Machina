#!/usr/bin/env python3
import os
import re

def flag_to_country_code(flag_str):
    chars = [c for c in flag_str]
    cc = ''
    for c in chars:
        code_pt = ord(c)
        if 0x1F1E6 <= code_pt <= 0x1F1FF:
            cc += chr(code_pt - 0x1F1E6 + ord('a'))
    return cc if len(cc) == 2 else 'un'

with open('Sources/FormulaExMachinaKit/Languages.swift', 'r') as f:
    content = f.read()

pattern = re.compile(r'LanguageItem\(code:\s*\"([^\"]+)\",\s*name:\s*\"([^\"]+)\",\s*nativeName:\s*\"([^\"]+)\",\s*flag:\s*\"([^\"]+)\"\)')
languages = pattern.findall(content)

print(f"Loaded {len(languages)} languages.")

def build_language_table(prefix='', current_code=None):
    cols = 3
    rows = []
    header = '| ' + ' | '.join(['🏳️ Nationalflagge & Weltsprache'] * cols) + ' |'
    sep = '| ' + ' | '.join([':---'] * cols) + ' |'
    rows.append(header)
    rows.append(sep)
    
    cells = []
    for code, name, native, flag in languages:
        cc = flag_to_country_code(flag)
        img = f'<img src="https://flagcdn.com/20x15/{cc}.png" width="20" height="15" alt="{flag}">'
        if code == current_code:
            cell = f'{img} **{flag} {name} ({native})**'
        else:
            link = f'{prefix}README_{code}.md'
            cell = f'{img} {flag} [{name} ({native})]({link})'
        cells.append(cell)
    
    while len(cells) % cols != 0:
        cells.append('')
    
    for i in range(0, len(cells), cols):
        rows.append('| ' + ' | '.join(cells[i:i+cols]) + ' |')
    
    return '\n'.join(rows)

# 1. Update README.md
with open('README.md', 'r') as f:
    readme = f.read()

# Find position after hero image and before '# ⚛️ Formula ex Machina'
hero_end = readme.find('</p>') + 4
h1_pos = readme.find('# ⚛️ Formula ex Machina')

lang_section = f"""

## 🌍 Sprachauswahl / Language Selection (130 Weltsprachen & Nationalflaggen)

Wählen Sie Ihre bevorzugte Sprache für die vollständige Dokumentation. Jede Sprache verfügt über eine eigene, interaktive Readme-Dokumentation mit offizieller Nationalflagge:

{build_language_table(prefix='docs/locales/')}

---

"""

new_readme = readme[:hero_end] + lang_section + readme[h1_pos:]
with open('README.md', 'w') as f:
    f.write(new_readme)
print("Updated README.md")

# 2. Update docs/locales/INDEX.md
index_content = f"""# 🌍 Formula ex Machina – Sprachauswahl (130 Weltsprachen & Nationalflaggen)

<p align="center">
  <img src="../../assets/hero.png" alt="Formula ex Machina – SonnerStudio" width="100%">
</p>

Formula ex Machina unterstützt 130 der meistgesprochenen und bedeutendsten Sprachen der Erde. Wählen Sie Ihre Sprache:

{build_language_table(prefix='')}

[⬅ Zurück zur Hauptdokumentation (Deutsch)](../../README.md)
"""
with open('docs/locales/INDEX.md', 'w') as f:
    f.write(index_content)
print("Updated docs/locales/INDEX.md")

# 3. Update all 130 localized README files
for code, name, native, flag in languages:
    filepath = f"docs/locales/README_{code}.md"
    cc = flag_to_country_code(flag)
    flag_img = f'<img src="https://flagcdn.com/24x18/{cc}.png" width="24" height="18" alt="{flag}">'
    
    table = build_language_table(prefix='', current_code=code)
    
    body = f"""<p align="center">
  <img src="../../assets/hero.png" alt="Formula ex Machina – SonnerStudio" width="100%">
</p>

## 🌍 {flag_img} {flag} {name} ({native}) – Formula ex Machina

> **Sprachnavigation / Language Switcher**: [⬅ Haupt-README (Deutsch)](../../README.md) | [🌍 Alle 130 Sprachen anzeigen](INDEX.md)

<details open>
<summary><b>▶ 130 Weltsprachen & Nationalflaggen / 130 World Languages & National Flags</b></summary>

{table}

</details>

---

# {flag} Formula ex Machina – Universal Scientific Formula System
**SonnerStudio • Open-Source Edition**

## 📖 {name} ({native}) Dokumentation

Willkommen bei **Formula ex Machina**, dem universalwissenschaftlichen Formel- und Berechnungssystem von SonnerStudio. 
Diese Version ist für die Sprache **{name} ({native})** ({flag}) optimiert.

### 🌟 Kernfunktionen
1. **Umfassende wissenschaftliche Formelsammlung**: Formeln aus Mathematik, Physik, Elektrotechnik, Chemie, Maschinenbau, Astronomie und Finanzmathematik.
2. **Interaktive Berechnungsmaske**: Dynamische Eingabefelder mit Live-Berechnung bei Tastatureingabe.
3. **Symbolische Formelumstellung**: Algebraische Isolierung jeder Zielvariable mit detaillierten Äquivalenzumformungsschritten.
4. **Dynamische Einheitenumrechnung**: Automatische Umrechnung zwischen SI, imperialen und technischen Einheiten.
5. **Modernes macOS Liquid Glass Design**: Dunkel- und Hellmodus, anpassbare Akzentfarben, Tastatur-Shortcuts und Tooltips.
6. **Autonomes Update-System**: Schnelle Ein-Klick-Aktualisierung über Git und lokales Build-System.

### 🚀 Schnellstart & Installation
```bash
# Repository klonen
git clone https://github.com/SonnerStudio/Formula-ex-Machina.git
cd "Formula-ex-Machina"

# Kompilieren und starten
./build.sh --open
```

### 📄 Lizenz
Dieses Projekt ist lizenziert unter der **SonnerStudio Open Source Lizenz** – siehe [LICENSE.md](../../LICENSE.md).

---
*Entwickelt mit Leidenschaft für Wissenschaft und Präzision von SonnerStudio (Jan Friske).*
"""
    with open(filepath, 'w') as f:
        f.write(body)

print("Updated all 130 locale README files successfully.")
