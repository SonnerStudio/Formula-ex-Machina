#!/usr/bin/env python3
import os

catalog_swift = '''import Foundation
import FormulaEngine

public struct FormulaCatalog: Sendable {
    public static let shared = FormulaCatalog()

    public let categories: [FormulaCategoryItem]
    public let formulas: [FormulaItem]

    public init() {
        self.categories = [
            FormulaCategoryItem(
                id: "mathematics",
                name: "Mathematik",
                iconName: "function",
                subcategories: [
                    "Goldener Schnitt & Folgen",
                    "Geometrie 2D (Flächen)",
                    "Geometrie 3D (Körper)",
                    "Trigonometrie",
                    "Algebra & Analysis",
                    "Statistik & Stochastik"
                ]
            ),
            FormulaCategoryItem(
                id: "physics",
                name: "Physik",
                iconName: "atom",
                subcategories: [
                    "Kinematik",
                    "Dynamik",
                    "Arbeit & Energie",
                    "Schwingungen & Wellen",
                    "Optik & Strahlung",
                    "Relativität & Quantenphysik"
                ]
            ),
            FormulaCategoryItem(
                id: "astronomy",
                name: "Astronomie & Astrophysik",
                iconName: "sparkles",
                subcategories: [
                    "Gravitation & Bahnbewegung",
                    "Kosmologie & Sterne",
                    "Hochenergie-Astrophysik"
                ]
            ),
            FormulaCategoryItem(
                id: "electrical",
                name: "Elektrotechnik",
                iconName: "bolt.fill",
                subcategories: [
                    "Gleichstrom & Netzwerke",
                    "Wechselstrom & Blindwiderstände",
                    "Elektromagnetische Felder & Wellen"
                ]
            ),
            FormulaCategoryItem(
                id: "chemistry",
                name: "Chemie",
                iconName: "flask.fill",
                subcategories: [
                    "Gase & Thermodynamik",
                    "Lösungen & Kinetik",
                    "Elektrochemie & pH-Gleichgewichte"
                ]
            ),
            FormulaCategoryItem(
                id: "engineering",
                name: "Maschinenbau & Statik",
                iconName: "gearshape.2.fill",
                subcategories: [
                    "Festigkeitslehre & Elastizität",
                    "Strömungsmechanik",
                    "Statik & Antriebe"
                ]
            ),
            FormulaCategoryItem(
                id: "cs",
                name: "Informatik & Information",
                iconName: "cpu.fill",
                subcategories: [
                    "Informationstheorie & Codierung",
                    "Systemleistung & Skalierung"
                ]
            ),
            FormulaCategoryItem(
                id: "finance",
                name: "Finanzmathematik",
                iconName: "chart.line.uptrend.xyaxis",
                subcategories: [
                    "Zins & Zinseszins",
                    "Investitionsrechnung & Barwert"
                ]
            )
        ]

        var list: [FormulaItem] = []

        // ==========================================
        // 1. MATHEMATIK
        // ==========================================

        // Goldener Schnitt - Definition
        list.append(FormulaItem(
            id: "math_golden_ratio",
            name: "Goldener Schnitt (Definition)",
            category: "Mathematik",
            subcategory: "Goldener Schnitt & Folgen",
            rawEquation: "Phi = (1 + sqrt(5)) / 2",
            latex: "\\Phi = \\frac{1 + \\sqrt{5}}{2} \\approx 1.6180339887",
            description: "Die Zahl des Goldenen Schnitts (Divina Proportione). Mathematische Konstante der harmonischen Teilung.",
            variables: [
                FormulaVariable(symbol: "Phi", name: "Goldene Zahl Phi", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // Goldener Schnitt - Streckenteilung
        list.append(FormulaItem(
            id: "math_golden_ratio_prop",
            name: "Goldener Schnitt (Proportion a : b)",
            category: "Mathematik",
            subcategory: "Goldener Schnitt & Folgen",
            rawEquation: "a = b * 1.6180339887",
            latex: "\\frac{a + b}{a} = \\frac{a}{b} = \\Phi \\approx 1.618034",
            description: "Berechnet den Major-Abschnitt 'a' aus dem Minor-Abschnitt 'b' im Verhältnis des Goldenen Schnitts.",
            variables: [
                FormulaVariable(symbol: "a", name: "Major (großer Abschnitt)", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "b", name: "Minor (kleiner Abschnitt)", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // Fibonacci-Zahlenfolge (Formel von Binet)
        list.append(FormulaItem(
            id: "math_fibonacci_binet",
            name: "Fibonacci-Zahlenfolge (Binet-Formel)",
            category: "Mathematik",
            subcategory: "Goldener Schnitt & Folgen",
            rawEquation: "Fn = (((1 + sqrt(5)) / 2)^n - ((1 - sqrt(5)) / 2)^n) / sqrt(5)",
            latex: "F_n = \\frac{1}{\\sqrt{5}} \\left[ \\left(\\frac{1+\\sqrt{5}}{2}\\right)^n - \\left(\\frac{1-\\sqrt{5}}{2}\\right)^n \\right]",
            description: "Geschlossene Formel von Jacques Philippe Marie Binet zur direkten exakten Berechnung der n-ten Fibonacci-Zahl ohne Rekursion.",
            variables: [
                FormulaVariable(symbol: "Fn", name: "n-te Fibonacci-Zahl", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "n", name: "Stellennummer (Index n)", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // Satz des Pythagoras
        list.append(FormulaItem(
            id: "math_geom_pythagoras",
            name: "Satz des Pythagoras",
            category: "Mathematik",
            subcategory: "Geometrie 2D (Flächen)",
            rawEquation: "c = sqrt(a^2 + b^2)",
            latex: "c = \\sqrt{a^2 + b^2}",
            description: "Berechnung der Hypotenuse c im rechtwinkligen Dreieck aus den Katheten a und b.",
            variables: [
                FormulaVariable(symbol: "c", name: "Hypotenuse c", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "a", name: "Kathete a", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "b", name: "Kathete b", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // Kreisfläche
        list.append(FormulaItem(
            id: "math_geom_circle_area",
            name: "Kreisfläche",
            category: "Mathematik",
            subcategory: "Geometrie 2D (Flächen)",
            rawEquation: "A = 3.1415926535 * r^2",
            latex: "A = \\pi \\cdot r^2",
            description: "Flächeninhalt eines Kreises mit dem Radius r.",
            variables: [
                FormulaVariable(symbol: "A", name: "Kreisfläche", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "r", name: "Radius", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // Kreisumfang
        list.append(FormulaItem(
            id: "math_geom_circle_perimeter",
            name: "Kreisumfang",
            category: "Mathematik",
            subcategory: "Geometrie 2D (Flächen)",
            rawEquation: "U = 2 * 3.1415926535 * r",
            latex: "U = 2\\pi \\cdot r",
            description: "Umfang eines Kreises in Abhängigkeit vom Radius r.",
            variables: [
                FormulaVariable(symbol: "U", name: "Umfang", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "r", name: "Radius", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // Kugelvolumen
        list.append(FormulaItem(
            id: "math_geom_sphere_vol",
            name: "Kugelvolumen",
            category: "Mathematik",
            subcategory: "Geometrie 3D (Körper)",
            rawEquation: "V = (4 / 3) * 3.1415926535 * r^3",
            latex: "V = \\frac{4}{3}\\pi \\cdot r^3",
            description: "Volumen einer dreidimensionalen Kugel mit Radius r.",
            variables: [
                FormulaVariable(symbol: "V", name: "Volumen", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "r", name: "Kugelradius", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // Kugeloberfläche
        list.append(FormulaItem(
            id: "math_geom_sphere_surface",
            name: "Kugeloberfläche",
            category: "Mathematik",
            subcategory: "Geometrie 3D (Körper)",
            rawEquation: "A = 4 * 3.1415926535 * r^2",
            latex: "A = 4\\pi \\cdot r^2",
            description: "Oberflächeninhalt einer perfekten Kugel.",
            variables: [
                FormulaVariable(symbol: "A", name: "Oberfläche", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "r", name: "Radius", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // Quadratische Lösungsformel
        list.append(FormulaItem(
            id: "math_alg_quadratic",
            name: "Quadratische Lösungsformel (Mitternachtsformel)",
            category: "Mathematik",
            subcategory: "Algebra & Analysis",
            rawEquation: "x = (-b + sqrt(b^2 - 4 * a * c)) / (2 * a)",
            latex: "x_{1} = \\frac{-b + \\sqrt{b^2 - 4ac}}{2a}",
            description: "Analytische Nullstelle einer quadratischen Gleichung ax² + bx + c = 0.",
            variables: [
                FormulaVariable(symbol: "x", name: "Nullstelle x", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "a", name: "Koeffizient a", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "b", name: "Koeffizient b", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "c", name: "Konstante c", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // Satz von Bayes
        list.append(FormulaItem(
            id: "math_stat_bayes",
            name: "Satz von Bayes (Bedingte Wahrscheinlichkeit)",
            category: "Mathematik",
            subcategory: "Statistik & Stochastik",
            rawEquation: "P_AB = (P_BA * P_A) / P_B",
            latex: "P(A|B) = \\frac{P(B|A) \\cdot P(A)}{P(B)}",
            description: "Fundamentales Theorem der Wahrscheinlichkeitstheorie zur Berechnung von A-posteriori-Wahrscheinlichkeiten.",
            variables: [
                FormulaVariable(symbol: "P_AB", name: "P(A|B) A-posteriori", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "P_BA", name: "P(B|A) Likelihood", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "P_A", name: "P(A) A-priori", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "P_B", name: "P(B) Evidenz", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // Stirling-Formel
        list.append(FormulaItem(
            id: "math_alg_stirling",
            name: "Stirling-Formel (Fakultäts-Approximation)",
            category: "Mathematik",
            subcategory: "Algebra & Analysis",
            rawEquation: "n_fact = sqrt(2 * 3.14159265 * n) * (n / 2.7182818)^n",
            latex: "n! \\approx \\sqrt{2\\pi n} \\left(\\frac{n}{e}\\right)^n",
            description: "Asymptotische Entwicklung zur schnellen Auswertung sehr großer Fakultäten n!.",
            variables: [
                FormulaVariable(symbol: "n_fact", name: "Approximiertes n!", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "n", name: "Zahl n", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // ==========================================
        // 2. PHYSIK
        // ==========================================

        // Newton II
        list.append(FormulaItem(
            id: "phys_dyn_newton2",
            name: "Zweites Newtonsches Axiom (Grundgesetz der Dynamik)",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "F = m * a",
            latex: "F = m \\cdot a",
            description: "Kraft ist gleich Masse mal Beschleunigung. Fundamentales Gesetz der klassischen Mechanik.",
            variables: [
                FormulaVariable(symbol: "F", name: "Kraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "m", name: "Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "a", name: "Beschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration)
            ]
        ))

        // Kinetische Energie
        list.append(FormulaItem(
            id: "phys_nrj_kin",
            name: "Kinetische Energie (Bewegungsenergie)",
            category: "Physik",
            subcategory: "Arbeit & Energie",
            rawEquation: "E = 0.5 * m * v^2",
            latex: "E_{kin} = \\frac{1}{2} m \\cdot v^2",
            description: "In der Bewegung eines Körpers mit Geschwindigkeit v gespeicherte kinetische Energie.",
            variables: [
                FormulaVariable(symbol: "E", name: "Kinetische Energie", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "m", name: "Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "v", name: "Geschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        // Potenzielle Energie
        list.append(FormulaItem(
            id: "phys_nrj_pot",
            name: "Potenzielle Energie (Lageenergie)",
            category: "Physik",
            subcategory: "Arbeit & Energie",
            rawEquation: "E = m * g * h",
            latex: "E_{pot} = m \\cdot g \\cdot h",
            description: "Höhenenergie im homogenen Gravitationsfeld der Erde (g = 9.81 m/s²).",
            variables: [
                FormulaVariable(symbol: "E", name: "Lageenergie", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "m", name: "Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "g", name: "Fallbeschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration),
                FormulaVariable(symbol: "h", name: "Höhe", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // Dichte
        list.append(FormulaItem(
            id: "phys_mech_density",
            name: "Dichte",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "rho = m / V",
            latex: "\\rho = \\frac{m}{V}",
            description: "Verhältnis von Masse zu Volumen eines homogenen Körpers oder Mediums.",
            variables: [
                FormulaVariable(symbol: "rho", name: "Dichte", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "m", name: "Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "V", name: "Volumen", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // Hydrostatischer Druck
        list.append(FormulaItem(
            id: "phys_mech_hydro_pressure",
            name: "Hydrostatischer Druck (Schweredruck)",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "p = rho * g * h",
            latex: "p = \\rho \\cdot g \\cdot h",
            description: "Druck in einer ruhenden Flüssigkeitssäule in der Tiefe h.",
            variables: [
                FormulaVariable(symbol: "p", name: "Druck", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "rho", name: "Flüssigkeitsdichte", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "g", name: "Erdbeschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration),
                FormulaVariable(symbol: "h", name: "Tiefe", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // Einstein Äquivalenz
        list.append(FormulaItem(
            id: "phys_rel_einstein",
            name: "Masse-Energie-Äquivalenz (Einstein)",
            category: "Physik",
            subcategory: "Relativität & Quantenphysik",
            rawEquation: "E = m * c^2",
            latex: "E = m \\cdot c^2",
            description: "Albert Einsteins berühmteste Gleichung der Speziellen Relativitätstheorie (c = 299.792.458 m/s).",
            variables: [
                FormulaVariable(symbol: "E", name: "Ruheenergie", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "m", name: "Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "c", name: "Lichtgeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        // Lorentz-Faktor
        list.append(FormulaItem(
            id: "phys_rel_gamma",
            name: "Lorentz-Faktor (Relativität)",
            category: "Physik",
            subcategory: "Relativität & Quantenphysik",
            rawEquation: "gamma = 1 / sqrt(1 - (v^2 / c^2))",
            latex: "\\gamma = \\frac{1}{\\sqrt{1 - \\frac{v^2}{c^2}}}",
            description: "Faktor für relativistische Zeitdilatation, Längenkontraktion und relativistische Masse.",
            variables: [
                FormulaVariable(symbol: "gamma", name: "Lorentz-Faktor", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "v", name: "Geschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "c", name: "Lichtgeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        // De-Broglie-Wellenlänge
        list.append(FormulaItem(
            id: "phys_quant_debroglie",
            name: "De-Broglie-Wellenlänge (Materiewellen)",
            category: "Physik",
            subcategory: "Relativität & Quantenphysik",
            rawEquation: "lambda = h / p",
            latex: "\\lambda = \\frac{h}{p}",
            description: "Wellenlänge eines Teilchens mit Impuls p im Welle-Teilchen-Dualismus der Quantenmechanik.",
            variables: [
                FormulaVariable(symbol: "lambda", name: "Wellenlänge", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "h", name: "Planck-Wirkungsquantum", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "p", name: "Impuls", defaultUnit: "N", unitCategory: .force)
            ]
        ))

        // Planck-Einstein Photon
        list.append(FormulaItem(
            id: "phys_quant_photon",
            name: "Planck-Einstein-Beziehung (Photonenenergie)",
            category: "Physik",
            subcategory: "Relativität & Quantenphysik",
            rawEquation: "E = h * f",
            latex: "E = h \\cdot f",
            description: "Energie eines Lichtquants (Photons) in Abhängigkeit von seiner Frequenz f.",
            variables: [
                FormulaVariable(symbol: "E", name: "Photonenenergie", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "h", name: "Planck-Konstante", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "f", name: "Frequenz", defaultUnit: "s", unitCategory: .time)
            ]
        ))

        // Mathematisches Pendel
        list.append(FormulaItem(
            id: "phys_osc_pendulum",
            name: "Mathematisches Fadenpendel (Schwingungsdauer)",
            category: "Physik",
            subcategory: "Schwingungen & Wellen",
            rawEquation: "T = 2 * 3.14159265 * sqrt(l / g)",
            latex: "T = 2\\pi \\sqrt{\\frac{l}{g}}",
            description: "Schwingungsdauer eines idealen Fadenpendels bei kleinen Auslenkungen.",
            variables: [
                FormulaVariable(symbol: "T", name: "Periodendauer", defaultUnit: "s", unitCategory: .time),
                FormulaVariable(symbol: "l", name: "Pendellänge", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "g", name: "Fallbeschleunigung", defaultUnit: "m/s²", unitCategory: .acceleration)
            ]
        ))

        // Federpendel
        list.append(FormulaItem(
            id: "phys_osc_spring",
            name: "Federpendel (Harmonischer Oszillator)",
            category: "Physik",
            subcategory: "Schwingungen & Wellen",
            rawEquation: "T = 2 * 3.14159265 * sqrt(m / k)",
            latex: "T = 2\\pi \\sqrt{\\frac{m}{k}}",
            description: "Schwingungsdauer einer an einer Schraubenfeder schwingenden Masse m.",
            variables: [
                FormulaVariable(symbol: "T", name: "Periodendauer", defaultUnit: "s", unitCategory: .time),
                FormulaVariable(symbol: "m", name: "Schwingende Masse", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "k", name: "Federkonstante", defaultUnit: "N", unitCategory: .force)
            ]
        ))

        // ==========================================
        // 3. ASTRONOMIE & ASTROPHYSIK
        // ==========================================

        // Newtons Gravitationsgesetz
        list.append(FormulaItem(
            id: "astro_grav_newton",
            name: "Newtonsches Gravitationsgesetz",
            category: "Astronomie & Astrophysik",
            subcategory: "Gravitation & Bahnbewegung",
            rawEquation: "F = G * (m1 * m2) / r^2",
            latex: "F = G \\cdot \\frac{m_1 \\cdot m_2}{r^2}",
            description: "Gravitative Anziehungskraft zwischen zwei Massen m1 und m2 im Abstand r.",
            variables: [
                FormulaVariable(symbol: "F", name: "Gravitationskraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "G", name: "Gravitationskonstante", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "m1", name: "Masse 1", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "m2", name: "Masse 2", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "r", name: "Abstand", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // Fluchtgeschwindigkeit
        list.append(FormulaItem(
            id: "astro_escape_vel",
            name: "Zweite kosmische Geschwindigkeit (Fluchtgeschwindigkeit)",
            category: "Astronomie & Astrophysik",
            subcategory: "Gravitation & Bahnbewegung",
            rawEquation: "v = sqrt((2 * G * M) / r)",
            latex: "v_2 = \\sqrt{\\frac{2GM}{r}}",
            description: "Mindestgeschwindigkeit, um dem Schwerefeld eines Himmelskörpers dauerhaft zu entkommen.",
            variables: [
                FormulaVariable(symbol: "v", name: "Fluchtgeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "G", name: "Gravitationskonstante", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "M", name: "Masse des Zentralkörpers", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "r", name: "Radius / Abstand", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // Schwarzschild-Radius
        list.append(FormulaItem(
            id: "astro_schwarzschild",
            name: "Schwarzschild-Radius (Ereignishorizont)",
            category: "Astronomie & Astrophysik",
            subcategory: "Hochenergie-Astrophysik",
            rawEquation: "rs = (2 * G * M) / c^2",
            latex: "r_s = \\frac{2GM}{c^2}",
            description: "Radius des Ereignishorizonts eines nicht rotierenden Schwarzen Lochs nach Karl Schwarzschild.",
            variables: [
                FormulaVariable(symbol: "rs", name: "Schwarzschild-Radius", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "G", name: "Gravitationskonstante", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "M", name: "Masse des Schwarzen Lochs", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "c", name: "Lichtgeschwindigkeit", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        // Hubble-Lemaître-Gesetz
        list.append(FormulaItem(
            id: "astro_hubble",
            name: "Hubble-Lemaître-Gesetz (Kosmische Expansion)",
            category: "Astronomie & Astrophysik",
            subcategory: "Kosmologie & Sterne",
            rawEquation: "v = H0 * d",
            latex: "v = H_0 \\cdot d",
            description: "Fluchtgeschwindigkeit entfernter Galaxien proportional zu ihrer kosmischen Entfernung.",
            variables: [
                FormulaVariable(symbol: "v", name: "Fluchtgeschwindigkeit", defaultUnit: "km", unitCategory: .length),
                FormulaVariable(symbol: "H0", name: "Hubble-Konstante", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "d", name: "Entfernung (Mpc)", defaultUnit: "km", unitCategory: .length)
            ]
        ))

        // Stefan-Boltzmann-Gesetz
        list.append(FormulaItem(
            id: "astro_stefan_boltzmann",
            name: "Stefan-Boltzmann-Gesetz (Schwarzer Strahler)",
            category: "Astronomie & Astrophysik",
            subcategory: "Kosmologie & Sterne",
            rawEquation: "P = sigma * A * T^4",
            latex: "P = \\sigma \\cdot A \\cdot T^4",
            description: "Gesamte Strahlungsleistung eines idealen Schwarzen Körpers in der vierten Potenz der Temperatur T.",
            variables: [
                FormulaVariable(symbol: "P", name: "Strahlungsleistung", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "sigma", name: "Stefan-Boltzmann-Konstante", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "A", name: "Oberfläche", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "T", name: "Absolute Temperatur", defaultUnit: "K", unitCategory: .temperature)
            ]
        ))

        // ==========================================
        // 4. ELEKTROTECHNIK
        // ==========================================

        // Ohmsches Gesetz
        list.append(FormulaItem(
            id: "elec_ohm",
            name: "Ohmsches Gesetz",
            category: "Elektrotechnik",
            subcategory: "Gleichstrom & Netzwerke",
            rawEquation: "U = R * I",
            latex: "U = R \\cdot I",
            description: "Zusammenhang zwischen elektrischer Spannung U, Widerstand R und Stromstärke I.",
            variables: [
                FormulaVariable(symbol: "U", name: "Spannung", defaultUnit: "V", unitCategory: .electricVoltage),
                FormulaVariable(symbol: "R", name: "Widerstand", defaultUnit: "Ω", unitCategory: .electricResistance),
                FormulaVariable(symbol: "I", name: "Stromstärke", defaultUnit: "A", unitCategory: .electricCurrent)
            ]
        ))

        // Elektrische Leistung (P = U * I)
        list.append(FormulaItem(
            id: "elec_power_ui",
            name: "Elektrische Leistung (Gleichstrom)",
            category: "Elektrotechnik",
            subcategory: "Gleichstrom & Netzwerke",
            rawEquation: "P = U * I",
            latex: "P = U \\cdot I",
            description: "Momentane elektrische Gleichstromleistung in Watt.",
            variables: [
                FormulaVariable(symbol: "P", name: "Leistung", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "U", name: "Spannung", defaultUnit: "V", unitCategory: .electricVoltage),
                FormulaVariable(symbol: "I", name: "Stromstärke", defaultUnit: "A", unitCategory: .electricCurrent)
            ]
        ))

        // Leistung am Widerstand (P = I^2 * R)
        list.append(FormulaItem(
            id: "elec_power_ri",
            name: "Joulesche Wärme / Leistung am Widerstand",
            category: "Elektrotechnik",
            subcategory: "Gleichstrom & Netzwerke",
            rawEquation: "P = I^2 * R",
            latex: "P = I^2 \\cdot R",
            description: "Verlustleistung (Wärmeentwicklung) an einem ohmschen Widerstand.",
            variables: [
                FormulaVariable(symbol: "P", name: "Verlustleistung", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "I", name: "Stromstärke", defaultUnit: "A", unitCategory: .electricCurrent),
                FormulaVariable(symbol: "R", name: "Widerstand", defaultUnit: "Ω", unitCategory: .electricResistance)
            ]
        ))

        // Kapazitiver Blindwiderstand
        list.append(FormulaItem(
            id: "elec_ac_xc",
            name: "Kapazitiver Blindwiderstand (Reaktanz Xc)",
            category: "Elektrotechnik",
            subcategory: "Wechselstrom & Blindwiderstände",
            rawEquation: "Xc = 1 / (2 * 3.14159265 * f * C)",
            latex: "X_C = \\frac{1}{2\\pi f C}",
            description: "Wechselstromwiderstand eines idealen Kondensators mit Kapazität C bei Frequenz f.",
            variables: [
                FormulaVariable(symbol: "Xc", name: "Kapazitiver Blindwiderstand", defaultUnit: "Ω", unitCategory: .electricResistance),
                FormulaVariable(symbol: "f", name: "Wechselstromfrequenz", defaultUnit: "s", unitCategory: .time),
                FormulaVariable(symbol: "C", name: "Kapazität", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // Induktiver Blindwiderstand
        list.append(FormulaItem(
            id: "elec_ac_xl",
            name: "Induktiver Blindwiderstand (Reaktanz Xl)",
            category: "Elektrotechnik",
            subcategory: "Wechselstrom & Blindwiderstände",
            rawEquation: "Xl = 2 * 3.14159265 * f * L",
            latex: "X_L = 2\\pi f L",
            description: "Wechselstromwiderstand einer idealen Spule mit Induktivität L.",
            variables: [
                FormulaVariable(symbol: "Xl", name: "Induktiver Blindwiderstand", defaultUnit: "Ω", unitCategory: .electricResistance),
                FormulaVariable(symbol: "f", name: "Frequenz", defaultUnit: "s", unitCategory: .time),
                FormulaVariable(symbol: "L", name: "Induktivität", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // Thomsonsche Schwingungsformel
        list.append(FormulaItem(
            id: "elec_ac_thomson",
            name: "Thomsonsche Schwingungsgleichung (Resonanzfrequenz)",
            category: "Elektrotechnik",
            subcategory: "Wechselstrom & Blindwiderstände",
            rawEquation: "f0 = 1 / (2 * 3.14159265 * sqrt(L * C))",
            latex: "f_0 = \\frac{1}{2\\pi \\sqrt{L C}}",
            description: "Eigenfrequenz / Resonanzfrequenz eines ungedämpften elektromagnetischen LC-Schwingkreises.",
            variables: [
                FormulaVariable(symbol: "f0", name: "Resonanzfrequenz", defaultUnit: "s", unitCategory: .time),
                FormulaVariable(symbol: "L", name: "Induktivität", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "C", name: "Kapazität", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // ==========================================
        // 5. CHEMIE & THERMODYNAMIK
        // ==========================================

        // Ideales Gasgesetz
        list.append(FormulaItem(
            id: "chem_gas_ideal",
            name: "Ideales Gasgesetz (Zustandsgleichung)",
            category: "Chemie",
            subcategory: "Gase & Thermodynamik",
            rawEquation: "p * V = n * R * T",
            latex: "p \\cdot V = n \\cdot R \\cdot T",
            description: "Thermodynamische Zustandsgleichung idealer Gase (Gaskonstante R = 8.31446 J/(mol·K)).",
            variables: [
                FormulaVariable(symbol: "p", name: "Gasdruck", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "V", name: "Volumen", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "n", name: "Stoffmenge", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "R", name: "Universelle Gaskonstante", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "T", name: "Temperatur", defaultUnit: "K", unitCategory: .temperature)
            ]
        ))

        // Molare Masse
        list.append(FormulaItem(
            id: "chem_stoich_molar_mass",
            name: "Molare Masse",
            category: "Chemie",
            subcategory: "Lösungen & Kinetik",
            rawEquation: "M = m / n",
            latex: "M = \\frac{m}{n}",
            description: "Stoffspezifische molare Masse aus Masse m und Stoffmenge n.",
            variables: [
                FormulaVariable(symbol: "M", name: "Molare Masse", defaultUnit: "g", unitCategory: .mass),
                FormulaVariable(symbol: "m", name: "Stoffmasse", defaultUnit: "g", unitCategory: .mass),
                FormulaVariable(symbol: "n", name: "Stoffmenge", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // Gibbs-Helmholtz
        list.append(FormulaItem(
            id: "chem_thermo_gibbs",
            name: "Gibbs-Helmholtz-Gleichung (Freie Enthalpie)",
            category: "Chemie",
            subcategory: "Gase & Thermodynamik",
            rawEquation: "dG = dH - T * dS",
            latex: "\\Delta G = \\Delta H - T \\cdot \\Delta S",
            description: "Kriterium für die thermodynamische Spontaneität einer chemischen Reaktion.",
            variables: [
                FormulaVariable(symbol: "dG", name: "Freie Reaktionsenthalpie ΔG", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "dH", name: "Reaktionsenthalpie ΔH", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "T", name: "Reaktionstemperatur", defaultUnit: "K", unitCategory: .temperature),
                FormulaVariable(symbol: "dS", name: "Reaktionsentropie ΔS", defaultUnit: "J", unitCategory: .energy)
            ]
        ))

        // Carnot-Wirkungsgrad
        list.append(FormulaItem(
            id: "thermo_carnot",
            name: "Carnot-Wirkungsgrad",
            category: "Chemie",
            subcategory: "Gase & Thermodynamik",
            rawEquation: "eta = 1 - (Tc / Th)",
            latex: "\\eta_{rev} = 1 - \\frac{T_{kalt}}{T_{warm}}",
            description: "Maximal erreichbarer theoretischer Wirkungsgrad einer Wärmekraftmaschine.",
            variables: [
                FormulaVariable(symbol: "eta", name: "Wirkungsgrad η", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "Tc", name: "Kältereservoir Tc", defaultUnit: "K", unitCategory: .temperature),
                FormulaVariable(symbol: "Th", name: "Wärmereservoir Th", defaultUnit: "K", unitCategory: .temperature)
            ]
        ))

        // ==========================================
        // 6. MASCHINENBAU & STATIK
        // ==========================================

        // Hookesches Gesetz
        list.append(FormulaItem(
            id: "eng_mech_hooke",
            name: "Hookesches Gesetz (Spannung-Dehnung)",
            category: "Maschinenbau & Statik",
            subcategory: "Festigkeitslehre & Elastizität",
            rawEquation: "sigma = E * eps",
            latex: "\\sigma = E \\cdot \\varepsilon",
            description: "Linearer Zusammenhang zwischen mechanischer Spannung σ und Dehnung ε im elastischen Bereich.",
            variables: [
                FormulaVariable(symbol: "sigma", name: "Spannung σ", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "E", name: "Elastizitätsmodul E", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "eps", name: "Dehnung ε", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // Mechanische Spannung
        list.append(FormulaItem(
            id: "eng_mech_stress",
            name: "Mechanische Normalspannung",
            category: "Maschinenbau & Statik",
            subcategory: "Festigkeitslehre & Elastizität",
            rawEquation: "sigma = F / A",
            latex: "\\sigma = \\frac{F}{A}",
            description: "Auf eine Querschnittsfläche A senkrecht einwirkende Zug- oder Druckkraft F.",
            variables: [
                FormulaVariable(symbol: "sigma", name: "Normalspannung", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "F", name: "Normalkraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "A", name: "Querschnittsfläche", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // Drehmoment
        list.append(FormulaItem(
            id: "eng_mech_torque",
            name: "Drehmoment (Hebelgesetz)",
            category: "Maschinenbau & Statik",
            subcategory: "Statik & Antriebe",
            rawEquation: "M = F * r",
            latex: "M = F \\cdot r",
            description: "Drehwirkung einer Kraft F im Hebelarmabstand r zur Drehachse.",
            variables: [
                FormulaVariable(symbol: "M", name: "Drehmoment", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "F", name: "Hebelkraft", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "r", name: "Hebelarm", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // Eulersche Knicklast
        list.append(FormulaItem(
            id: "eng_euler_buckling",
            name: "Eulersche Knicklast (Stabilität)",
            category: "Maschinenbau & Statik",
            subcategory: "Festigkeitslehre & Elastizität",
            rawEquation: "Fk = (3.14159265^2 * E * I) / Lk^2",
            latex: "F_k = \\frac{\\pi^2 E I}{L_k^2}",
            description: "Kritische Druckkraft, bei der ein schlanker Stab elastisch ausknickt.",
            variables: [
                FormulaVariable(symbol: "Fk", name: "Knicklast", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "E", name: "E-Modul", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "I", name: "Flächenträgheitsmoment", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "Lk", name: "Knicklänge", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        // ==========================================
        // 7. INFORMATIK & INFORMATION
        // ==========================================

        // Amdahlsches Gesetz
        list.append(FormulaItem(
            id: "cs_amdahl",
            name: "Amdahlsches Gesetz (Parallelisierung)",
            category: "Informatik & Information",
            subcategory: "Systemleistung & Skalierung",
            rawEquation: "S = 1 / ((1 - p) + (p / s))",
            latex: "S = \\frac{1}{(1 - p) + \\frac{p}{s}}",
            description: "Theoretischer Geschwindigkeitszuwachs (Speedup) eines Algorithmus bei paralleler Ausführung.",
            variables: [
                FormulaVariable(symbol: "S", name: "Gesamtspeedup S", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "p", name: "Paralleler Codeanteil p", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "s", name: "Prozessoranzahl / Speedup s", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // Shannon-Hartley
        list.append(FormulaItem(
            id: "cs_shannon",
            name: "Shannon-Hartley-Kanalkapazität",
            category: "Informatik & Information",
            subcategory: "Informationstheorie & Codierung",
            rawEquation: "C = B * 3.321928 * ln(1 + SNR)",
            latex: "C = B \\cdot \\log_2(1 + \\text{SNR})",
            description: "Maximal erreichbare fehlerfreie Übertragungsrate über einen bandbreitenbegrenzten gestörten Kanal.",
            variables: [
                FormulaVariable(symbol: "C", name: "Kanalkapazität", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "B", name: "Kanalbandbreite", defaultUnit: "s", unitCategory: .time),
                FormulaVariable(symbol: "SNR", name: "Signal-Rausch-Verhältnis", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // ==========================================
        // 8. FINANZMATHEMATIK
        // ==========================================

        // Zinseszins
        list.append(FormulaItem(
            id: "fin_compound_interest",
            name: "Zinseszinsrechnung",
            category: "Finanzmathematik",
            subcategory: "Zins & Zinseszins",
            rawEquation: "Kn = K0 * (1 + p / 100)^n",
            latex: "K_n = K_0 \\left(1 + \\frac{p}{100}\\right)^n",
            description: "Endkapital Kn nach n Zinsperioden bei einem periodischen Zinssatz von p %.",
            variables: [
                FormulaVariable(symbol: "Kn", name: "Endkapital Kn", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "K0", name: "Anfangskapital K0", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "p", name: "Zinssatz (%)", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "n", name: "Laufzeit (Jahre)", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // Barwert (Present Value)
        list.append(FormulaItem(
            id: "fin_present_value",
            name: "Barwert / Diskontierung (Present Value)",
            category: "Finanzmathematik",
            subcategory: "Investitionsrechnung & Barwert",
            rawEquation: "PV = FV / (1 + r)^n",
            latex: "PV = \\frac{FV}{(1 + r)^n}",
            description: "Heutiger Gegenwert einer zukünftigen Zahlung FV bei Diskontierungszinssatz r.",
            variables: [
                FormulaVariable(symbol: "PV", name: "Barwert (PV)", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "FV", name: "Zukünftiger Wert (FV)", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "r", name: "Diskontierungssatz r", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "n", name: "Periodenanzahl n", defaultUnit: "1", unitCategory: .dimensionless)
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
'''

with open('Sources/FormulaExMachinaKit/FormulaCatalog.swift', 'w') as f:
    f.write(catalog_swift)

print("FormulaCatalog.swift successfully written.")
