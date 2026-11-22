import Foundation

public struct MathParser: Sendable {
    public init() {}

    private enum Token: Equatable {
        case number(Double)
        case identifier(String)
        case plus
        case minus
        case star
        case slash
        case caret
        case equals
        case leftParen
        case rightParen
    }

    public func parseEquation(_ input: String) throws -> Equation {
        let parts = input.split(separator: "=", maxSplits: 1)
        guard parts.count == 2 else {
            throw MathError.parseError("Gleichung muss genau ein Gleichheitszeichen '=' enthalten.")
        }

        let leftExpr = try parseExpression(String(parts[0]))
        let rightExpr = try parseExpression(String(parts[1]))
        return Equation(lhs: leftExpr, rhs: rightExpr)
    }

    public func parseExpression(_ input: String) throws -> MathNode {
        let tokens = try tokenize(input)
        var cursor = 0

        func peek() -> Token? {
            guard cursor < tokens.count else { return nil }
            return tokens[cursor]
        }

        func advance() -> Token? {
            guard cursor < tokens.count else { return nil }
            let t = tokens[cursor]
            cursor += 1
            return t
        }

        func parseAdditive() throws -> MathNode {
            var node = try parseMultiplicative()

            while let t = peek() {
                if t == .plus {
                    _ = advance()
                    let right = try parseMultiplicative()
                    node = .binary(op: .add, left: node, right: right)
                } else if t == .minus {
                    _ = advance()
                    let right = try parseMultiplicative()
                    node = .binary(op: .subtract, left: node, right: right)
                } else {
                    break
                }
            }
            return node
        }

        func parseMultiplicative() throws -> MathNode {
            var node = try parsePower()

            while let t = peek() {
                if t == .star {
                    _ = advance()
                    let right = try parsePower()
                    node = .binary(op: .multiply, left: node, right: right)
                } else if t == .slash {
                    _ = advance()
                    let right = try parsePower()
                    node = .fraction(numerator: node, denominator: right)
                } else {
                    break
                }
            }
            return node
        }

        func parsePower() throws -> MathNode {
            let base = try parseUnary()

            if peek() == .caret {
                _ = advance()
                let exponent = try parsePower() // Rechts-assoziativ
                return .power(base: base, exponent: exponent)
            }
            return base
        }

        func parseUnary() throws -> MathNode {
            if peek() == .minus {
                _ = advance()
                let child = try parseUnary()
                return .unary(op: .negate, child: child)
            }
            return try parsePrimary()
        }

        func parsePrimary() throws -> MathNode {
            guard let token = advance() else {
                throw MathError.parseError("Unerwartetes Ende des Ausdrucks.")
            }

            switch token {
            case .number(let n):
                return .number(n)

            case .identifier(let id):
                // Prüfen auf mathematische Funktionen
                if let fn = MathFunction(rawValue: id), peek() == .leftParen {
                    _ = advance() // '('
                    let arg = try parseAdditive()
                    guard advance() == .rightParen else {
                        throw MathError.parseError("Schließende Klammer ')' für Funktion '\(id)' fehlt.")
                    }
                    return .function(name: fn, argument: arg)
                }
                return .symbol(id)

            case .leftParen:
                let expr = try parseAdditive()
                guard advance() == .rightParen else {
                    throw MathError.parseError("Schließende Klammer ')' erwartet.")
                }
                return expr

            default:
                throw MathError.parseError("Unerwartetes Symbol: \(token)")
            }
        }

        let root = try parseAdditive()
        if cursor < tokens.count {
            throw MathError.parseError("Zusätzliche unerwartete Symbole am Ende des Ausdrucks.")
        }
        return root
    }

    private func tokenize(_ input: String) throws -> [Token] {
        var tokens: [Token] = []
        let chars = Array(input)
        var i = 0

        while i < chars.count {
            let c = chars[i]

            if c.isWhitespace {
                i += 1
                continue
            }

            if c == "+" {
                tokens.append(.plus)
                i += 1
            } else if c == "-" {
                tokens.append(.minus)
                i += 1
            } else if c == "*" || c == "·" || c == "×" {
                tokens.append(.star)
                i += 1
            } else if c == "/" {
                tokens.append(.slash)
                i += 1
            } else if c == "^" {
                tokens.append(.caret)
                i += 1
            } else if c == "=" {
                tokens.append(.equals)
                i += 1
            } else if c == "(" {
                tokens.append(.leftParen)
                i += 1
            } else if c == ")" {
                tokens.append(.rightParen)
                i += 1
            } else if c.isNumber || c == "." {
                var numStr = ""
                while i < chars.count && (chars[i].isNumber || chars[i] == ".") {
                    numStr.append(chars[i])
                    i += 1
                }
                guard let num = Double(numStr) else {
                    throw MathError.parseError("Ungültige Zahl: \(numStr)")
                }
                tokens.append(.number(num))
            } else if c.isLetter || c == "_" {
                var idStr = ""
                while i < chars.count && (chars[i].isLetter || chars[i].isNumber || chars[i] == "_") {
                    idStr.append(chars[i])
                    i += 1
                }
                tokens.append(.identifier(idStr))
            } else {
                throw MathError.parseError("Unerkanntes Zeichen: \(c)")
            }
        }

        return tokens
    }
}
