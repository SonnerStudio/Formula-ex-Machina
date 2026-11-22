import Foundation

public struct ExpressionEvaluator: Sendable {
    public init() {}

    public func evaluate(_ node: MathNode, with values: [String: Double]) throws -> Double {
        switch node {
        case .number(let value):
            return value

        case .symbol(let name):
            guard let val = values[name] else {
                throw MathError.undefinedVariable(name)
            }
            return val

        case .binary(let op, let left, let right):
            let leftVal = try evaluate(left, with: values)
            let rightVal = try evaluate(right, with: values)

            switch op {
            case .add:
                return leftVal + rightVal
            case .subtract:
                return leftVal - rightVal
            case .multiply:
                return leftVal * rightVal
            case .divide:
                if abs(rightVal) < 1e-15 {
                    throw MathError.divisionByZero
                }
                return leftVal / rightVal
            }

        case .unary(let op, let child):
            let childVal = try evaluate(child, with: values)
            switch op {
            case .negate:
                return -childVal
            }

        case .power(let base, let exponent):
            let baseVal = try evaluate(base, with: values)
            let expVal = try evaluate(exponent, with: values)
            let res = pow(baseVal, expVal)
            if res.isNaN {
                throw MathError.invalidFunctionArgument("Ungültige Potenzberechnung (\(baseVal)^\(expVal))")
            }
            return res

        case .fraction(let num, let den):
            let numVal = try evaluate(num, with: values)
            let denVal = try evaluate(den, with: values)
            if abs(denVal) < 1e-15 {
                throw MathError.divisionByZero
            }
            return numVal / denVal

        case .function(let fn, let arg):
            let argVal = try evaluate(arg, with: values)
            switch fn {
            case .sqrt:
                if argVal < 0 {
                    throw MathError.negativeSquareRoot
                }
                return sqrt(argVal)
            case .sin:
                return sin(argVal)
            case .cos:
                return cos(argVal)
            case .tan:
                return tan(argVal)
            case .ln:
                if argVal <= 0 {
                    throw MathError.invalidFunctionArgument("ln(x) erfordert x > 0")
                }
                return log(argVal)
            case .log10:
                if argVal <= 0 {
                    throw MathError.invalidFunctionArgument("log10(x) erfordert x > 0")
                }
                return log10(argVal)
            case .exp:
                return exp(argVal)
            }
        }
    }
}
