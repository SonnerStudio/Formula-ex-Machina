import Testing
@testable import FormulaEngine
@testable import FormulaExMachinaKit

@Suite("FormulaExMachinaKit Tests")
struct FormulaExMachinaKitTests {
    let catalog = FormulaCatalog.shared
    let service = CalculationService.shared

    @Test("S-201: Formelkatalog enthält Kategorien und Basisformeln")
    func testCatalogStructure() {
        #expect(!catalog.categories.isEmpty)
        #expect(!catalog.formulas.isEmpty)
        #expect(catalog.formulas.count >= 8)

        let newton = catalog.find(id: "phys_dyn_newton2")
        #expect(newton != nil)
        #expect(newton?.name == "2. Newtonsches Axiom (Grundgesetz)")
    }

    @Test("S-103 & S-104: Berechnung von F = m * a umgestellt nach m mit Einheitenumrechnung")
    func testNewtonCalculationWithUnits() throws {
        guard let formula = catalog.find(id: "phys_dyn_newton2") else {
            Issue.record("Formel nicht gefunden")
            return
        }

        // F = 2 kN (2000 N), a = 10 m/s² => m = 200 kg
        let output = try service.calculate(
            formula: formula,
            targetVariable: "m",
            rawInputs: ["F": 2.0, "a": 10.0],
            inputUnits: ["F": "kN", "a": "m/s²"],
            targetUnit: "kg"
        )

        #expect(output.targetVariable == "m")
        #expect(output.resultValue == 200.0)
        #expect(output.resultUnit == "kg")
        #expect(!output.steps.isEmpty)
    }

    @Test("S-103: Berechnung von v = v0 + a * t umgestellt nach a")
    func testKinematicsCalculation() throws {
        guard let formula = catalog.find(id: "phys_kin_accel") else {
            Issue.record("Formel nicht gefunden")
            return
        }

        // v = 100 km/h, v0 = 0 km/h, t = 10 s => a = 2.777777... m/s²
        let output = try service.calculate(
            formula: formula,
            targetVariable: "a",
            rawInputs: ["v": 108.0, "v0": 0.0, "t": 10.0],
            inputUnits: ["v": "km/h", "v0": "km/h", "t": "s"],
            targetUnit: "m/s²"
        )

        #expect(output.targetVariable == "a")
        // 108 km/h = 30 m/s; a = 30 / 10 = 3 m/s²
        #expect(abs(output.resultValue - 3.0) < 1e-4)
    }

    @Test("S-202: Formelsuche nach Stichworten")
    func testFormulaSearch() {
        let resultsNewton = catalog.search(query: "Newton")
        #expect(!resultsNewton.isEmpty)

        let resultsOhm = catalog.search(query: "Ohm")
        #expect(!resultsOhm.isEmpty)

        let resultsVar = catalog.search(query: "Spannung")
        #expect(!resultsVar.isEmpty)
    }

    @Test("S-204: Lokalisierung & Sprachumschaltung für 130 Sprachen")
    func testLocalizationService() {
        let l10n = LocalizationService.shared
        let registry = LanguageRegistry.shared

        #expect(registry.languages.count == 130)

        // Deutsch
        #expect(l10n.string(for: .disciplines, languageCode: "de") == "Fachgebiete")
        #expect(l10n.string(for: .rearrangeFor, languageCode: "de") == "Formel umstellen nach:")

        // Englisch
        #expect(l10n.string(for: .disciplines, languageCode: "en") == "Disciplines")
        #expect(l10n.string(for: .rearrangeFor, languageCode: "en") == "Solve formula for:")

        // Spanisch
        #expect(l10n.string(for: .disciplines, languageCode: "es") == "Disciplinas")

        // Französisch
        #expect(l10n.string(for: .disciplines, languageCode: "fr") == "Disciplines")

        // Chinesisch
        #expect(l10n.string(for: .disciplines, languageCode: "zh") == "学科门类")

        // Fallback für jede der 130 Sprachen existiert sauber
        for lang in registry.languages {
            let val = l10n.string(for: .disciplines, languageCode: lang.code)
            #expect(!val.isEmpty)
        }
    }

    @Test("S-205: Goldener Schnitt & Fibonacci Binet-Formel")
    func testGoldenRatioAndFibonacci() throws {
        // 1. Goldener Schnitt Definition: Phi = (1 + sqrt(5)) / 2 approx 1.6180339887
        let phiItem = catalog.find(id: "math_golden_ratio")
        #expect(phiItem != nil)

        // 2. Goldener Schnitt Proportion: a = b * 1.6180339887
        guard let propItem = catalog.find(id: "math_golden_ratio_prop") else {
            Issue.record("math_golden_ratio_prop nicht gefunden")
            return
        }
        let outProp = try service.calculate(
            formula: propItem,
            targetVariable: "a",
            rawInputs: ["b": 10.0],
            inputUnits: ["b": "m"],
            targetUnit: "m"
        )
        #expect(abs(outProp.resultValue - 16.180339887) < 1e-4)

        // 3. Fibonacci Binet-Formel: F_10 = 55
        guard let fibItem = catalog.find(id: "math_fibonacci_binet") else {
            Issue.record("math_fibonacci_binet nicht gefunden")
            return
        }
        let outFib = try service.calculate(
            formula: fibItem,
            targetVariable: "Fn",
            rawInputs: ["n": 10.0],
            inputUnits: ["n": "1"],
            targetUnit: "1"
        )
        // 10-te Fibonacci Zahl ist genau 55
        #expect(abs(outFib.resultValue - 55.0) < 1e-3)
    }
}
