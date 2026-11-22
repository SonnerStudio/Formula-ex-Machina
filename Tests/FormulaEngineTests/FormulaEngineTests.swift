import Testing
@testable import FormulaEngine

@Suite("FormulaEngine Tests")
struct FormulaEngineTests {
    let parser = MathParser()
    let isolator = SymbolicIsolator()
    let evaluator = ExpressionEvaluator()
    let converter = UnitConverter.shared

    @Test("S-101: Numerische Evaluierung einfacher Ausdrücke")
    func testEvaluation() throws {
        let expr = try parser.parseExpression("v0 + a * t")
        let result = try evaluator.evaluate(expr, with: ["v0": 10.0, "a": 2.5, "t": 4.0])
        #expect(result == 20.0)

        // Division durch Null
        let divZero = try parser.parseExpression("10 / 0")
        #expect(throws: MathError.divisionByZero) {
            try evaluator.evaluate(divZero, with: [:])
        }

        // Quadratwurzel
        let sqrtExpr = try parser.parseExpression("sqrt(16)")
        let sqrtRes = try evaluator.evaluate(sqrtExpr, with: [:])
        #expect(sqrtRes == 4.0)
    }

    @Test("S-102: Symbolische Umstellung von F = m * a")
    func testNewtonIsolator() throws {
        let eq = try parser.parseEquation("F = m * a")

        // Umstellen nach m
        let resM = try isolator.isolate(target: "m", in: eq)
        #expect(resM.targetVariable == "m")
        let valM = try evaluator.evaluate(resM.isolatedExpression, with: ["F": 100.0, "a": 5.0])
        #expect(valM == 20.0)

        // Umstellen nach a
        let resA = try isolator.isolate(target: "a", in: eq)
        #expect(resA.targetVariable == "a")
        let valA = try evaluator.evaluate(resA.isolatedExpression, with: ["F": 100.0, "m": 25.0])
        #expect(valA == 4.0)
    }

    @Test("S-102: Symbolische Umstellung von E = m * c^2")
    func testEinsteinIsolator() throws {
        let eq = try parser.parseEquation("E = m * c^2")

        // Umstellen nach m
        let resM = try isolator.isolate(target: "m", in: eq)
        #expect(resM.targetVariable == "m")
        let valM = try evaluator.evaluate(resM.isolatedExpression, with: ["E": 9e16, "c": 3e8])
        #expect(abs(valM - 1.0) < 1e-9)

        // Umstellen nach c (sollte Wurzel ziehen)
        let resC = try isolator.isolate(target: "c", in: eq)
        #expect(resC.targetVariable == "c")
        let valC = try evaluator.evaluate(resC.isolatedExpression, with: ["E": 9e16, "m": 1.0])
        #expect(abs(valC - 3e8) < 1.0)
    }

    @Test("S-102: Symbolische Umstellung von v = v0 + a * t")
    func testKinematicsIsolator() throws {
        let eq = try parser.parseEquation("v = v0 + a * t")

        // Umstellen nach v0
        let resV0 = try isolator.isolate(target: "v0", in: eq)
        let valV0 = try evaluator.evaluate(resV0.isolatedExpression, with: ["v": 50.0, "a": 5.0, "t": 6.0])
        #expect(valV0 == 20.0)

        // Umstellen nach a
        let resA = try isolator.isolate(target: "a", in: eq)
        let valA = try evaluator.evaluate(resA.isolatedExpression, with: ["v": 50.0, "v0": 20.0, "t": 6.0])
        #expect(valA == 5.0)

        // Umstellen nach t
        let resT = try isolator.isolate(target: "t", in: eq)
        let valT = try evaluator.evaluate(resT.isolatedExpression, with: ["v": 50.0, "v0": 20.0, "a": 5.0])
        #expect(valT == 6.0)
    }

    @Test("S-104: Einheitenumrechnung")
    func testUnitConversions() {
        // km/h zu m/s
        let ms = converter.convert(value: 36.0, from: "km/h", to: "m/s")
        #expect(ms != nil && abs(ms! - 10.0) < 1e-6)

        // Stunden zu Sekunden
        let s = converter.convert(value: 2.0, from: "h", to: "s")
        #expect(s == 7200.0)

        // Bar zu Pascal
        let pa = converter.convert(value: 2.5, from: "bar", to: "Pa")
        #expect(pa == 250000.0)

        // Inkompatible Einheiten
        let invalid = converter.convert(value: 100.0, from: "km/h", to: "kg")
        #expect(invalid == nil)
    }
}
