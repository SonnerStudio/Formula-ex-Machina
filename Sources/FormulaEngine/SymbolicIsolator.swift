import Foundation

public struct TransformationStep: Sendable, Equatable {
    public let stepNumber: Int
    public let explanation: String
    public let equation: Equation

    public init(stepNumber: Int, explanation: String, equation: Equation) {
        self.stepNumber = stepNumber
        self.explanation = explanation
        self.equation = equation
    }
}

public struct IsolationResult: Sendable, Equatable {
    public let targetVariable: String
    public let isolatedExpression: MathNode
    public let steps: [TransformationStep]

    public init(targetVariable: String, isolatedExpression: MathNode, steps: [TransformationStep]) {
        self.targetVariable = targetVariable
        self.isolatedExpression = isolatedExpression
        self.steps = steps
    }

    public var resultingEquation: Equation {
        Equation(lhs: .symbol(targetVariable), rhs: isolatedExpression)
    }
}

public struct SymbolicIsolator: Sendable {
    public init() {}

    /// Isoliert die Zielvariable in der übergebenen Gleichung
    public func isolate(target: String, in equation: Equation) throws -> IsolationResult {
        guard equation.contains(symbol: target) else {
            throw MathError.variableNotFound(target)
        }

        var currentEquation = equation
        var steps: [TransformationStep] = []
        var stepCount = 1

        steps.append(TransformationStep(
            stepNumber: stepCount,
            explanation: "Ausgangsgleichung",
            equation: currentEquation
        ))

        // Falls die Zielvariable bereits isoliert auf der linken Seite steht:
        if currentEquation.lhs == .symbol(target) && !currentEquation.rhs.contains(symbol: target) {
            return IsolationResult(targetVariable: target, isolatedExpression: currentEquation.rhs, steps: steps)
        }

        // Falls sie isoliert auf der rechten Seite steht:
        if currentEquation.rhs == .symbol(target) && !currentEquation.lhs.contains(symbol: target) {
            currentEquation = Equation(lhs: currentEquation.rhs, rhs: currentEquation.lhs)
            stepCount += 1
            steps.append(TransformationStep(
                stepNumber: stepCount,
                explanation: "Seiten der Gleichung vertauschen",
                equation: currentEquation
            ))
            return IsolationResult(targetVariable: target, isolatedExpression: currentEquation.rhs, steps: steps)
        }

        // Sicherstellen, dass das Symbol links steht
        if !currentEquation.lhs.contains(symbol: target) && currentEquation.rhs.contains(symbol: target) {
            currentEquation = Equation(lhs: currentEquation.rhs, rhs: currentEquation.lhs)
            stepCount += 1
            steps.append(TransformationStep(
                stepNumber: stepCount,
                explanation: "Seiten vertauschen, um Zielvariable nach links zu bringen",
                equation: currentEquation
            ))
        }

        // Iteratives Freistellen
        var iterations = 0
        let maxIterations = 20

        while currentEquation.lhs != .symbol(target) && iterations < maxIterations {
            iterations += 1
            let (nextEq, explanation) = try peelLayer(equation: currentEquation, target: target)
            currentEquation = nextEq
            stepCount += 1
            steps.append(TransformationStep(
                stepNumber: stepCount,
                explanation: explanation,
                equation: currentEquation
            ))
        }

        if currentEquation.lhs == .symbol(target) {
            return IsolationResult(
                targetVariable: target,
                isolatedExpression: currentEquation.rhs,
                steps: steps
            )
        } else {
            throw MathError.cannotIsolate("Die Variable '\(target)' konnte nicht vollständig algebraisch isoliert werden.")
        }
    }

    private func peelLayer(equation: Equation, target: String) throws -> (Equation, String) {
        let left = equation.lhs
        let right = equation.rhs

        switch left {
        case .symbol(let s) where s == target:
            return (equation, "Bereits isoliert.")

        // 1. Addition: (A + B) = R
        case .binary(.add, let a, let b):
            if a.contains(symbol: target) && !b.contains(symbol: target) {
                let nextEq = Equation(lhs: a, rhs: .binary(op: .subtract, left: right, right: b))
                return (nextEq, "Subtraktion von \(b) auf beiden Seiten")
            } else if b.contains(symbol: target) && !a.contains(symbol: target) {
                let nextEq = Equation(lhs: b, rhs: .binary(op: .subtract, left: right, right: a))
                return (nextEq, "Subtraktion von \(a) auf beiden Seiten")
            }

        // 2. Subtraktion: (A - B) = R
        case .binary(.subtract, let a, let b):
            if a.contains(symbol: target) && !b.contains(symbol: target) {
                let nextEq = Equation(lhs: a, rhs: .binary(op: .add, left: right, right: b))
                return (nextEq, "Addition von \(b) auf beiden Seiten")
            } else if b.contains(symbol: target) && !a.contains(symbol: target) {
                // A - B = R => B = A - R
                let nextEq = Equation(lhs: b, rhs: .binary(op: .subtract, left: a, right: right))
                return (nextEq, "Umstellen nach \(b) durch Subtraktion von \(a) und Multiplikation mit -1")
            }

        // 3. Multiplikation: (A * B) = R
        case .binary(.multiply, let a, let b):
            if a.contains(symbol: target) && !b.contains(symbol: target) {
                let nextEq = Equation(lhs: a, rhs: .fraction(numerator: right, denominator: b))
                return (nextEq, "Division durch \(b) auf beiden Seiten")
            } else if b.contains(symbol: target) && !a.contains(symbol: target) {
                let nextEq = Equation(lhs: b, rhs: .fraction(numerator: right, denominator: a))
                return (nextEq, "Division durch \(a) auf beiden Seiten")
            }

        // 4. Division / Bruch: (A / B) = R
        case .binary(.divide, let a, let b), .fraction(let a, let b):
            if a.contains(symbol: target) && !b.contains(symbol: target) {
                let nextEq = Equation(lhs: a, rhs: .binary(op: .multiply, left: right, right: b))
                return (nextEq, "Multiplikation mit \(b) auf beiden Seiten")
            } else if b.contains(symbol: target) && !a.contains(symbol: target) {
                // A / B = R => B = A / R
                let nextEq = Equation(lhs: b, rhs: .fraction(numerator: a, denominator: right))
                return (nextEq, "Multiplikation mit \(b) und Division durch \(right)")
            }

        // 5. Potenz: (A ^ B) = R
        case .power(let base, let exponent):
            if base.contains(symbol: target) && !exponent.contains(symbol: target) {
                if exponent == .number(2) {
                    let nextEq = Equation(lhs: base, rhs: .function(name: .sqrt, argument: right))
                    return (nextEq, "Beidseitiges Ziehen der Quadratwurzel")
                } else if case .number(let n) = exponent, n != 0 {
                    let invExp = MathNode.number(1.0 / n)
                    let nextEq = Equation(lhs: base, rhs: .power(base: right, exponent: invExp))
                    return (nextEq, "Potenzieren mit 1/\(n) auf beiden Seiten")
                }
            }

        // 6. Quadratwurzel: sqrt(A) = R
        case .function(.sqrt, let arg):
            if arg.contains(symbol: target) {
                let nextEq = Equation(lhs: arg, rhs: .power(base: right, exponent: .number(2)))
                return (nextEq, "Beidseitiges Quadrieren")
            }

        // 7. Unäres Minus: -A = R
        case .unary(.negate, let child):
            if child.contains(symbol: target) {
                let nextEq = Equation(lhs: child, rhs: .unary(op: .negate, child: right))
                return (nextEq, "Multiplikation mit -1 auf beiden Seiten")
            }

        default:
            break
        }

        throw MathError.cannotIsolate("Struktur von '\(left)' konnte nicht weiter aufgelöst werden.")
    }
}
