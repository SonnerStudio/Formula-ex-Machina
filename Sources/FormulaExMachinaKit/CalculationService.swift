import Foundation
import FormulaEngine

public struct CalculationOutput: Sendable, Equatable {
    public let targetVariable: String
    public let resultValue: Double
    public let resultUnit: String
    public let isolatedFormulaLaTeX: String
    public let steps: [TransformationStep]
    public let siValue: Double

    public init(
        targetVariable: String,
        resultValue: Double,
        resultUnit: String,
        isolatedFormulaLaTeX: String,
        steps: [TransformationStep],
        siValue: Double
    ) {
        self.targetVariable = targetVariable
        self.resultValue = resultValue
        self.resultUnit = resultUnit
        self.isolatedFormulaLaTeX = isolatedFormulaLaTeX
        self.steps = steps
        self.siValue = siValue
    }
}

public struct CalculationService: Sendable {
    public static let shared = CalculationService()

    private let isolator = SymbolicIsolator()
    private let evaluator = ExpressionEvaluator()
    private let converter = UnitConverter.shared

    public init() {}

    /// Führt die vollständige Berechnung einer Formel durch
    /// - Parameters:
    ///   - formula: Das Formelmodell
    ///   - targetVariable: Die freizustellende Zielvariable (z. B. "m")
    ///   - rawInputs: Eingegebene Werte der anderen Variablen (z. B. ["F": 100.0, "a": 5.0])
    ///   - inputUnits: Gewählte Einheiten der Eingaben (z. B. ["F": "N", "a": "m/s²"])
    ///   - targetUnit: Gewünschte Zieleinheit für das Ergebnis (z. B. "kg")
    public func calculate(
        formula: FormulaItem,
        targetVariable: String,
        rawInputs: [String: Double],
        inputUnits: [String: String],
        targetUnit: String
    ) throws -> CalculationOutput {
        guard let equation = formula.parsedEquation else {
            throw MathError.parseError("Formelgleichung '\(formula.rawEquation)' konnte nicht geparst werden.")
        }

        // 1. Symbolisch nach targetVariable umstellen
        let isolation = try isolator.isolate(target: targetVariable, in: equation)

        // 2. Eingaben in SI-Basiseinheiten umrechnen
        var siInputs: [String: Double] = [:]
        for variable in formula.variables where variable.symbol != targetVariable {
            let symbol = variable.symbol
            guard let rawVal = rawInputs[symbol] else {
                throw MathError.undefinedVariable(symbol)
            }

            let selectedUnit = inputUnits[symbol] ?? variable.defaultUnit
            let siVal = converter.convert(value: rawVal, from: selectedUnit, to: variable.defaultUnit) ?? rawVal
            siInputs[symbol] = siVal
        }

        // 3. Auswertung des isolierten mathematischen Ausdrucks in SI-Einheiten
        let calculatedSIValue = try evaluator.evaluate(isolation.isolatedExpression, with: siInputs)

        // 4. Umrechnung des SI-Ergebnisses in die gewünschte Zieleinheit
        let defaultTargetUnit = formula.variables.first { $0.symbol == targetVariable }?.defaultUnit ?? targetUnit
        let finalValue = converter.convert(value: calculatedSIValue, from: defaultTargetUnit, to: targetUnit) ?? calculatedSIValue

        return CalculationOutput(
            targetVariable: targetVariable,
            resultValue: finalValue,
            resultUnit: targetUnit,
            isolatedFormulaLaTeX: "\(targetVariable) = \(isolation.isolatedExpression.toLaTeX)",
            steps: isolation.steps,
            siValue: calculatedSIValue
        )
    }
}
