import Foundation
import FormulaEngine

public struct FormulaCatalog: Sendable {
    public static let shared = FormulaCatalog()

    public let categories: [FormulaCategoryItem]
    public let formulas: [FormulaItem]

    public init() {
        self.categories = [
            FormulaCategoryItem(
                id: "physics",
                name: "Physik",
                iconName: "atom",
                subcategories: ["Kinematik", "Dynamik", "Arbeit & Energie", "Thermodynamik", "Relativität"]
            ),
            FormulaCategoryItem(
                id: "mathematics",
                name: "Mathematik",
                iconName: "function",
                subcategories: ["Geometrie", "Trigonometrie", "Algebra"]
            ),
            FormulaCategoryItem(
                id: "electrical",
                name: "Elektrotechnik",
                iconName: "bolt.fill",
                subcategories: ["Gleichstrom", "Wechselstrom"]
            ),
            FormulaCategoryItem(
                id: "finance",
                name: "Finanzmathematik",
                iconName: "banknote",
                subcategories: ["Zinsen & Barwert"]
            )
        ]

        var list: [FormulaItem] = []

        // 1. Physik - Kinematik
        list.append(FormulaItem(
            id: "phys_kin_speed",
            name: "Gleichförmige Bewegung",
            category: "Physik",
            subcategory: "Kinematik",
            rawEquation: "s = v * t",
            latex: "s = v \\cdot t",
            description: "Zurückgelegte Wegstrecke bei konstanter Geschwindigkeit über die Zeit.",
            variables: [
                FormulaVariable(symbol: "s", name: "Strecke", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "v", name: "Geschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "t", name: "Zeit", defaultUnit: "s", unitCategory: .time)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_kin_accel",
            name: "Gleichmäßig beschleunigte Bewegung",
            category: "Physik",
            subcategory: "Kinematik",
            rawEquation: "v = v0 + a * t",
            latex: "v = v_0 + a \\cdot t",
            description: "Momentangeschwindigkeit bei gleichmäßiger linearer Beschleunigung.",
            variables: [
                FormulaVariable(symbol: "v", name: "Endgeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "v0", name: "Anfangsgeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "a", name: "Beschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration),
                FormulaVariable(symbol: "t", name: "Zeit", defaultUnit: "s", unitCategory: .time)
            ]
        ))

        // 2. Physik - Dynamik
        list.append(FormulaItem(
            id: "phys_dyn_newton2",
            name: "2. Newtonsches Axiom (Grundgesetz)",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "F = m * a",
            latex: "F = m \\cdot a",
            description: "Kraft ist Masse mal Beschleunigung (Aktionsprinzip).",
            variables: [
                FormulaVariable(symbol: "F", name: "Kraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "m", name: "Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "a", name: "Beschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_dyn_weight",
            name: "Gewichtskraft",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "F = m * g",
            latex: "F_G = m \\cdot g",
            description: "Schwerkraft auf einen Körper der Masse m im Schwerefeld.",
            variables: [
                FormulaVariable(symbol: "F", name: "Gewichtskraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "m", name: "Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "g", name: "Erdbeschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration)
            ]
        ))

        // 3. Physik - Arbeit & Energie
        list.append(FormulaItem(
            id: "phys_energy_kin",
            name: "Kinetische Energie (Bewegungsenergie)",
            category: "Physik",
            subcategory: "Arbeit & Energie",
            rawEquation: "E = m * v^2 / 2",
            latex: "E_{\\text{kin}} = \\frac{1}{2} m v^2",
            description: "Mechanische Energie, die ein Körper aufgrund seiner Bewegung besitzt.",
            variables: [
                FormulaVariable(symbol: "E", name: "Kinetische Energie", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "m", name: "Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "v", name: "Geschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_energy_pot",
            name: "Potenzielle Energie (Lageenergie)",
            category: "Physik",
            subcategory: "Arbeit & Energie",
            rawEquation: "E = m * g * h",
            latex: "E_{\\text{pot}} = m \\cdot g \\cdot h",
            description: "Lageenergie eines Körpers im homogenen Gravitationsfeld der Höhe h.",
            variables: [
                FormulaVariable(symbol: "E", name: "Potenzielle Energie", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "m", name: "Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "g", name: "Fallbeschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration),
                FormulaVariable(symbol: "h", name: "Höhe", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_energy_power",
            name: "Mechanische Leistung",
            category: "Physik",
            subcategory: "Arbeit & Energie",
            rawEquation: "P = W / t",
            latex: "P = \\frac{W}{t}",
            description: "Arbeit W pro Zeitintervall t.",
            variables: [
                FormulaVariable(symbol: "P", name: "Leistung", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "W", name: "Arbeit", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "t", name: "Zeit", defaultUnit: "s", unitCategory: .time)
            ]
        ))

        // 4. Physik - Relativität
        list.append(FormulaItem(
            id: "phys_rel_einstein",
            name: "Masse-Energie-Äquivalenz",
            category: "Physik",
            subcategory: "Relativität",
            rawEquation: "E = m * c^2",
            latex: "E = m \\cdot c^2",
            description: "Einsteins berühmte Beziehung zwischen Masse und Ruheenergie.",
            variables: [
                FormulaVariable(symbol: "E", name: "Ruheenergie", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "m", name: "Ruhemasse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "c", name: "Lichtgeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        // 5. Elektrotechnik - Gleichstrom
        list.append(FormulaItem(
            id: "ee_ohm",
            name: "Ohmsches Gesetz",
            category: "Elektrotechnik",
            subcategory: "Gleichstrom",
            rawEquation: "U = R * I",
            latex: "U = R \\cdot I",
            description: "Zusammenhang zwischen Spannung, elektrischem Widerstand und Stromstärke.",
            variables: [
                FormulaVariable(symbol: "U", name: "Spannung", defaultUnit: "V", unitCategory: .electricVoltage),
                FormulaVariable(symbol: "R", name: "Widerstand", defaultUnit: "Ω", unitCategory: .electricResistance),
                FormulaVariable(symbol: "I", name: "Stromstärke", defaultUnit: "A", unitCategory: .electricCurrent)
            ]
        ))

        list.append(FormulaItem(
            id: "ee_power",
            name: "Elektrische Leistung",
            category: "Elektrotechnik",
            subcategory: "Gleichstrom",
            rawEquation: "P = U * I",
            latex: "P = U \\cdot I",
            description: "Momentane elektrische Gleichstromleistung.",
            variables: [
                FormulaVariable(symbol: "P", name: "Elektrische Leistung", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "U", name: "Spannung", defaultUnit: "V", unitCategory: .electricVoltage),
                FormulaVariable(symbol: "I", name: "Stromstärke", defaultUnit: "A", unitCategory: .electricCurrent)
            ]
        ))

        // 6. Mathematik - Geometrie
        list.append(FormulaItem(
            id: "math_geo_rect",
            name: "Rechteckfläche",
            category: "Mathematik",
            subcategory: "Geometrie",
            rawEquation: "A = a * b",
            latex: "A = a \\cdot b",
            description: "Flächeninhalt eines Rechtecks mit den Seiten a und b.",
            variables: [
                FormulaVariable(symbol: "A", name: "Flächeninhalt", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "a", name: "Länge", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "b", name: "Breite", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        self.formulas = list
    }

    public func find(id: String) -> FormulaItem? {
        formulas.first { $0.id == id }
    }

    public func search(query: String) -> [FormulaItem] {
        let q = query.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if q.isEmpty { return formulas }
        return formulas.filter {
            $0.name.lowercased().contains(q) ||
            $0.category.lowercased().contains(q) ||
            $0.subcategory.lowercased().contains(q) ||
            $0.rawEquation.lowercased().contains(q) ||
            $0.variables.contains(where: { $0.symbol.lowercased() == q || $0.name.lowercased().contains(q) })
        }
    }
}
