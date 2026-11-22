import Foundation
import SwiftUI
import FormulaEngine
import FormulaExMachinaKit

@MainActor
@Observable
public final class AppModel {
    public let catalog = FormulaCatalog.shared
    public let service = CalculationService.shared
    public let converter = UnitConverter.shared
    public let languages = LanguageRegistry.shared
    public let l10n = LocalizationService.shared

    // Lokalisierung & Sprache (130 Sprachen)
    public var selectedLanguageCode: String = "de" {
        didSet {
            UserDefaults.standard.set(selectedLanguageCode, forKey: "appLanguage")
        }
    }

    public func localized(_ key: LocalizedKey) -> String {
        l10n.string(for: key, languageCode: selectedLanguageCode)
    }

    public func localizedCategory(_ name: String) -> String {
        l10n.localizedCategory(name, languageCode: selectedLanguageCode)
    }

    // Navigation
    public var selectedCategory: String? = "Physik"
    public var selectedSubcategory: String? = "Dynamik"
    public var selectedFormulaID: String? = "phys_dyn_newton2"
    public var searchQuery: String = ""

    // Aktuell ausgewählte Formel & Konfiguration
    public var targetVariable: String = "m"
    public var inputValues: [String: String] = ["F": "100", "a": "5"]
    public var inputUnits: [String: String] = ["F": "N", "a": "m/s²"]
    public var targetUnit: String = "kg"

    // Berechnungsergebnis
    public var currentOutput: CalculationOutput?
    public var errorMessage: String?
    public var copiedFeedback: Bool = false
    public var isUpdating: Bool = false
    public var updateStatusText: String?

    public init() {
        if let savedLang = UserDefaults.standard.string(forKey: "appLanguage") {
            self.selectedLanguageCode = savedLang
        }
        // Initiale Berechnung ausführen
        selectFormula(id: "phys_dyn_newton2")
    }

    public var currentLanguage: LanguageItem {
        languages.find(code: selectedLanguageCode) ?? languages.languages[0]
    }

    public func checkForUpdates() {
        isUpdating = true
        updateStatusText = "Prüfe auf Updates..."

        Task.detached {
            let proc = Process()
            proc.executableURL = URL(fileURLWithPath: "/bin/zsh")
            proc.arguments = ["/Volumes/sonnerstudiomacstudiomax36gb/Projekte/Formula ex Machina/tools/update.sh"]

            try? proc.run()
            proc.waitUntilExit()

            await MainActor.run {
                self.isUpdating = false
                if proc.terminationStatus == 0 {
                    self.updateStatusText = "Bereits auf dem neuesten Stand!"
                } else {
                    self.updateStatusText = "Update fehlgeschlagen oder keine Verbindung."
                }

                Task {
                    try? await Task.sleep(nanoseconds: 3_000_000_000)
                    await MainActor.run {
                        self.updateStatusText = nil
                    }
                }
            }
        }
    }

    public var selectedFormula: FormulaItem? {
        guard let id = selectedFormulaID else { return nil }
        return catalog.find(id: id)
    }

    public var filteredFormulas: [FormulaItem] {
        if !searchQuery.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return catalog.search(query: searchQuery)
        }

        return catalog.formulas.filter { item in
            if let cat = selectedCategory, item.category != cat {
                return false
            }
            if let sub = selectedSubcategory, item.subcategory != sub {
                return false
            }
            return true
        }
    }

    public func selectFormula(id: String) {
        guard let formula = catalog.find(id: id) else { return }
        selectedFormulaID = id
        selectedCategory = formula.category
        selectedSubcategory = formula.subcategory

        // Standardmäßig die erste Variable als Zielvariable wählen
        let firstVar = formula.variables.first?.symbol ?? ""
        targetVariable = firstVar
        targetUnit = formula.variables.first?.defaultUnit ?? ""

        // Standardwerte und Einheiten für die restlichen Variablen initialisieren
        var defaultVals: [String: String] = [:]
        var defaultUnits: [String: String] = [:]

        for v in formula.variables {
            defaultUnits[v.symbol] = v.defaultUnit
            if v.symbol != targetVariable {
                // Einprägsame Standardwerte für schnelles Ausprobieren
                defaultVals[v.symbol] = "10"
            }
        }

        self.inputValues = defaultVals
        self.inputUnits = defaultUnits
        recalculate()
    }

    public func setTargetVariable(_ variable: String) {
        guard targetVariable != variable else { return }
        let oldTarget = targetVariable
        targetVariable = variable

        if let v = selectedFormula?.variables.first(where: { $0.symbol == variable }) {
            targetUnit = v.defaultUnit
        }

        // Falls das bisherige Ziel zuvor keinen Eingabewert hatte, sinnvollen Wert setzen
        if inputValues[oldTarget] == nil || inputValues[oldTarget]?.isEmpty == true {
            if let lastRes = currentOutput?.resultValue {
                inputValues[oldTarget] = String(format: "%.4g", lastRes)
            } else {
                inputValues[oldTarget] = "10"
            }
        }

        // Das neue Ziel aus den Eingabewerten entfernen
        inputValues.removeValue(forKey: variable)
        recalculate()
    }

    public func setInputValue(_ value: String, for symbol: String) {
        inputValues[symbol] = value
        recalculate()
    }

    public func setInputUnit(_ unit: String, for symbol: String) {
        inputUnits[symbol] = unit
        recalculate()
    }

    public func setTargetUnit(_ unit: String) {
        targetUnit = unit
        recalculate()
    }

    public func recalculate() {
        guard let formula = selectedFormula else {
            currentOutput = nil
            errorMessage = nil
            return
        }

        // Eingabewerte als Doubles parsen
        var numericInputs: [String: Double] = [:]
        for variable in formula.variables where variable.symbol != targetVariable {
            let str = (inputValues[variable.symbol] ?? "").replacingOccurrences(of: ",", with: ".")
            guard let val = Double(str) else {
                currentOutput = nil
                errorMessage = "Bitte gültige Zahlen für alle Parameter eingeben."
                return
            }
            numericInputs[variable.symbol] = val
        }

        do {
            let out = try service.calculate(
                formula: formula,
                targetVariable: targetVariable,
                rawInputs: numericInputs,
                inputUnits: inputUnits,
                targetUnit: targetUnit
            )
            self.currentOutput = out
            self.errorMessage = nil
        } catch {
            self.currentOutput = nil
            self.errorMessage = error.localizedDescription
        }
    }

    public func copyResultToClipboard() {
        guard let output = currentOutput else { return }
        let formatted = String(format: "%.6g", output.resultValue)
        let str = "\(output.targetVariable) = \(formatted) \(output.resultUnit)"
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(str, forType: .string)

        copiedFeedback = true
        Task {
            try? await Task.sleep(nanoseconds: 1_500_000_000)
            copiedFeedback = false
        }
    }
}
