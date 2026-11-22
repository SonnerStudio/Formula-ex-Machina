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
                subcategories: [
                    "Kinematik",
                    "Dynamik",
                    "Arbeit & Energie",
                    "Thermodynamik",
                    "Strömungsmechanik",
                    "Schwingungen & Wellen",
                    "Optik & Strahlung",
                    "Elektromagnetismus",
                    "Relativität & Moderne Physik",
                    "Astrophysik & Kosmologie"
                ]
            ),
            FormulaCategoryItem(
                id: "mathematics",
                name: "Mathematik",
                iconName: "function",
                subcategories: [
                    "Geometrie 2D (Flächen)",
                    "Geometrie 3D (Körper)",
                    "Trigonometrie",
                    "Algebra & Analysis",
                    "Statistik & Wahrscheinlichkeit"
                ]
            ),
            FormulaCategoryItem(
                id: "electrical",
                name: "Elektrotechnik",
                iconName: "bolt.fill",
                subcategories: [
                    "Gleichstrom",
                    "Wechselstrom & Scheinleistung",
                    "Elektronik & Signale"
                ]
            ),
            FormulaCategoryItem(
                id: "chemistry",
                name: "Chemie",
                iconName: "flask.fill",
                subcategories: [
                    "Stöchiometrie & Konzentration",
                    "Thermochemie & Kinetik",
                    "Elektrochemie & pH-Werte"
                ]
            ),
            FormulaCategoryItem(
                id: "engineering",
                name: "Maschinenbau & Statik",
                iconName: "gearshape.2.fill",
                subcategories: [
                    "Festigkeitslehre & Elastizität",
                    "Antriebstechnik & Dynamik"
                ]
            ),
            FormulaCategoryItem(
                id: "finance",
                name: "Finanzmathematik",
                iconName: "banknote",
                subcategories: [
                    "Zinsrechnung & Barwert",
                    "Kredite & Annuitäten"
                ]
            ),
            FormulaCategoryItem(
                id: "computerscience",
                name: "Informatik & Information",
                iconName: "cpu",
                subcategories: [
                    "Informationstheorie & Codierung"
                ]
            )
        ]

        var list: [FormulaItem] = []

        // ==========================================
        // 1. PHYSIK
        // ==========================================

        // --- 1.1 Kinematik ---
        list.append(FormulaItem(
            id: "phys_kin_speed",
            name: "Gleichförmige Bewegung",
            category: "Physik",
            subcategory: "Kinematik",
            rawEquation: "s = v * t",
            latex: "s = v \\cdot t",
            description: "Zurückgelegte Wegstrecke bei konstanter Geschwindigkeit über die Zeit.",
            variables: [
                FormulaVariable(symbol: "s", name: "Wegstrecke", defaultUnit: "m", unitCategory: .length),
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

        list.append(FormulaItem(
            id: "phys_kin_zentripetal",
            name: "Zentripetalbeschleunigung",
            category: "Physik",
            subcategory: "Kinematik",
            rawEquation: "a = v^2 / r",
            latex: "a_z = \\frac{v^2}{r}",
            description: "Radialbeschleunigung zur Kreisbahnmitte bei Geschwindigkeit v und Bahnradius r.",
            variables: [
                FormulaVariable(symbol: "a", name: "Zentripetalbeschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration),
                FormulaVariable(symbol: "v", name: "Bahngeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "r", name: "Bahnradius", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_kin_omega",
            name: "Winkelgeschwindigkeit & Frequenz",
            category: "Physik",
            subcategory: "Kinematik",
            rawEquation: "w = 6.2831853 * f",
            latex: "\\omega = 2 \\pi \\cdot f",
            description: "Kreisfrequenz bzw. Winkelgeschwindigkeit in Abhängigkeit von der Drehfrequenz.",
            variables: [
                FormulaVariable(symbol: "w", name: "Winkelgeschwindigkeit (ω)", defaultUnit: "1/s", unitCategory: .time),
                FormulaVariable(symbol: "f", name: "Frequenz (f)", defaultUnit: "Hz", unitCategory: .time)
            ]
        ))

        // --- 1.2 Dynamik ---
        list.append(FormulaItem(
            id: "phys_dyn_newton2",
            name: "2. Newtonsches Axiom (Grundgesetz)",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "F = m * a",
            latex: "F = m \\cdot a",
            description: "Grundgesetz der Mechanik: Kraft ist Masse mal Beschleunigung.",
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
            description: "Schwerkraft auf eine Masse m im Schwerefeld der Erdbeschleunigung g.",
            variables: [
                FormulaVariable(symbol: "F", name: "Gewichtskraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "m", name: "Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "g", name: "Erdbeschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_dyn_hooke",
            name: "Hookesches Federgesetz",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "F = D * s",
            latex: "F = D \\cdot s",
            description: "Rückstellkraft einer linearen elastischen Feder bei Auslenkung s.",
            variables: [
                FormulaVariable(symbol: "F", name: "Federkraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "D", name: "Federkonstante", defaultUnit: "N/m", unitCategory: .force),
                FormulaVariable(symbol: "s", name: "Auslenkung / Weg", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_dyn_reibung",
            name: "Reibungskraft (Gleitreibung)",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "FR = mu * FN",
            latex: "F_R = \\mu \\cdot F_N",
            description: "Reibungskraft auf einen Körper bei Normalkraft FN und Reibbeiwert mu.",
            variables: [
                FormulaVariable(symbol: "FR", name: "Reibungskraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "mu", name: "Reibungszahl (μ)", defaultUnit: "1", unitCategory: .mass),
                FormulaVariable(symbol: "FN", name: "Normalkraft", defaultUnit: "N", unitCategory: .force)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_dyn_impuls",
            name: "Impuls",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "p = m * v",
            latex: "p = m \\cdot v",
            description: "Linearer Bewegungsimpuls eines Körpers.",
            variables: [
                FormulaVariable(symbol: "p", name: "Impuls", defaultUnit: "kg·m/s", unitCategory: .force),
                FormulaVariable(symbol: "m", name: "Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "v", name: "Geschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_dyn_drehmoment",
            name: "Drehmoment",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "M = F * r",
            latex: "M = F \\cdot r",
            description: "Drehmoment einer senkrecht auf einen Hebelarm wirkenden Kraft.",
            variables: [
                FormulaVariable(symbol: "M", name: "Drehmoment", defaultUnit: "Nm", unitCategory: .energy),
                FormulaVariable(symbol: "F", name: "Kraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "r", name: "Hebelarm", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // --- 1.3 Arbeit & Energie ---
        list.append(FormulaItem(
            id: "phys_energy_work",
            name: "Mechanische Arbeit",
            category: "Physik",
            subcategory: "Arbeit & Energie",
            rawEquation: "W = F * s",
            latex: "W = F \\cdot s",
            description: "Arbeit entlang eines Weges s bei konstanter paralleler Kraft F.",
            variables: [
                FormulaVariable(symbol: "W", name: "Arbeit", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "F", name: "Kraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "s", name: "Weg", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_energy_kin",
            name: "Kinetische Energie (Bewegungsenergie)",
            category: "Physik",
            subcategory: "Arbeit & Energie",
            rawEquation: "E = m * v^2 / 2",
            latex: "E_{\\text{kin}} = \\frac{1}{2} m v^2",
            description: "Bewegungsenergie eines Körpers der Masse m mit Geschwindigkeit v.",
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
            description: "Lageenergie eines Körpers der Masse m in der Höhe h im Schwerefeld g.",
            variables: [
                FormulaVariable(symbol: "E", name: "Potenzielle Energie", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "m", name: "Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "g", name: "Erdbeschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration),
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
            description: "Leistung als verrichtete Arbeit pro Zeitintervall.",
            variables: [
                FormulaVariable(symbol: "P", name: "Leistung", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "W", name: "Arbeit", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "t", name: "Zeit", defaultUnit: "s", unitCategory: .time)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_energy_eta",
            name: "Mechanischer Wirkungsgrad",
            category: "Physik",
            subcategory: "Arbeit & Energie",
            rawEquation: "eta = Pab / Pzu",
            latex: "\\eta = \\frac{P_{\\text{ab}}}{P_{\\text{zu}}}",
            description: "Verhältnis von abgegebener Nutzleistung zur zugeführten Gesamtleistung.",
            variables: [
                FormulaVariable(symbol: "eta", name: "Wirkungsgrad (η)", defaultUnit: "1", unitCategory: .mass),
                FormulaVariable(symbol: "Pab", name: "Abgegebene Leistung", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "Pzu", name: "Zugeführte Leistung", defaultUnit: "W", unitCategory: .power)
            ]
        ))

        // --- 1.4 Thermodynamik ---
        list.append(FormulaItem(
            id: "phys_thermo_gas",
            name: "Ideales Gasgesetz",
            category: "Physik",
            subcategory: "Thermodynamik",
            rawEquation: "p * V = n * R * T",
            latex: "p \\cdot V = n \\cdot R \\cdot T",
            description: "Zustandsgleichung des idealen Gases mit Druck, Volumen, Stoffmenge und Temperatur.",
            variables: [
                FormulaVariable(symbol: "p", name: "Druck", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "V", name: "Volumen", defaultUnit: "m³", unitCategory: .length),
                FormulaVariable(symbol: "n", name: "Stoffmenge", defaultUnit: "mol", unitCategory: .mass),
                FormulaVariable(symbol: "R", name: "Universelle Gaskonstante", defaultUnit: "J/(mol·K)", unitCategory: .energy),
                FormulaVariable(symbol: "T", name: "Absolute Temperatur", defaultUnit: "K", unitCategory: .temperature)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_thermo_heat",
            name: "Spezifische Wärmemenge",
            category: "Physik",
            subcategory: "Thermodynamik",
            rawEquation: "Q = m * c * dT",
            latex: "Q = m \\cdot c \\cdot \\Delta T",
            description: "Benötigte thermische Energie zur Erwärmung einer Masse m um Temperaturdifferenz ΔT.",
            variables: [
                FormulaVariable(symbol: "Q", name: "Wärmemenge", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "m", name: "Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "c", name: "Spezifische Wärmekapazität", defaultUnit: "J/(kg·K)", unitCategory: .energy),
                FormulaVariable(symbol: "dT", name: "Temperaturdifferenz (ΔT)", defaultUnit: "K", unitCategory: .temperature)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_thermo_carnot",
            name: "Carnot-Wirkungsgrad",
            category: "Physik",
            subcategory: "Thermodynamik",
            rawEquation: "eta = 1 - Tk / Tw",
            latex: "\\eta_C = 1 - \\frac{T_{\\text{kalt}}}{T_{\\text{warm}}}",
            description: "Theoretisch maximal möglicher thermodynamischer Wirkungsgrad einer Wärmekraftmaschine.",
            variables: [
                FormulaVariable(symbol: "eta", name: "Carnot-Wirkungsgrad (η)", defaultUnit: "1", unitCategory: .mass),
                FormulaVariable(symbol: "Tk", name: "Temperatur Kaltes Reservoir", defaultUnit: "K", unitCategory: .temperature),
                FormulaVariable(symbol: "Tw", name: "Temperatur Warmes Reservoir", defaultUnit: "K", unitCategory: .temperature)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_thermo_stefan",
            name: "Stefan-Boltzmann-Strahlungsgesetz",
            category: "Physik",
            subcategory: "Thermodynamik",
            rawEquation: "P = 5.67e-8 * A * T^4",
            latex: "P = \\sigma \\cdot A \\cdot T^4",
            description: "Gesamte Strahlungsleistung eines schwarzen Körpers der Fläche A bei Temperatur T.",
            variables: [
                FormulaVariable(symbol: "P", name: "Strahlungsleistung", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "A", name: "Oberfläche", defaultUnit: "m²", unitCategory: .length),
                FormulaVariable(symbol: "T", name: "Temperatur", defaultUnit: "K", unitCategory: .temperature)
            ]
        ))

        // --- 1.5 Strömungsmechanik ---
        list.append(FormulaItem(
            id: "phys_fluid_druck",
            name: "Hydrostatischer Druck",
            category: "Physik",
            subcategory: "Strömungsmechanik",
            rawEquation: "p = rho * g * h",
            latex: "p = \\rho \\cdot g \\cdot h",
            description: "Schweredruck in einer ruhenden Flüssigkeitssäule der Dichte ρ in Tiefe h.",
            variables: [
                FormulaVariable(symbol: "p", name: "Hydrostatischer Druck", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "rho", name: "Dichte des Fluids", defaultUnit: "kg/m³", unitCategory: .mass),
                FormulaVariable(symbol: "g", name: "Erdbeschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration),
                FormulaVariable(symbol: "h", name: "Eintauchtiefe", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_fluid_auftrieb",
            name: "Statische Auftriebskraft (Archimedes)",
            category: "Physik",
            subcategory: "Strömungsmechanik",
            rawEquation: "FA = rho * V * g",
            latex: "F_A = \\rho \\cdot V \\cdot g",
            description: "Auftriebskraft eines verdrängten Flüssigkeitsvolumens V der Dichte ρ.",
            variables: [
                FormulaVariable(symbol: "FA", name: "Auftriebskraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "rho", name: "Dichte des Fluids", defaultUnit: "kg/m³", unitCategory: .mass),
                FormulaVariable(symbol: "V", name: "Verdrängtes Volumen", defaultUnit: "m³", unitCategory: .length),
                FormulaVariable(symbol: "g", name: "Erdbeschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_fluid_kontinuitaet",
            name: "Kontinuitätsgleichung (Inkompressibel)",
            category: "Physik",
            subcategory: "Strömungsmechanik",
            rawEquation: "Q = A * v",
            latex: "Q = A \\cdot v",
            description: "Volumenstrom Q durch einen Querschnitt A bei Strömungsgeschwindigkeit v.",
            variables: [
                FormulaVariable(symbol: "Q", name: "Volumenstrom", defaultUnit: "m³/s", unitCategory: .velocity),
                FormulaVariable(symbol: "A", name: "Rohrquerschnitt", defaultUnit: "m²", unitCategory: .length),
                FormulaVariable(symbol: "v", name: "Strömungsgeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        // --- 1.6 Schwingungen & Wellen ---
        list.append(FormulaItem(
            id: "phys_wave_speed",
            name: "Wellengeschwindigkeit",
            category: "Physik",
            subcategory: "Schwingungen & Wellen",
            rawEquation: "c = lambda * f",
            latex: "c = \\lambda \\cdot f",
            description: "Ausbreitungsgeschwindigkeit einer Welle aus Wellenlänge λ und Frequenz f.",
            variables: [
                FormulaVariable(symbol: "c", name: "Phasengeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "lambda", name: "Wellenlänge (λ)", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "f", name: "Frequenz (f)", defaultUnit: "Hz", unitCategory: .time)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_wave_pendel",
            name: "Periodendauer des Fadenpendels",
            category: "Physik",
            subcategory: "Schwingungen & Wellen",
            rawEquation: "T = 6.2831853 * sqrt(l / g)",
            latex: "T = 2 \\pi \\sqrt{\\frac{l}{g}}",
            description: "Schwingungsdauer eines idealen mathematischen Pendels der Länge l.",
            variables: [
                FormulaVariable(symbol: "T", name: "Periodendauer", defaultUnit: "s", unitCategory: .time),
                FormulaVariable(symbol: "l", name: "Pendellänge", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "g", name: "Erdbeschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration)
            ]
        ))

        // --- 1.7 Optik & Strahlung ---
        list.append(FormulaItem(
            id: "phys_opt_brechung",
            name: "Brechungsindex & Phasengeschwindigkeit",
            category: "Physik",
            subcategory: "Optik & Strahlung",
            rawEquation: "n = c0 / c",
            latex: "n = \\frac{c_0}{c}",
            description: "Optischer Brechungsindex als Verhältnis von Vakuumlichtgeschwindigkeit c0 zur Mediengeschwindigkeit c.",
            variables: [
                FormulaVariable(symbol: "n", name: "Brechungsindex", defaultUnit: "1", unitCategory: .mass),
                FormulaVariable(symbol: "c0", name: "Vakuumlichtgeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "c", name: "Lichtgeschwindigkeit im Medium", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_opt_linse",
            name: "Linsengleichung",
            category: "Physik",
            subcategory: "Optik & Strahlung",
            rawEquation: "1 / f = 1 / g + 1 / b",
            latex: "\\frac{1}{f} = \\frac{1}{g} + \\frac{1}{b}",
            description: "Beziehung zwischen Brennweite f, Gegenstandsweite g und Bildweite b.",
            variables: [
                FormulaVariable(symbol: "f", name: "Brennweite", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "g", name: "Gegenstandsweite", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "b", name: "Bildweite", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // --- 1.8 Elektromagnetismus ---
        list.append(FormulaItem(
            id: "phys_em_lorentz",
            name: "Lorentzkraft",
            category: "Physik",
            subcategory: "Elektromagnetismus",
            rawEquation: "F = q * v * B",
            latex: "F = q \\cdot v \\cdot B",
            description: "Kraft auf eine bewegte Ladung q im Magnetfeld der Flussdichte B.",
            variables: [
                FormulaVariable(symbol: "F", name: "Lorentzkraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "q", name: "Ladung", defaultUnit: "C", unitCategory: .electricCurrent),
                FormulaVariable(symbol: "v", name: "Teilchengeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "B", name: "Magnetische Flussdichte", defaultUnit: "T", unitCategory: .mass)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_em_kondensatorenergie",
            name: "Energie des Kondensatorfeldes",
            category: "Physik",
            subcategory: "Elektromagnetismus",
            rawEquation: "W = C * U^2 / 2",
            latex: "W = \\frac{1}{2} C \\cdot U^2",
            description: "Gespeicherte elektrostatische Energie im elektrischen Feld eines Kondensators.",
            variables: [
                FormulaVariable(symbol: "W", name: "Gespeicherte Energie", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "C", name: "Kapazität", defaultUnit: "F", unitCategory: .electricVoltage),
                FormulaVariable(symbol: "U", name: "Spannung", defaultUnit: "V", unitCategory: .electricVoltage)
            ]
        ))

        // --- 1.9 Relativität & Moderne Physik ---
        list.append(FormulaItem(
            id: "phys_rel_einstein",
            name: "Masse-Energie-Äquivalenz",
            category: "Physik",
            subcategory: "Relativität & Moderne Physik",
            rawEquation: "E = m * c^2",
            latex: "E = m \\cdot c^2",
            description: "Einsteins fundamentale Beziehung zwischen Ruhemasse und Ruheenergie.",
            variables: [
                FormulaVariable(symbol: "E", name: "Ruheenergie", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "m", name: "Ruhemasse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "c", name: "Lichtgeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_rel_photon",
            name: "Photonenenergie (Planck-Einstein)",
            category: "Physik",
            subcategory: "Relativität & Moderne Physik",
            rawEquation: "E = 6.62607e-34 * f",
            latex: "E = h \\cdot f",
            description: "Quantenenergie eines Lichtquants mit der Frequenz f und dem Planckschen Wirkungsquantum h.",
            variables: [
                FormulaVariable(symbol: "E", name: "Photonenenergie", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "f", name: "Strahlungsfrequenz", defaultUnit: "Hz", unitCategory: .time)
            ]
        ))

        // --- 1.10 Astrophysik & Kosmologie ---
        list.append(FormulaItem(
            id: "phys_astro_escape",
            name: "Fluchtgeschwindigkeit (2. kosmische Geschwindigkeit)",
            category: "Physik",
            subcategory: "Astrophysik & Kosmologie",
            rawEquation: "v = sqrt(1.3348e-10 * M / r)",
            latex: "v_{\\text{esc}} = \\sqrt{\\frac{2 G M}{r}}",
            description: "Notwendige Radialgeschwindigkeit zum vollständigen Verlassen des Schwerefelds einer Masse M.",
            variables: [
                FormulaVariable(symbol: "v", name: "Fluchtgeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "M", name: "Zentralkörpermasse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "r", name: "Abstand vom Zentrum", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_astro_hubble",
            name: "Hubble-Lemaître-Expansionsgesetz",
            category: "Physik",
            subcategory: "Astrophysik & Kosmologie",
            rawEquation: "v = H0 * d",
            latex: "v = H_0 \\cdot d",
            description: "Fluchtgeschwindigkeit ferner Galaxien proportional zu ihrer kosmologischen Entfernung d.",
            variables: [
                FormulaVariable(symbol: "v", name: "Fluchtgeschwindigkeit", defaultUnit: "km/s", unitCategory: .velocity),
                FormulaVariable(symbol: "H0", name: "Hubble-Konstante", defaultUnit: "km/(s·Mpc)", unitCategory: .velocity),
                FormulaVariable(symbol: "d", name: "Galaxienabstand", defaultUnit: "Mpc", unitCategory: .length)
            ]
        ))

        // ==========================================
        // 2. MATHEMATIK
        // ==========================================

        // --- 2.1 Geometrie 2D ---
        list.append(FormulaItem(
            id: "math_geo_rect",
            name: "Rechteckfläche",
            category: "Mathematik",
            subcategory: "Geometrie 2D (Flächen)",
            rawEquation: "A = a * b",
            latex: "A = a \\cdot b",
            description: "Flächeninhalt eines Rechtecks mit den Kantenlängen a und b.",
            variables: [
                FormulaVariable(symbol: "A", name: "Fläche", defaultUnit: "m²", unitCategory: .length),
                FormulaVariable(symbol: "a", name: "Länge", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "b", name: "Breite", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_geo_circle",
            name: "Kreisfläche",
            category: "Mathematik",
            subcategory: "Geometrie 2D (Flächen)",
            rawEquation: "A = 3.14159265 * r^2",
            latex: "A = \\pi \\cdot r^2",
            description: "Flächeninhalt eines Kreises mit dem Radius r.",
            variables: [
                FormulaVariable(symbol: "A", name: "Kreisfläche", defaultUnit: "m²", unitCategory: .length),
                FormulaVariable(symbol: "r", name: "Radius", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_geo_triangle",
            name: "Dreiecksfläche",
            category: "Mathematik",
            subcategory: "Geometrie 2D (Flächen)",
            rawEquation: "A = g * h / 2",
            latex: "A = \\frac{1}{2} g \\cdot h",
            description: "Flächeninhalt eines Dreiecks mit Grundseite g und Höhe h.",
            variables: [
                FormulaVariable(symbol: "A", name: "Dreiecksfläche", defaultUnit: "m²", unitCategory: .length),
                FormulaVariable(symbol: "g", name: "Grundseite", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "h", name: "Höhe", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // --- 2.2 Geometrie 3D ---
        list.append(FormulaItem(
            id: "math_geo_sphere",
            name: "Kugelvolumen",
            category: "Mathematik",
            subcategory: "Geometrie 3D (Körper)",
            rawEquation: "V = 4.18879 * r^3",
            latex: "V = \\frac{4}{3} \\pi r^3",
            description: "Rauminhalt einer Kugel mit dem Radius r.",
            variables: [
                FormulaVariable(symbol: "V", name: "Kugelvolumen", defaultUnit: "m³", unitCategory: .length),
                FormulaVariable(symbol: "r", name: "Radius", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_geo_cylinder",
            name: "Zylindervolumen",
            category: "Mathematik",
            subcategory: "Geometrie 3D (Körper)",
            rawEquation: "V = 3.14159265 * r^2 * h",
            latex: "V = \\pi r^2 \\cdot h",
            description: "Volumen eines geraden Kreiszylinders mit Radius r und Höhe h.",
            variables: [
                FormulaVariable(symbol: "V", name: "Zylindervolumen", defaultUnit: "m³", unitCategory: .length),
                FormulaVariable(symbol: "r", name: "Radius", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "h", name: "Zylinderhöhe", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // --- 2.3 Trigonometrie ---
        list.append(FormulaItem(
            id: "math_trig_pythagoras",
            name: "Satz des Pythagoras",
            category: "Mathematik",
            subcategory: "Trigonometrie",
            rawEquation: "c = sqrt(a^2 + b^2)",
            latex: "c = \\sqrt{a^2 + b^2}",
            description: "Hypotenuse c eines rechtwinkligen Dreiecks aus den Katheten a und b.",
            variables: [
                FormulaVariable(symbol: "c", name: "Hypotenuse", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "a", name: "Kathete a", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "b", name: "Kathete b", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // --- 2.4 Algebra & Analysis ---
        list.append(FormulaItem(
            id: "math_alg_linear",
            name: "Lineare Funktionsgleichung",
            category: "Mathematik",
            subcategory: "Algebra & Analysis",
            rawEquation: "y = m * x + b",
            latex: "y = m \\cdot x + b",
            description: "Geradengleichung mit Steigung m und y-Achsenabschnitt b.",
            variables: [
                FormulaVariable(symbol: "y", name: "Funktionswert y", defaultUnit: "1", unitCategory: .mass),
                FormulaVariable(symbol: "m", name: "Steigung", defaultUnit: "1", unitCategory: .mass),
                FormulaVariable(symbol: "x", name: "Stelle x", defaultUnit: "1", unitCategory: .mass),
                FormulaVariable(symbol: "b", name: "Achsenabschnitt", defaultUnit: "1", unitCategory: .mass)
            ]
        ))

        // ==========================================
        // 3. ELEKTROTECHNIK
        // ==========================================

        list.append(FormulaItem(
            id: "ee_ohm",
            name: "Ohmsches Gesetz",
            category: "Elektrotechnik",
            subcategory: "Gleichstrom",
            rawEquation: "U = R * I",
            latex: "U = R \\cdot I",
            description: "Linearer Zusammenhang zwischen elektrischer Spannung U, Widerstand R und Stromstärke I.",
            variables: [
                FormulaVariable(symbol: "U", name: "Spannung", defaultUnit: "V", unitCategory: .electricVoltage),
                FormulaVariable(symbol: "R", name: "Widerstand", defaultUnit: "Ω", unitCategory: .electricResistance),
                FormulaVariable(symbol: "I", name: "Stromstärke", defaultUnit: "A", unitCategory: .electricCurrent)
            ]
        ))

        list.append(FormulaItem(
            id: "ee_power",
            name: "Elektrische Gleichstromleistung",
            category: "Elektrotechnik",
            subcategory: "Gleichstrom",
            rawEquation: "P = U * I",
            latex: "P = U \\cdot I",
            description: "Momentane elektrische Wirkleistung bei Gleichspannung.",
            variables: [
                FormulaVariable(symbol: "P", name: "Elektrische Leistung", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "U", name: "Spannung", defaultUnit: "V", unitCategory: .electricVoltage),
                FormulaVariable(symbol: "I", name: "Stromstärke", defaultUnit: "A", unitCategory: .electricCurrent)
            ]
        ))

        list.append(FormulaItem(
            id: "ee_ac_thomson",
            name: "Thomsonsche Schwingungsgleichung",
            category: "Elektrotechnik",
            subcategory: "Wechselstrom & Scheinleistung",
            rawEquation: "f = 1 / (6.2831853 * sqrt(L * C))",
            latex: "f_0 = \\frac{1}{2 \\pi \\sqrt{L \\cdot C}}",
            description: "Resonanzfrequenz eines ungedämpften elektromagnetischen LC-Schwingkreises.",
            variables: [
                FormulaVariable(symbol: "f", name: "Resonanzfrequenz", defaultUnit: "Hz", unitCategory: .time),
                FormulaVariable(symbol: "L", name: "Induktivität", defaultUnit: "H", unitCategory: .electricVoltage),
                FormulaVariable(symbol: "C", name: "Kapazität", defaultUnit: "F", unitCategory: .electricVoltage)
            ]
        ))

        list.append(FormulaItem(
            id: "ee_ac_kapazitiv",
            name: "Kapazitiver Blindwiderstand",
            category: "Elektrotechnik",
            subcategory: "Wechselstrom & Scheinleistung",
            rawEquation: "XC = 1 / (6.2831853 * f * C)",
            latex: "X_C = \\frac{1}{2 \\pi f \\cdot C}",
            description: "Wechselstromwiderstand eines idealen Kondensators bei Frequenz f.",
            variables: [
                FormulaVariable(symbol: "XC", name: "Blindwiderstand (Xc)", defaultUnit: "Ω", unitCategory: .electricResistance),
                FormulaVariable(symbol: "f", name: "Frequenz", defaultUnit: "Hz", unitCategory: .time),
                FormulaVariable(symbol: "C", name: "Kapazität", defaultUnit: "F", unitCategory: .electricVoltage)
            ]
        ))

        // ==========================================
        // 4. CHEMIE
        // ==========================================

        list.append(FormulaItem(
            id: "chem_stoech_menge",
            name: "Stoffmenge aus Masse & Molarer Masse",
            category: "Chemie",
            subcategory: "Stöchiometrie & Konzentration",
            rawEquation: "n = m / M",
            latex: "n = \\frac{m}{M}",
            description: "Zusammenhang zwischen Stoffmenge n, Einwaage m und molarer Masse M.",
            variables: [
                FormulaVariable(symbol: "n", name: "Stoffmenge", defaultUnit: "mol", unitCategory: .mass),
                FormulaVariable(symbol: "m", name: "Substanzmasse", defaultUnit: "g", unitCategory: .mass),
                FormulaVariable(symbol: "M", name: "Molare Masse", defaultUnit: "g/mol", unitCategory: .mass)
            ]
        ))

        list.append(FormulaItem(
            id: "chem_stoech_molaritaet",
            name: "Molare Konzentration (Molarität)",
            category: "Chemie",
            subcategory: "Stöchiometrie & Konzentration",
            rawEquation: "c = n / V",
            latex: "c = \\frac{n}{V}",
            description: "Konzentration eines gelösten Stoffes pro Lösungs-Volumen V.",
            variables: [
                FormulaVariable(symbol: "c", name: "Molare Konzentration", defaultUnit: "mol/l", unitCategory: .mass),
                FormulaVariable(symbol: "n", name: "Stoffmenge", defaultUnit: "mol", unitCategory: .mass),
                FormulaVariable(symbol: "V", name: "Lösungsvolumen", defaultUnit: "l", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "chem_thermo_gibbs",
            name: "Gibbs-Helmholtz-Gleichung (Freie Enthalpie)",
            category: "Chemie",
            subcategory: "Thermochemie & Kinetik",
            rawEquation: "dG = dH - T * dS",
            latex: "\\Delta G = \\Delta H - T \\cdot \\Delta S",
            description: "Freie Reaktionsenthalpie zur Bestimmung der Spontaneität chemischer Reaktionen.",
            variables: [
                FormulaVariable(symbol: "dG", name: "Freie Enthalpie (ΔG)", defaultUnit: "kJ/mol", unitCategory: .energy),
                FormulaVariable(symbol: "dH", name: "Reaktionsenthalpie (ΔH)", defaultUnit: "kJ/mol", unitCategory: .energy),
                FormulaVariable(symbol: "T", name: "Absolute Temperatur", defaultUnit: "K", unitCategory: .temperature),
                FormulaVariable(symbol: "dS", name: "Reaktionsentropie (ΔS)", defaultUnit: "kJ/(mol·K)", unitCategory: .energy)
            ]
        ))

        // ==========================================
        // 5. MASCHINENBAU & STATIK
        // ==========================================

        list.append(FormulaItem(
            id: "eng_statik_spannung",
            name: "Mechanische Normalspannung (Zug/Druck)",
            category: "Maschinenbau & Statik",
            subcategory: "Festigkeitslehre & Elastizität",
            rawEquation: "sigma = F / A",
            latex: "\\sigma = \\frac{F}{A}",
            description: "Spannung in einem Querschnitt A unter axialer Lasteinwirkung F.",
            variables: [
                FormulaVariable(symbol: "sigma", name: "Normalspannung (σ)", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "F", name: "Axiale Zug-/Druckkraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "A", name: "Querschnittsfläche", defaultUnit: "m²", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "eng_statik_dehnung",
            name: "Hookesches Gesetz für lineare Dehnung",
            category: "Maschinenbau & Statik",
            subcategory: "Festigkeitslehre & Elastizität",
            rawEquation: "sigma = E * eps",
            latex: "\\sigma = E \\cdot \\varepsilon",
            description: "Elastische Längsspannung über Elastizitätsmodul E und bezogene Dehnung ε.",
            variables: [
                FormulaVariable(symbol: "sigma", name: "Spannung (σ)", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "E", name: "Elastizitätsmodul (E-Modul)", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "eps", name: "Dehnung (ε)", defaultUnit: "1", unitCategory: .mass)
            ]
        ))

        // ==========================================
        // 6. FINANZMATHEMATIK
        // ==========================================

        list.append(FormulaItem(
            id: "fin_zins_einfach",
            name: "Einfache Zinsformel",
            category: "Finanzmathematik",
            subcategory: "Zinsrechnung & Barwert",
            rawEquation: "Z = K * p * t / 100",
            latex: "Z = \\frac{K \\cdot p \\cdot t}{100}",
            description: "Einfacher Zinsertrag ohne Zinseszins über Laufzeit t.",
            variables: [
                FormulaVariable(symbol: "Z", name: "Zinsertrag", defaultUnit: "€", unitCategory: .energy),
                FormulaVariable(symbol: "K", name: "Anfangskapital", defaultUnit: "€", unitCategory: .energy),
                FormulaVariable(symbol: "p", name: "Zinssatz (% p.a.)", defaultUnit: "%", unitCategory: .mass),
                FormulaVariable(symbol: "t", name: "Laufzeit", defaultUnit: "Jahre", unitCategory: .time)
            ]
        ))

        // ==========================================
        // 7. INFORMATIK & INFORMATION
        // ==========================================

        list.append(FormulaItem(
            id: "cs_info_shannon",
            name: "Shannon-Hartley-Kanalkapazität",
            category: "Informatik & Information",
            subcategory: "Informationstheorie & Codierung",
            rawEquation: "C = B * 3.321928 * ln(1 + SNR)",
            latex: "C = B \\cdot \\log_2(1 + \\text{SNR})",
            description: "Maximal erreichbare fehlerfreie Übertragungsrate über einen bandbreitenbegrenzten gestörten Kanal.",
            variables: [
                FormulaVariable(symbol: "C", name: "Kanalkapazität", defaultUnit: "bit/s", unitCategory: .velocity),
                FormulaVariable(symbol: "B", name: "Kanalbandbreite", defaultUnit: "Hz", unitCategory: .time),
                FormulaVariable(symbol: "SNR", name: "Signal-Rausch-Verhältnis", defaultUnit: "1", unitCategory: .mass)
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
