import SwiftUI

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
        .frame(width: 480, height: 320)
        .padding(Space.lg)
        .fitsContent()
    }

    @ViewBuilder
    private var generalTab: some View {
        Form {
            Section("Berechnung & Einheiten") {
                Picker("Standard-Einheitensystem:", selection: $defaultUnitSystem) {
                    Text("Internationales Einheitensystem (SI)").tag("SI")
                    Text("Technisch / Metrisch").tag("Metric")
                    Text("Angloamerikanisch (Imperial)").tag("Imperial")
                }

                Stepper("Dezimalstellen: \(decimalPrecision)", value: $decimalPrecision, in: 1...10)

                Toggle("Automatisch bei Tastatureingabe neu berechnen", isOn: $autoRecalculate)
            }

            Section("Über Formula ex Machina") {
                LabeledContent("Version", value: "1.0.0 (SonnerStudio Build 2026.11)")
                LabeledContent("Entwickler", value: "SonnerStudio – Jan Friske")
            }
        }
    }
}
