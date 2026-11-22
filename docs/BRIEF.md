# Formula ex Machina – App Brief

**Formula ex Machina** ist eine native, elegante und hochpräzise macOS-Anwendung für Ingenieure, Wissenschaftler, Studierende und professionelle Formelanwender. Sie vereint eine umfassende, hierarchisch strukturierte Datenbank aller bekannten wissenschaftlich-technischen Formeln mit einer interaktiven Eingabemaske, automatischer symbolischer Formelumstellung nach beliebigen Zielvariablen und integrierter Einheitenumrechnung.

---

## Replaces
- Verstreute Formelsammlungen (Bücher, PDFs, Webseiten wie Wikipedia, Formeln-Tabellen).
- Manuelle algebraische Umstellungen auf Papier oder fehleranfälliges Eintippen in Standardtaschenrechner / Tabellenkalkulationen.
- Unflexible Online-Rechner ohne Offline-Fähigkeit, ohne Einheitenprüfung und ohne macOS-Systemintegration.

---

## Main Jobs

1. **Strukturierte Formel-Exploration & Schnellsuche:**
   Hierarchische Navigation über Fachbereiche (Mathematik, Physik, Chemie, Elektrotechnik, Maschinenbau, Finanzmathematik, Astronomie etc.) mit Untermenüs und einer blitzschnellen Fuzzy-Suche nach Formelnamen, Variablen, Symbolen oder Fachbegriffen.

2. **Interaktive Eingabemaske & Sofortberechnung:**
   Darstellung der Formel in hochauflösender mathematischer Notation (LaTeX / MathML). Dynamische Generierung von Eingabefeldern für alle bekannten Variablen mit flexibler Einheitenauswahl (SI, imperial, abgeleitete Einheiten) und sofortiger Ergebnisberechnung bei Werteeingabe.

3. **Symbolische Formelumstellung (Isolierung jeder Variablen):**
   Automatisches algebraisches Umstellen der Formel nach jeder beliebigen Variablen per Knopfdruck oder Variablenauswahl – inklusive nachvollziehbarer Darstellung der mathematischen Umformungsschritte.

---

## Data

- **FormulaCategory**: Hauptkategorie (z. B. `Physik`, `Mathematik`, `Elektrotechnik`, `Finanzen`) mit SF-Symbol und Farb-Tag.
- **FormulaSubcategory / Topic**: Unterthema (z. B. `Mechanik > Kinematik`, `Thermodynamik`, `Optik`, `Differentialrechnung`).
- **Formula**:
  - `id`: UUID / Identifikator (z. B. `phys.mechanik.kinematik.v_gleichfoermig`).
  - `name`: Formelname (z. B. "Gleichförmige Bewegung", "Kinetische Energie", "Ideales Gasgesetz").
  - `latex`: Standarddarstellung in LaTeX (z. B. `E = \frac{1}{2} m v^2`).
  - `ast`: Serialisierter mathematischer Syntaxbaum für die algebraische Engine.
  - `description`: Fachliche Erklärung, Gültigkeitsbedingungen und historische Anmerkungen.
  - `variables`: Liste von Symbolen mit Name, Bedeutung, Standard-SI-Einheit und Dimension.
  - `constants`: Liste relevanter Natur- oder Materialkonstanten (z. B. $c, G, h, R$).
  - `derivedForms`: Vorgeprüfte oder dynamisch berechnete Umstellungen nach jeder Variablen.
- **CalculationRecord**: Lokale Historie durchgeführter Berechnungen mit Zeitstempel, eingegebenen Parametern und Einheiten.
- **FormulaFavorite**: Lokale Favoriten und Lesezeichen mit optionalen benutzerdefinierten Tags.

---

## Shape

- **Fenster mit moderner NavigationSplitView (Sidebar > Formelliste > Detail-/Berechnungsmaske)**, voll optimiert für macOS 26/27 Liquid Glass Design.
- **Globales Schnellzugriffs-Panel (Spotlight-Style via Hotkey)** zum blitzschnellen Nachschlagen und Berechnen.
- **Menüleisten-Integration (Menu Bar Extra)** für schnellen Formelzugriff im Hintergrund.
- **100 % lokal & offline**: Lokale SQLite/SwiftData-Datenbank, keine Online-Abhängigkeit, keine Nutzerkonten, keine Telemetrie.

---

## System Hooks

- **Globaler Hotkey** (z. B. `⌥ Space` oder `⌃⌥F`) für das Schnellrechen-Panel.
- **macOS Menüleiste (Menu Bar)** mit Favoriten und Schnellsuche.
- **App Shortcuts & Spotlight Integration** via App Intents.
- **SonnerStudio Agent-CLI (`formula-cli`)** zur direkten Abfrage und Berechnung via Terminal und lokale Agenten.

---

## Reference & Design-Vorbild

- **Design:** Liquid Glass Ästhetik nach SonnerStudio Design-Standards und Apple Human Interface Guidelines für macOS 26+.
- **Typografie & Rendering:** Kristallklares mathematisches Rendering mit systemnativem Math-Font (New Computer Modern / SF Pro Text).
- **Akzentfarbe:** SonnerStudio Deep Cyan / Azure (`#0A84FF` / `#00C7BE`).

---

## Not in Version One (Scope Cut)

- Keine Cloud-Synchronisation oder Benutzerkonten (später: optionales lokales iCloud Drive Backup).
- Keine graphischen 3D-Plotter (später: 2D-Funktionsplotter in M4/M5).
- Keine beliebigen benutzerdefinierten numerischen Gleichungssysteme mit mehr als 5 gekoppelten Differentialgleichungen (Fokus liegt auf geschlossenen algebraischen Formeln).

---

## Quality & Standards

- **Swift 6.4+** im strikten Concurrency-Modus (`@MainActor` standardmäßig, algebraische Berechnungen isoliert in Hintergrund-Tasks).
- **SonnerStudio Zentrales Git-System** mit automatischem Push-Spiegel in `~/SonnerStudio-Git-Central/formula-ex-machina.git`.
- **BAMA-Testsuite**: Snapshot-Tests (`[snap]`), Unit-Tests (`[unit]`), Self-Test (`[self]`) vor jedem Meilenstein.
