import Foundation

public enum MathError: Error, Sendable, Equatable, LocalizedError {
    case divisionByZero
    case negativeSquareRoot
    case undefinedVariable(String)
    case invalidFunctionArgument(String)
    case parseError(String)
    case variableNotFound(String)
    case cannotIsolate(String)

    public var errorDescription: String? {
        switch self {
        case .divisionByZero:
            return "Division durch Null ist nicht definiert."
        case .negativeSquareRoot:
            return "Wurzel aus einer negativen Zahl kann im Reellen nicht gezogen werden."
        case .undefinedVariable(let v):
            return "Die Variable '\(v)' ist nicht belegt."
        case .invalidFunctionArgument(let msg):
            return "Ungültiges Funktionsargument: \(msg)"
        case .parseError(let msg):
            return "Syntaxfehler: \(msg)"
        case .variableNotFound(let v):
            return "Die Variable '\(v)' kommt in der Gleichung nicht vor."
        case .cannotIsolate(let msg):
            return "Gleichung konnte nicht isoliert werden: \(msg)"
        }
    }
}

public struct Equation: Sendable, Equatable, CustomStringConvertible {
    public let lhs: MathNode
    public let rhs: MathNode

    public init(lhs: MathNode, rhs: MathNode) {
        self.lhs = lhs
        self.rhs = rhs
    }

    public var description: String {
        "\(lhs) = \(rhs)"
    }

    public var toLaTeX: String {
        "\(lhs.toLaTeX) = \(rhs.toLaTeX)"
    }

    public var allSymbols: Set<String> {
        lhs.symbols.union(rhs.symbols)
    }

    public func contains(symbol: String) -> Bool {
        allSymbols.contains(symbol)
    }
}
