import Foundation

public enum BinaryOperator: String, Sendable, Equatable, CaseIterable {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"

    public var precedence: Int {
        switch self {
        case .add, .subtract: return 1
        case .multiply, .divide: return 2
        }
    }
}

public enum UnaryOperator: String, Sendable, Equatable {
    case negate = "-"
}

public enum MathFunction: String, Sendable, Equatable, CaseIterable {
    case sqrt = "sqrt"
    case sin = "sin"
    case cos = "cos"
    case tan = "tan"
    case ln = "ln"
    case log10 = "log10"
    case exp = "exp"
}

public indirect enum MathNode: Sendable, Equatable, CustomStringConvertible {
    case number(Double)
    case symbol(String)
    case binary(op: BinaryOperator, left: MathNode, right: MathNode)
    case unary(op: UnaryOperator, child: MathNode)
    case power(base: MathNode, exponent: MathNode)
    case fraction(numerator: MathNode, denominator: MathNode)
    case function(name: MathFunction, argument: MathNode)

    public var description: String {
        switch self {
        case .number(let value):
            if value.truncatingRemainder(dividingBy: 1) == 0 {
                return String(Int(value))
            } else {
                return String(value)
            }
        case .symbol(let name):
            return name
        case .binary(let op, let left, let right):
            return "(\(left) \(op.rawValue) \(right))"
        case .unary(let op, let child):
            return "\(op.rawValue)(\(child))"
        case .power(let base, let exponent):
            return "(\(base)^\(exponent))"
        case .fraction(let num, let den):
            return "(\(num) / \(den))"
        case .function(let fn, let arg):
            return "\(fn.rawValue)(\(arg))"
        }
    }

    /// Gibt alle vorkommenden Symbole zurück
    public var symbols: Set<String> {
        switch self {
        case .number:
            return []
        case .symbol(let name):
            return [name]
        case .binary(_, let left, let right):
            return left.symbols.union(right.symbols)
        case .unary(_, let child):
            return child.symbols
        case .power(let base, let exp):
            return base.symbols.union(exp.symbols)
        case .fraction(let num, let den):
            return num.symbols.union(den.symbols)
        case .function(_, let arg):
            return arg.symbols
        }
    }

    /// Prüft, ob ein Symbol im Baum enthalten ist
    public func contains(symbol: String) -> Bool {
        symbols.contains(symbol)
    }

    /// Erzeugt eine LaTeX-Darstellung des Knotens
    public var toLaTeX: String {
        switch self {
        case .number(let value):
            if value.truncatingRemainder(dividingBy: 1) == 0 {
                return String(Int(value))
            }
            return String(value)
        case .symbol(let name):
            if name.count > 1 && !name.contains("_") {
                return "\\text{\(name)}"
            }
            return name
        case .binary(let op, let left, let right):
            switch op {
            case .add:
                return "\(left.toLaTeX) + \(right.toLaTeX)"
            case .subtract:
                return "\(left.toLaTeX) - \(right.toLaTeX)"
            case .multiply:
                return "\(left.toLaTeX) \\cdot \(right.toLaTeX)"
            case .divide:
                return "\\frac{\(left.toLaTeX)}{\(right.toLaTeX)}"
            }
        case .unary(let op, let child):
            return "\(op.rawValue)\(child.toLaTeX)"
        case .power(let base, let exponent):
            return "{\(base.toLaTeX)}^{\(exponent.toLaTeX)}"
        case .fraction(let num, let den):
            return "\\frac{\(num.toLaTeX)}{\(den.toLaTeX)}"
        case .function(let fn, let arg):
            switch fn {
            case .sqrt:
                return "\\sqrt{\(arg.toLaTeX)}"
            default:
                return "\\\(fn.rawValue)(\(arg.toLaTeX))"
            }
        }
    }
}
