import Foundation
import FormulaEngine

public struct FormulaVariable: Sendable, Equatable, Identifiable, Hashable {
    public var id: String { symbol }
    public let symbol: String
    public let name: String
    public let defaultUnit: String
    public let unitCategory: UnitCategory

    public init(symbol: String, name: String, defaultUnit: String, unitCategory: UnitCategory) {
        self.symbol = symbol
        self.name = name
        self.defaultUnit = defaultUnit
        self.unitCategory = unitCategory
    }
}

public struct FormulaCategoryItem: Sendable, Equatable, Identifiable, Hashable {
    public let id: String
    public let name: String
    public let iconName: String
    public let subcategories: [String]

    public init(id: String, name: String, iconName: String, subcategories: [String]) {
        self.id = id
        self.name = name
        self.iconName = iconName
        self.subcategories = subcategories
    }
}

public struct FormulaItem: Sendable, Equatable, Identifiable, Hashable {
    public let id: String
    public let name: String
    public let category: String
    public let subcategory: String
    public let rawEquation: String
    public let latex: String
    public let description: String
    public let variables: [FormulaVariable]

    public init(
        id: String,
        name: String,
        category: String,
        subcategory: String,
        rawEquation: String,
        latex: String,
        description: String,
        variables: [FormulaVariable]
    ) {
        self.id = id
        self.name = name
        self.category = category
        self.subcategory = subcategory
        self.rawEquation = rawEquation
        self.latex = latex
        self.description = description
        self.variables = variables
    }

    public var parsedEquation: Equation? {
        try? MathParser().parseEquation(rawEquation)
    }

    public var allSymbols: [String] {
        variables.map(\.symbol)
    }
}
