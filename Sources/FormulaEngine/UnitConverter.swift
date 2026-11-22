import Foundation

public enum UnitCategory: String, Sendable, CaseIterable {
    case length = "Länge"
    case time = "Zeit"
    case mass = "Masse"
    case velocity = "Geschwindigkeit"
    case acceleration = "Beschleunigung"
    case force = "Kraft"
    case energy = "Energie & Arbeit"
    case power = "Leistung"
    case pressure = "Druck"
    case electricVoltage = "Elektrische Spannung"
    case electricCurrent = "Elektrische Stromstärke"
    case electricResistance = "Elektrischer Widerstand"
    case temperature = "Temperatur"
    case dimensionless = "Dimensionslos / Zahl"
}

public struct UnitDefinition: Sendable, Equatable, Identifiable, Hashable {
    public var id: String { symbol }
    public let symbol: String
    public let name: String
    public let category: UnitCategory
    public let factorToSI: Double
    public let offsetToSI: Double

    public init(symbol: String, name: String, category: UnitCategory, factorToSI: Double, offsetToSI: Double = 0.0) {
        self.symbol = symbol
        self.name = name
        self.category = category
        self.factorToSI = factorToSI
        self.offsetToSI = offsetToSI
    }
}

public struct UnitConverter: Sendable {
    public static let shared = UnitConverter()

    public let units: [UnitDefinition]

    public init() {
        var list: [UnitDefinition] = []

        // Länge (SI: m)
        list.append(UnitDefinition(symbol: "m", name: "Meter", category: .length, factorToSI: 1.0))
        list.append(UnitDefinition(symbol: "km", name: "Kilometer", category: .length, factorToSI: 1000.0))
        list.append(UnitDefinition(symbol: "cm", name: "Zentimeter", category: .length, factorToSI: 0.01))
        list.append(UnitDefinition(symbol: "mm", name: "Millimeter", category: .length, factorToSI: 0.001))
        list.append(UnitDefinition(symbol: "in", name: "Zoll (Inch)", category: .length, factorToSI: 0.0254))
        list.append(UnitDefinition(symbol: "ft", name: "Fuß (Foot)", category: .length, factorToSI: 0.3048))
        list.append(UnitDefinition(symbol: "mi", name: "Meile", category: .length, factorToSI: 1609.344))

        // Zeit (SI: s)
        list.append(UnitDefinition(symbol: "s", name: "Sekunde", category: .time, factorToSI: 1.0))
        list.append(UnitDefinition(symbol: "min", name: "Minute", category: .time, factorToSI: 60.0))
        list.append(UnitDefinition(symbol: "h", name: "Stunde", category: .time, factorToSI: 3600.0))
        list.append(UnitDefinition(symbol: "ms", name: "Millisekunde", category: .time, factorToSI: 0.001))
        list.append(UnitDefinition(symbol: "d", name: "Tag", category: .time, factorToSI: 86400.0))

        // Masse (SI: kg)
        list.append(UnitDefinition(symbol: "kg", name: "Kilogramm", category: .mass, factorToSI: 1.0))
        list.append(UnitDefinition(symbol: "g", name: "Gramm", category: .mass, factorToSI: 0.001))
        list.append(UnitDefinition(symbol: "mg", name: "Milligramm", category: .mass, factorToSI: 1e-6))
        list.append(UnitDefinition(symbol: "t", name: "Tonne", category: .mass, factorToSI: 1000.0))
        list.append(UnitDefinition(symbol: "lb", name: "Pfund", category: .mass, factorToSI: 0.45359237))

        // Geschwindigkeit (SI: m/s)
        list.append(UnitDefinition(symbol: "m/s", name: "Meter pro Sekunde", category: .velocity, factorToSI: 1.0))
        list.append(UnitDefinition(symbol: "km/h", name: "Kilometer pro Stunde", category: .velocity, factorToSI: 1.0 / 3.6))
        list.append(UnitDefinition(symbol: "mph", name: "Meilen pro Stunde", category: .velocity, factorToSI: 0.44704))
        list.append(UnitDefinition(symbol: "kn", name: "Knoten", category: .velocity, factorToSI: 0.514444))

        // Beschleunigung (SI: m/s²)
        list.append(UnitDefinition(symbol: "m/s²", name: "Meter pro Sekunde²", category: .acceleration, factorToSI: 1.0))
        list.append(UnitDefinition(symbol: "g", name: "Erdbeschleunigung", category: .acceleration, factorToSI: 9.80665))

        // Kraft (SI: N)
        list.append(UnitDefinition(symbol: "N", name: "Newton", category: .force, factorToSI: 1.0))
        list.append(UnitDefinition(symbol: "kN", name: "Kilonewton", category: .force, factorToSI: 1000.0))

        // Energie (SI: J)
        list.append(UnitDefinition(symbol: "J", name: "Joule", category: .energy, factorToSI: 1.0))
        list.append(UnitDefinition(symbol: "kJ", name: "Kilojoule", category: .energy, factorToSI: 1000.0))
        list.append(UnitDefinition(symbol: "MJ", name: "Megajoule", category: .energy, factorToSI: 1e6))
        list.append(UnitDefinition(symbol: "Wh", name: "Wattstunde", category: .energy, factorToSI: 3600.0))
        list.append(UnitDefinition(symbol: "kWh", name: "Kilowattstunde", category: .energy, factorToSI: 3.6e6))
        list.append(UnitDefinition(symbol: "cal", name: "Kalorie", category: .energy, factorToSI: 4.184))
        list.append(UnitDefinition(symbol: "kcal", name: "Kilokalorie", category: .energy, factorToSI: 4184.0))

        // Leistung (SI: W)
        list.append(UnitDefinition(symbol: "W", name: "Watt", category: .power, factorToSI: 1.0))
        list.append(UnitDefinition(symbol: "kW", name: "Kilowatt", category: .power, factorToSI: 1000.0))
        list.append(UnitDefinition(symbol: "MW", name: "Megawatt", category: .power, factorToSI: 1e6))
        list.append(UnitDefinition(symbol: "PS", name: "Pferdestärke", category: .power, factorToSI: 735.49875))

        // Druck (SI: Pa)
        list.append(UnitDefinition(symbol: "Pa", name: "Pascal", category: .pressure, factorToSI: 1.0))
        list.append(UnitDefinition(symbol: "hPa", name: "Hektopascal", category: .pressure, factorToSI: 100.0))
        list.append(UnitDefinition(symbol: "kPa", name: "Kilopascal", category: .pressure, factorToSI: 1000.0))
        list.append(UnitDefinition(symbol: "bar", name: "Bar", category: .pressure, factorToSI: 100000.0))
        list.append(UnitDefinition(symbol: "mbar", name: "Millibar", category: .pressure, factorToSI: 100.0))
        list.append(UnitDefinition(symbol: "psi", name: "PSI (Pfund/Zoll²)", category: .pressure, factorToSI: 6894.757))

        // Elektrik
        list.append(UnitDefinition(symbol: "V", name: "Volt", category: .electricVoltage, factorToSI: 1.0))
        list.append(UnitDefinition(symbol: "kV", name: "Kilovolt", category: .electricVoltage, factorToSI: 1000.0))
        list.append(UnitDefinition(symbol: "mV", name: "Millivolt", category: .electricVoltage, factorToSI: 0.001))

        list.append(UnitDefinition(symbol: "A", name: "Ampere", category: .electricCurrent, factorToSI: 1.0))
        list.append(UnitDefinition(symbol: "mA", name: "Milliampere", category: .electricCurrent, factorToSI: 0.001))

        list.append(UnitDefinition(symbol: "Ω", name: "Ohm", category: .electricResistance, factorToSI: 1.0))
        list.append(UnitDefinition(symbol: "kΩ", name: "Kiloohm", category: .electricResistance, factorToSI: 1000.0))
        list.append(UnitDefinition(symbol: "MΩ", name: "Megaohm", category: .electricResistance, factorToSI: 1e6))

        // Temperatur (SI: K)
        list.append(UnitDefinition(symbol: "K", name: "Kelvin", category: .temperature, factorToSI: 1.0, offsetToSI: 0.0))
        list.append(UnitDefinition(symbol: "°C", name: "Grad Celsius", category: .temperature, factorToSI: 1.0, offsetToSI: 273.15))
        list.append(UnitDefinition(symbol: "°F", name: "Grad Fahrenheit", category: .temperature, factorToSI: 5.0 / 9.0, offsetToSI: 273.15 - 32.0 * (5.0 / 9.0)))

        // Dimensionslos / Reine Zahlen (SI: 1)
        list.append(UnitDefinition(symbol: "1", name: "Einheitenlos", category: .dimensionless, factorToSI: 1.0))
        list.append(UnitDefinition(symbol: "%", name: "Prozent", category: .dimensionless, factorToSI: 0.01))
        list.append(UnitDefinition(symbol: "‰", name: "Promille", category: .dimensionless, factorToSI: 0.001))
        list.append(UnitDefinition(symbol: "ppm", name: "Parts per million", category: .dimensionless, factorToSI: 1e-6))

        self.units = list
    }

    public func find(symbol: String) -> UnitDefinition? {
        units.first { $0.symbol == symbol }
    }

    public func units(for category: UnitCategory) -> [UnitDefinition] {
        units.filter { $0.category == category }
    }

    /// Konvertiert einen Wert von einer Quell- in eine Zieleinheit
    public func convert(value: Double, from fromSymbol: String, to toSymbol: String) -> Double? {
        if fromSymbol == toSymbol { return value }
        guard let fromUnit = find(symbol: fromSymbol),
              let toUnit = find(symbol: toSymbol),
              fromUnit.category == toUnit.category else {
            return nil
        }

        // Wert in SI-Basiseinheit
        let siValue = (value * fromUnit.factorToSI) + fromUnit.offsetToSI
        // Aus SI in Zieleinheit
        let targetValue = (siValue - toUnit.offsetToSI) / toUnit.factorToSI
        return targetValue
    }
}
