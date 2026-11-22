# Formula ex Machina – User Stories & Backlog

Backlog und Meilensteinplanung für Formula ex Machina nach BAMA-Standard. Jede Story besitzt verifizierbare Akzeptanzkriterien (`[unit]` Unit-Test, `[snap]` Snapshot-Test, `[self]` Integrierter Self-Test, `[manual]` Manuelle Prüfung).

---

## Meilenstein M1: Der Kernrechen-Loop (Core Loop)
*Ziel: Eine Formel auswählen, eine beliebige Zielvariable wählen (Formel umstellen), Werte eingeben und das korrekte Ergebnis berechnen. Daten überleben einen Neustart.*

### S-101 Mathematischer Syntaxbaum (AST) und Evaluator
As a developer, I have a robust AST and numerical evaluator for algebraic expressions.
Screens: none (core engine)
Acceptance:
- [unit] AST evaluates basic operations (+, -, *, /, ^, sqrt, sin, cos, ln) with high precision (Decimal/Double).
- [unit] Division by zero is detected and throws a typed `MathError.divisionByZero`.
- [self] Selftest runs 50 algebraic benchmark expressions with expected numerical outputs.
Status: todo

### S-102 Symbolischer Gleichungslöser (Symbolic Isolator)
As the user, I can isolate any variable in an equation (e.g. from $E = m \cdot c^2$ solve for $m$ or $c$, from $v = v_0 + a \cdot t$ solve for $a$ or $t$).
Screens: 01-formula-detail.png
Depends: S-101
Acceptance:
- [unit] Equation $F = m \cdot a$ solves for $m \implies m = \frac{F}{a}$ and $a \implies a = \frac{F}{m}$.
- [unit] Equation $E_{kin} = \frac{1}{2} m v^2$ solves for $v \implies v = \sqrt{\frac{2 E_{kin}}{m}}$.
- [unit] Equation $p \cdot V = n \cdot R \cdot T$ solves for all 5 variables.
- [unit] Returns transformation steps explaining each algebraic equivalence step.
Status: todo
UX:
- Dropdown or segmented control "Nach Variable umstellen: [X]".
- Clear mathematical notation showing the rearranged equation immediately.

### S-103 Interaktive Formel-Eingabemaske (Formula Mask View)
As the user, I see input fields for all known variables with their symbols, names, and default units, and see the calculated value live.
Screens: 01-formula-detail.png, 02-formula-detail-dark.png
Depends: S-102
Acceptance:
- [snap] Formula is rendered with LaTeX-style crisp typography.
- [snap] Input fields are vertically aligned with symbol labels and unit badges.
- [self] Typing numbers into all required inputs immediately updates the target output field without lag (< 16 ms).
Status: todo
UX:
- Number fields with macOS-native stepper and keyboard navigation (`Tab` / `Shift-Tab`).
- Clear visual indicator for the calculated target variable (highlighted background, badge "Ergebnis").

### S-104 Einheitenumrechnung & Dimensionsprüfung
As the user, I can choose units for each variable (e.g., speed in m/s, km/h, or mph) and the engine automatically converts to base SI units for calculation.
Screens: 01-formula-detail.png
Depends: S-103
Acceptance:
- [unit] $v = 100 \text{ km/h}$, $t = 2 \text{ h}$ calculates distance $s = 200 \text{ km}$ or $200000 \text{ m}$.
- [unit] Incompatible unit dimensions are rejected at compile/run time.
- [snap] Unit picker displays SI prefix and common technical units.
Status: todo

### S-105 Persistente Speicherung der letzten Berechnungen
As the user, my entered values and calculation results are saved locally so they are restored after restarting the app.
Screens: 01-formula-detail.png
Depends: S-103
Acceptance:
- [unit] Calculation record is serialized to local SQLite/SwiftData.
- [self] App relaunch restores the exact inputs and selected target variable.
Status: todo

---

## Meilenstein M2: Strukturierter Formelkatalog & Navigation
*Ziel: Die vollständige hierarchische Gliederung (Themenbereiche, Fachgebiete, Untermenüs) und eine reaktionsschnelle Suche.*

### S-201 Hierarchischer Formelkatalog & Datenmodell
As the user, I browse formulas organized by domain: Mathematics, Physics, Chemistry, Electrical Engineering, Mechanical Engineering, Finance, Geometry.
Screens: 03-sidebar.png
Acceptance:
- [unit] Formula catalog loads over 200 standard formulas with categories and subcategories.
- [snap] Sidebar renders hierarchical tree with SF-Symbols for each category.
Status: todo

### S-202 Formelliste mit Live-Fuzzy-Suche
As the user, I search for formulas by typing formula names, symbols, or topics (e.g. "Ohm", "U=R*I", "Kinetisch", "Gravitation").
Screens: 04-search-results.png
Depends: S-201
Acceptance:
- [unit] Search index matches partial tokens, synonyms, and variable symbols.
- [snap] Search bar in toolbar with instant filter results.
Status: todo

### S-203 Favoriten & Lesezeichen
As the user, I can mark frequently used formulas as favorites with a star or shortcut and access them in a dedicated "Favoriten" sidebar section.
Screens: 03-sidebar.png, 05-favorites.png
Depends: S-201
Acceptance:
- [unit] Toggle favorite persists state in local database.
- [snap] Favorited formulas show filled star icon.
Status: todo

---

## Meilenstein M3: Erweiterte Algebra & Schritt-für-Schritt-Lösung
*Ziel: Tiefere mathematische Fähigkeiten, nichtlineare Formeln, Naturkonstanten und didaktische Rechenwege.*

### S-301 Natur- und Materialkonstanten-Bibliothek
As the user, I can insert universal constants (e.g. Lichtgeschwindigkeit $c$, Gravitationskonstante $G$, Planck-Konstante $h$, Gaskonstante $R$) with exact precision and standard units.
Screens: 06-constants-picker.png
Acceptance:
- [unit] Constants registry provides CODATA-standard values with high precision.
- [snap] Popover picker for inserting constants directly into formula fields.
Status: todo

### S-302 Schritt-für-Schritt-Erklärung der Formelumstellung
As the user, I can expand a "Lösungsweg"-Panel that explains step-by-step how the formula was algebraically rearranged.
Screens: 07-solution-steps.png
Acceptance:
- [snap] Step-by-step panel renders each intermediate equation with explanation text.
- [self] Toggle "Lösungsweg anzeigen" animates smoothly.
Status: todo

---

## Meilenstein M4: Geschwindigkeit & Ergonomie
*Ziel: Schnellzugriff, globale Tastaturkürzel, Exportfunktionen und Tastaturbedienung.*

### S-401 Globales Spotlight-artiges Schnellzugriffs-Panel
As the user, I press a global hotkey (e.g. `⌥ Space`) to open a floating formula calculator over any window, calculate, and copy the result.
Screens: 08-quick-panel.png
Acceptance:
- [snap] Non-activating floating panel centered on screen.
- [self] Pressing `Escape` closes the panel, `Return` copies the calculated result.
Status: todo

### S-402 Kopier- und Export-Aktionen
As the user, I can copy results formatted as: raw number, formatted with unit, LaTeX snippet, or Swift/Python expression.
Screens: 01-formula-detail.png
Acceptance:
- [unit] Formats clipboard string according to selected export mode.
- [snap] Context menu and button "Kopieren als...".
Status: todo

---

## Meilenstein M5: macOS-Systemintegration & Agent-CLI
*Ziel: Menüleisten-Item, App Intents / Shortcuts und CLI-Schnittstelle.*

### S-501 macOS Menüleisten-Status-Item (Menu Bar Extra)
As the user, I access my recent and favorite formulas directly from the macOS menu bar.
Screens: 09-menubar.png
Acceptance:
- [snap] Clean popover under status item with quick calculation input.
Status: todo

### S-502 Formula-CLI für SonnerStudio-Agenten (`formula-cli`)
As an automated agent or terminal user, I can query formulas and calculate values via command-line interface.
Acceptance:
- [unit] CLI command `formula-cli solve --formula "E_kin" --for "v" -E 1000 -m 20` outputs exact JSON result.
- [unit] CLI command `formula-cli list --category "phys.mechanik"` outputs JSON list of formulas.
Status: todo

---

## Meilenstein M6: Liquid Glass Design, App-Icon & Fertigstellung
*Ziel: Vollendetes SonnerStudio-Produkt, Icon Composer Icon, Einstellungen und Dokumentation.*

### S-601 Liquid Glass App-Icon (`AppIcon.icon`)
As the user, I see a bespoke native Liquid Glass icon in the Dock with mathematical symbolism (Summenzeichen $\Sigma$ oder Integral $\int$ in Kristall-Optik).
Acceptance:
- [snap] AppIcon compiled with `actool` and verified in all sizes via `ictool`.
Status: todo

### S-602 Einstellungen-Fenster (Settings View)
As the user, I can configure default unit systems (SI / Imperial), decimal places, theme accent color, and global shortcuts.
Screens: 10-settings.png
Acceptance:
- [snap] Settings window with tabs: Allgemein, Einheiten, Tastaturkürzel.
Status: todo

---

## Dropped / Out of Scope (Verzichtet)
- Keine Benutzer-Accounts oder Cloud-Registrierung (Datenschutz und 100% Offline-Betrieb).
- Keine In-App-Käufe oder Telemetrie.
- Keine 3D-CAD-Modellierung (beschränkt auf analytische Formeln).
