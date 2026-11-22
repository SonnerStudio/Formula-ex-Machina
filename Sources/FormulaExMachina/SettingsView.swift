import SwiftUI
import FormulaExMachinaKit

public enum SettingsTab: String, CaseIterable, Identifiable {
    case general = "Allgemein"
    case appearance = "Erscheinungsbild"

    public var id: String { rawValue }

    public var icon: String {
        switch self {
        case .general: return "gearshape"
        case .appearance: return "paintpalette"
        }
    }
}

public struct SettingsView: View {
    @State private var selectedTab: SettingsTab = .general
    @AppStorage("appLanguage") private var selectedLanguageCode: String = "de"
    @AppStorage("defaultUnitSystem") private var defaultUnitSystem: String = "SI"
    @AppStorage("autoRecalculate") private var autoRecalculate: Bool = true
    @AppStorage("decimalPrecision") private var decimalPrecision: Int = 4

    public init() {}

    public var body: some View {
        TabView(selection: $selectedTab) {
            generalTab
                .tabItem {
                    Label(SettingsTab.general.rawValue, systemImage: SettingsTab.general.icon)
                }
                .tag(SettingsTab.general)

            AppearanceSettings()
                .tabItem {
                    Label(SettingsTab.appearance.rawValue, systemImage: SettingsTab.appearance.icon)
                }
                .tag(SettingsTab.appearance)
        }
        .frame(width: 520, height: 380)
        .padding(Space.lg)
        .fitsContent()
    }

    @ViewBuilder
    private var generalTab: some View {
        Form {
            Section("Sprachauswahl & Nationalflaggen") {
                Picker("Sprache:", selection: $selectedLanguageCode) {
                    ForEach(LanguageRegistry.shared.languages) { lang in
                        Text("\(lang.flag)  \(lang.name) (\(lang.nativeName))")
                            .tag(lang.code)
                    }
                }
                .help("Wählen Sie aus den 130 meistgesprochenen Sprachen der Erde mit Nationalflaggen")
            }

            Section("Berechnung & Einheiten") {
                Picker("Standard-Einheitensystem:", selection: $defaultUnitSystem) {
                    Text("Internationales Einheitensystem (SI)").tag("SI")
                    Text("Technisch / Metrisch").tag("Metric")
                    Text("Angloamerikanisch (Imperial)").tag("Imperial")
                }
                .help("Bevorzugtes Einheitensystem für Formelparameter und Resultate")

                Stepper("Dezimalstellen: \(decimalPrecision)", value: $decimalPrecision, in: 1...10)
                    .help("Anzahl der gerundeten Nachkommastellen für die numerische Anzeige")

                Toggle("Automatisch bei Tastatureingabe neu berechnen", isOn: $autoRecalculate)
                    .help("Formelergebnis unmittelbar während der Tastatureingabe im Hintergrund neu auswerten")
            }

            Section("Über Formula ex Machina") {
                LabeledContent("Version", value: "1.1.0 (SonnerStudio Build 2026.11)")
                LabeledContent("Entwickler", value: "SonnerStudio – Jan Friske")
            }
        }
    }
}
