# Formula ex Machina – Verzeichnis- & Dateistruktur

Detaillierte Planung aller Verzeichnisse, Dateien und Verantwortlichkeiten für das gesamte Projekt im Arbeitsverzeichnis `/Volumes/sonnerstudiomacstudiomax36gb/Projekte/Formula ex Machina`.

```text
Formula ex Machina/
├── .git/                                   # Lokales Git-Repository (Hauptzweig: main)
├── .gitignore                              # Git-Ignore für Swift, SPM, macOS, Xcode, Build-Artefakte
├── Package.swift                           # Swift Package Manager Manifest (Swift 6.4, macOS 26+)
├── Info.plist.in                           # macOS Bundle-Konfiguration & Metadaten
├── build.sh                                # BAMA Build-Skript: Kompiliert .app, signiert, installiert
├── CLAUDE.md                               # Richtlinien & Shortcuts für Agenten und Entwicklung
│
├── docs/                                   # Projektdokumentation & Architekturunterlagen
│   ├── BRIEF.md                            # App Brief (Zweck, Umfang, Anforderungen)
│   ├── ARCHITECTURE.md                     # Architektur-Prinzipien, Module, AST & Solver
│   ├── STORIES.md                          # User Stories & Meilensteine M1..M6 mit Akzeptanzkriterien
│   ├── DIRECTORY_STRUCTURE.md              # Diese Verzeichnis- und Strukturübersicht
│   ├── FORMULA_TAXONOMY.md                 # Systematische Gliederung aller Formelbereiche & Themen
│   └── GLOSSARY.md                         # Einheitliche Begriffe für UI und Code
│
├── Icon/                                   # Liquid Glass App-Icon Ressourcen
│   └── AppIcon.icon                        # Icon Composer Projekt (JSON + SVG-Ebenen)
│
├── Resources/                              # Statische App-Ressourcen & Datenbank-Seed
│   ├── Assets.xcassets/                    # Farben, SF-Symbol-Vektoren, Akzente
│   └── Database/                           # Formelkatalog-Daten
│       ├── formulas_physics.json           # Physik: Mechanik, Thermodynamik, Elektrodynamik, Optik
│       ├── formulas_mathematics.json       # Mathe: Geometrie, Algebra, Analysis, Trigonometrie
│       ├── formulas_chemistry.json         # Chemie: Stöchiometrie, Gase, Thermochemie, Elektrochemie
│       ├── formulas_engineering.json       # Ingenieurwesen: Statik, Festigkeitslehre, Strömung
│       ├── formulas_finance.json           # Finanzen: Zinseszins, Renten, Annuitäten, Abschreibung
│       └── constants.json                  # Natur- und physikalische Konstanten (CODATA)
│
├── Sources/                                # Swift Quellcode
│   │
│   ├── FormulaEngine/                      # REINE MATHEMATISCHE CORE-ENGINE (Plattformunabhängig)
│   │   ├── AST/                            # Abstrakter Syntaxbaum für mathematische Ausdrücke
│   │   │   ├── MathNode.swift              # Baumknoten (Zahlen, Symbole, Operatoren, Funktionen)
│   │   │   ├── BinaryOperator.swift        # +, -, *, /, ^
│   │   │   ├── UnaryOperator.swift         # Negation, Betrag
│   │   │   └── MathFunction.swift          # sqrt, sin, cos, tan, ln, exp, log10
│   │   │
│   │   ├── Parser/                         # Mathematischer Parser
│   │   │   ├── MathLexer.swift             # Tokenizer für Gleichungen und Terme
│   │   │   ├── MathParser.swift            # Recursive Descent Parser: Text -> MathNode
│   │   │   └── LaTeXExporter.swift         # MathNode -> LaTeX String
│   │   │
│   │   ├── Solver/                         # Symbolische Gleichungsumstellung
│   │   │   ├── Equation.swift              # Repräsentation von lhs = rhs
│   │   │   ├── SymbolicIsolator.swift      # Umstellungsalgorithmus für Zielvariable x
│   │   │   ├── EquivalenceRules.swift      # Algebraische Transformationsregeln
│   │   │   └── TransformationStep.swift    # Dokumentation der Rechenschritte
│   │   │
│   │   ├── Evaluator/                      # Numerische Auswertung & Berechnung
│   │   │   ├── ExpressionEvaluator.swift   # High-Precision Numerischer Evaluator
│   │   │   └── MathContext.swift           # Variablenbelegung & Rechengenauigkeit
│   │   │
│   │   └── Units/                          # Dimensions- & Einheitenumrechnung
│   │       ├── PhysicalDimension.swift     # SI-Dimensionen ([M], [L], [T], [I], ...)
│   │       ├── UnitDefinition.swift        # Einheiten, Präfixe (k, M, m, µ) und Umrechnungsfaktoren
│   │       └── UnitConverter.swift         # Umrechnung von/in Basis-SI-Einheiten
│   │
│   ├── FormulaExMachinaKit/                # DOMÄNEN-SCHICHT & PERSISTENZ
│   │   ├── Models/                         # Datenmodelle
│   │   │   ├── FormulaCategory.swift       # Hauptbereiche & Untermenüs
│   │   │   ├── FormulaItem.swift           # Formeldefinition mit Variablen & Metadaten
│   │   │   ├── FormulaVariable.swift       # Symbol, Name, Standard-Einheit, Gültigkeitsbereich
│   │   │   ├── PhysicalConstant.swift      # Konstantenmodell
│   │   │   └── CalculationHistory.swift    # Gespeicherte frühere Berechnungen
│   │   │
│   │   ├── Database/                       # Lokale Datenbank & Indizierung
│   │   │   ├── FormulaDatabase.swift       # SQLite WAL / SwiftData Speicheranbindung
│   │   │   ├── FormulaDataLoader.swift     # Import der vorkompilierten JSON-Kataloge
│   │   │   └── FormulaSearchIndex.swift    # Fuzzy-Volltext- & Tokensuchindex
│   │   │
│   │   └── Services/                       # Geschäftslogik-Dienste
│   │       ├── FormulaService.swift        # Bereitstellung & Filterung von Formeln
│   │       └── CalculationService.swift    # Koordination von Umstellung, Einheiten & Berechnung
│   │
│   └── FormulaExMachina/                   # NATIVE macOS SWIFTUI APP
│       ├── App.swift                       # NSApplication Einstiegspunkt, Fenster & Menüs
│       ├── AppModel.swift                  # Zentrales @Observable Zustandsmodell der App
│       │
│       ├── Views/                          # SwiftUI Ansichten
│       │   ├── MainSplitView.swift         # NavigationSplitView (Sidebar, Liste, Detail)
│       │   ├── Sidebar/                    # Seitenleiste
│       │   │   ├── SidebarView.swift       # Kategorie- und Themenbaum
│       │   │   └── CategoryRow.swift       # Kategoriereihe mit SF-Symbol
│       │   │
│       │   ├── List/                       # Formelliste
│       │   │   ├── FormulaListView.swift   # Durchsuchbare Formelliste mit Filterung
│       │   │   ├── FormulaRow.swift        # Listenelement mit Schnellvorschau
│       │   │   └── SearchToolbar.swift     # Suchleiste mit Filterchips
│       │   │
│       │   ├── Detail/                     # Interaktive Formelmaske
│       │   │   ├── FormulaDetailView.swift # Hauptmaske der ausgewählten Formel
│       │   │   ├── MathDisplayView.swift   # Scharfes Formel-Rendering
│       │   │   ├── RearrangePicker.swift   # Auswahl der Zielvariable ("Umstellen nach")
│       │   │   ├── VariableInputField.swift# Eingabezeile mit Stepper & Einheitenmenü
│       │   │   ├── ResultCardView.swift    # Großes hervorgehobenes Ergebnisfeld
│       │   │   └── StepsView.swift         # Ausklappbare Schritt-für-Schritt-Umstellung
│       │   │
│       │   ├── QuickPanel/                 # Spotlight-artiges Overlay
│       │   │   └── QuickCalculatorPanel.swift # Schwebendes Fenster für Schnellrechnung
│       │   │
│       │   └── Settings/                   # Einstellungsfenster
│       │       ├── SettingsView.swift      # Tabs für Allgemein, Einheiten, Tastaturkürzel
│       │       └── AppearanceSettings.swift# Akzentfarben & Theme-Auswahl
│       │
│       ├── UI/                             # Design-System & UI-Komponenten
│       │   ├── Theme.swift                 # SonnerStudio Farbtokens & Liquid Glass Effekte
│       │   ├── Grid.swift                  # 4-Punkt macOS Layout-Raster & Abstände
│       │   ├── WindowBehavior.swift        # Fensterpositionierung & Größenanpassung
│       │   └── MathRenderer/               # Nativer Mathe-Renderer (Canvas/CoreText/LaTeX)
│       │       └── MathFormulaCanvas.swift # Vektorieller Formelzeichner
│       │
│       └── System/                         # macOS Systemintegration
│           ├── MenuCommands.swift          # macOS Anwendungsmenüs & Shortcuts
│           ├── MenuBarManager.swift        # macOS Menüleisten Status-Item
│           └── GlobalHotkeyManager.swift   # Globaler Shortcut-Monitor
│
├── Tests/                                  # Automatisierte Test-Suiten
│   ├── FormulaEngineTests/                 # Tests der Algebra-, Parser- & Solver-Engine
│   │   ├── ParserTests.swift               # Testet Parsen von Gleichungen
│   │   ├── SolverTests.swift               # Testet symbolische Umstellung verschiedener Formeln
│   │   ├── EvaluatorTests.swift            # Numerische Genauigkeit und Randfälle
│   │   └── UnitConverterTests.swift        # Einheitenumrechnungen & Dimensionsprüfungen
│   │
│   └── FormulaExMachinaKitTests/           # Domänen- & Integrationstests
│       ├── CatalogTests.swift              # Konsistenz aller Datenbank-Formeln
│       └── SearchIndexTests.swift          # Treffergenauigkeit der Suche
│
└── tools/                                  # BAMA Entwicklungs- & Verifikationswerkzeuge
    ├── selftest.sh                         # Schneller CLI-Selbsttest aller Kernfunktionen
    ├── snap.sh                             # Automatische Snapshot-Generierung für alle Screens
    ├── check-layout.swift                  # Layout- & Frame-Überprüfung gegen das 4pt-Raster
    ├── grid-lint.sh                        # Linter für harte Pixelwerte abseits des Rasters
    ├── make_icon.sh                        # Kompiliert AppIcon.icon zu Assets.car & AppIcon.icns
    └── icon_review.sh                      # Generiert visuelle Prüfbögen des Icons
```
