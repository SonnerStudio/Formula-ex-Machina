#!/usr/bin/env python3
"""
Generiert den vollständigen universitären Formelkatalog (FormulaCatalog.swift)
mit allen Fakultäten der Universitäten weltweit:
Mathematik, Physik, Astronomie, Chemie, Biologie & Biophysik,
Elektrotechnik, Maschinenbau, Informatik, Finanzmathematik.
"""

catalog_code = '''import Foundation
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
                    "Thermodynamik & Wärme",
                    "Elektromagnetismus & Felder",
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
                id: "chemistry",
                name: "Chemie",
                iconName: "flask.fill",
                subcategories: [
                    "Gase & Thermodynamik",
                    "Stöchiometrie & Lösungen",
                    "Reaktionskinetik",
                    "Elektrochemie & pH-Gleichgewichte"
                ]
            ),
            FormulaCategoryItem(
                id: "biology",
                name: "Biologie & Biophysik",
                iconName: "leaf.fill",
                subcategories: [
                    "Enzymkinetik & Membrantransport",
                    "Populationsgenetik & Evolution",
                    "Ökologie & Allometrie"
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
                    "Investitionsrechnung & Barwert",
                    "Finanzderivate & Risiko"
                ]
            )
        ]

        var list: [FormulaItem] = []

        // ==========================================
        // 1. MATHEMATIK
        // ==========================================

        list.append(FormulaItem(
            id: "math_golden_ratio",
            name: "Goldener Schnitt (Definition)",
            category: "Mathematik",
            subcategory: "Goldener Schnitt & Folgen",
            rawEquation: "Phi = (1 + sqrt(5)) / 2",
            latex: #"\\Phi = \\frac{1 + \\sqrt{5}}{2} \\approx 1.6180339887"#,
            description: "Die Zahl des Goldenen Schnitts (Divina Proportione). Mathematische Konstante der harmonischen Teilung.",
            variables: [
                FormulaVariable(symbol: "Phi", name: "Goldene Zahl Phi", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "math_golden_ratio_prop",
            name: "Goldener Schnitt (Streckenteilung)",
            category: "Mathematik",
            subcategory: "Goldener Schnitt & Folgen",
            rawEquation: "a = b * 1.6180339887",
            latex: #"a = b \\cdot \\Phi \\quad (\\text{wobei } \\Phi \\approx 1.6180339887)"#,
            description: "Teilung einer Strecke im Verhältnis des Goldenen Schnitts: Der größere Teil 'a' verhält sich zum kleineren 'b' wie das Ganze zum größeren.",
            variables: [
                FormulaVariable(symbol: "a", name: "Major-Segment a", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "b", name: "Minor-Segment b", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_fibonacci_binet",
            name: "Fibonacci-Zahlen (Binet-Formel)",
            category: "Mathematik",
            subcategory: "Goldener Schnitt & Folgen",
            rawEquation: "Fn = (1.6180339887^n - (-0.6180339887)^n) / 2.2360679775",
            latex: #"F_n = \\frac{\\Phi^n - \\Psi^n}{\\sqrt{5}} = \\frac{\\left(\\frac{1+\\sqrt{5}}{2}\\right)^n - \\left(\\frac{1-\\sqrt{5}}{2}\\right)^n}{\\sqrt{5}}"#,
            description: "Explizite geschlossene Formel von Jacques Philippe Marie Binet zur direkten Berechnung der n-ten Fibonacci-Zahl ohne Rekursion.",
            variables: [
                FormulaVariable(symbol: "Fn", name: "Fibonacci-Zahl F(n)", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "n", name: "Index n (ganzzahlig)", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "math_seq_arithmetic_sum",
            name: "Arithmetische Reihe (Summenformel)",
            category: "Mathematik",
            subcategory: "Goldener Schnitt & Folgen",
            rawEquation: "S = n * (a + b) / 2",
            latex: #"S_n = \\frac{n}{2} \\cdot (a_1 + a_n)"#,
            description: "Summe der ersten n Glieder einer arithmetischen Folge nach der Gaußschen Summenformel.",
            variables: [
                FormulaVariable(symbol: "S", name: "Reihensumme S", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "n", name: "Gliederanzahl n", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "a", name: "Erstes Glied a1", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "b", name: "Letztes Glied an", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "math_seq_geometric_sum",
            name: "Geometrische Reihe (Summenformel)",
            category: "Mathematik",
            subcategory: "Goldener Schnitt & Folgen",
            rawEquation: "S = a * (1 - q^n) / (1 - q)",
            latex: #"S_n = a_1 \\cdot \\frac{1 - q^n}{1 - q}"#,
            description: "Summe der ersten n Glieder einer geometrischen Folge mit Quotient q ungleich 1.",
            variables: [
                FormulaVariable(symbol: "S", name: "Reihensumme S", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "a", name: "Anfangsglied a1", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "q", name: "Quotient q", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "n", name: "Anzahl Glieder n", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "math_geom_pythagoras",
            name: "Satz des Pythagoras",
            category: "Mathematik",
            subcategory: "Geometrie 2D (Flächen)",
            rawEquation: "c = sqrt(a^2 + b^2)",
            latex: #"c = \\sqrt{a^2 + b^2}"#,
            description: "In einem rechtwinkligen Dreieck ist das Quadrat über der Hypotenuse gleich der Summe der Quadrate über den Katheten.",
            variables: [
                FormulaVariable(symbol: "c", name: "Hypotenuse c", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "a", name: "Kathete a", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "b", name: "Kathete b", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_geom_circle_area",
            name: "Kreisfläche",
            category: "Mathematik",
            subcategory: "Geometrie 2D (Flächen)",
            rawEquation: "A = 3.1415926535 * r^2",
            latex: #"A = \\pi \\cdot r^2"#,
            description: "Flächeninhalt einer kreisrunden Fläche in Abhängigkeit vom Radius r.",
            variables: [
                FormulaVariable(symbol: "A", name: "Kreisfläche A", defaultUnit: "m²", unitCategory: .dimensionless),
                FormulaVariable(symbol: "r", name: "Radius r", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_geom_circle_perimeter",
            name: "Kreisumfang",
            category: "Mathematik",
            subcategory: "Geometrie 2D (Flächen)",
            rawEquation: "U = 2 * 3.1415926535 * r",
            latex: #"U = 2 \\cdot \\pi \\cdot r"#,
            description: "Umfangslinie eines Kreises mit Radius r.",
            variables: [
                FormulaVariable(symbol: "U", name: "Umfang U", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "r", name: "Radius r", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_geom_ellipse_area",
            name: "Ellipsenfläche",
            category: "Mathematik",
            subcategory: "Geometrie 2D (Flächen)",
            rawEquation: "A = 3.1415926535 * a * b",
            latex: #"A = \\pi \\cdot a \\cdot b"#,
            description: "Fläche einer Ellipse mit den großen und kleinen Halbachsen a und b.",
            variables: [
                FormulaVariable(symbol: "A", name: "Ellipsenfläche A", defaultUnit: "m²", unitCategory: .dimensionless),
                FormulaVariable(symbol: "a", name: "Große Halbachse a", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "b", name: "Kleine Halbachse b", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_geom_triangle_area",
            name: "Dreiecksfläche (Standard)",
            category: "Mathematik",
            subcategory: "Geometrie 2D (Flächen)",
            rawEquation: "A = 0.5 * g * h",
            latex: #"A = \\frac{1}{2} \\cdot g \\cdot h"#,
            description: "Fläche eines beliebigen Dreiecks aus Grundseite g und zugehöriger Höhe h.",
            variables: [
                FormulaVariable(symbol: "A", name: "Dreiecksfläche A", defaultUnit: "m²", unitCategory: .dimensionless),
                FormulaVariable(symbol: "g", name: "Grundseite g", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "h", name: "Höhe h", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_geom_sphere_vol",
            name: "Kugelvolumen",
            category: "Mathematik",
            subcategory: "Geometrie 3D (Körper)",
            rawEquation: "V = (4 / 3) * 3.1415926535 * r^3",
            latex: #"V = \\frac{4}{3} \\cdot \\pi \\cdot r^3"#,
            description: "Rauminhalt einer geometrischen Vollkugel mit Radius r.",
            variables: [
                FormulaVariable(symbol: "V", name: "Kugelvolumen V", defaultUnit: "m³", unitCategory: .dimensionless),
                FormulaVariable(symbol: "r", name: "Kugelradius r", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_geom_sphere_surface",
            name: "Kugeloberfläche",
            category: "Mathematik",
            subcategory: "Geometrie 3D (Körper)",
            rawEquation: "A = 4 * 3.1415926535 * r^2",
            latex: #"A = 4 \\cdot \\pi \\cdot r^2"#,
            description: "Gesamte äußere Oberfläche einer Sphäre/Kugel.",
            variables: [
                FormulaVariable(symbol: "A", name: "Oberfläche A", defaultUnit: "m²", unitCategory: .dimensionless),
                FormulaVariable(symbol: "r", name: "Kugelradius r", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_geom_cylinder_vol",
            name: "Zylindervolumen",
            category: "Mathematik",
            subcategory: "Geometrie 3D (Körper)",
            rawEquation: "V = 3.1415926535 * r^2 * h",
            latex: #"V = \\pi \\cdot r^2 \\cdot h"#,
            description: "Volumen eines geraden Kreiszylinders mit Radius r und Höhe h.",
            variables: [
                FormulaVariable(symbol: "V", name: "Zylindervolumen V", defaultUnit: "m³", unitCategory: .dimensionless),
                FormulaVariable(symbol: "r", name: "Radius r", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "h", name: "Höhe h", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_geom_cone_vol",
            name: "Kegelvolumen",
            category: "Mathematik",
            subcategory: "Geometrie 3D (Körper)",
            rawEquation: "V = (1 / 3) * 3.1415926535 * r^2 * h",
            latex: #"V = \\frac{1}{3} \\cdot \\pi \\cdot r^2 \\cdot h"#,
            description: "Rauminhalt eines geraden Kreiskegels mit Radius r und Höhe h.",
            variables: [
                FormulaVariable(symbol: "V", name: "Kegelvolumen V", defaultUnit: "m³", unitCategory: .dimensionless),
                FormulaVariable(symbol: "r", name: "Grundradius r", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "h", name: "Höhe h", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_geom_torus_vol",
            name: "Torusvolumen (Kreisringkörper)",
            category: "Mathematik",
            subcategory: "Geometrie 3D (Körper)",
            rawEquation: "V = 2 * (3.1415926535^2) * R * r^2",
            latex: #"V = 2 \\pi^2 \\cdot R \\cdot r^2"#,
            description: "Rauminhalt eines Torus nach der Guldinschen Regel mit großem Radius R und Querschnittsradius r.",
            variables: [
                FormulaVariable(symbol: "V", name: "Torusvolumen V", defaultUnit: "m³", unitCategory: .dimensionless),
                FormulaVariable(symbol: "R", name: "Großer Radius R (Mitte)", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "r", name: "Kleiner Radius r (Rohr)", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "math_alg_quadratic",
            name: "Quadratische Gleichung (pq-Formel)",
            category: "Mathematik",
            subcategory: "Algebra & Analysis",
            rawEquation: "x = -0.5 * p + sqrt((0.5 * p)^2 - q)",
            latex: #"x_{1} = -\\frac{p}{2} + \\sqrt{\\left(\\frac{p}{2}\\right)^2 - q}"#,
            description: "Lösungsformel für normierte quadratische Gleichungen x² + px + q = 0.",
            variables: [
                FormulaVariable(symbol: "x", name: "Lösung x1", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "p", name: "Koeffizient p", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "q", name: "Absolutglied q", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "math_alg_stirling",
            name: "Stirling-Formel (Fakultäts-Approximation)",
            category: "Mathematik",
            subcategory: "Algebra & Analysis",
            rawEquation: "fact = sqrt(2 * 3.1415926535 * n) * (n / 2.7182818284)^n",
            latex: #"n! \\approx \\sqrt{2 \\pi n} \\cdot \\left(\\frac{n}{e}\\right)^n"#,
            description: "Asymptotische Näherungsformel von James Stirling für große Fakultäten n!.",
            variables: [
                FormulaVariable(symbol: "fact", name: "Näherungswert n!", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "n", name: "Zahl n", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "math_stat_bayes",
            name: "Satz von Bayes (Bedingte Wahrscheinlichkeit)",
            category: "Mathematik",
            subcategory: "Statistik & Stochastik",
            rawEquation: "P_post = (P_prior * P_likeli) / P_evidence",
            latex: #"P(A|B) = \\frac{P(B|A) \\cdot P(A)}{P(B)}"#,
            description: "Fundamentales Theorem der Wahrscheinlichkeitsrechnung zur Berechnung der A-posteriori-Wahrscheinlichkeit.",
            variables: [
                FormulaVariable(symbol: "P_post", name: "A-posteriori P(A|B)", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "P_prior", name: "A-priori P(A)", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "P_likeli", name: "Likelihood P(B|A)", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "P_evidence", name: "Evidenz P(B)", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // ==========================================
        // 2. PHYSIK
        // ==========================================

        list.append(FormulaItem(
            id: "phys_kin_speed",
            name: "Geschwindigkeit (Gleichförmige Bewegung)",
            category: "Physik",
            subcategory: "Kinematik",
            rawEquation: "v = s / t",
            latex: #"v = \\frac{s}{t}"#,
            description: "Durchschnittliche Geschwindigkeit eines Körpers auf einer geradlinigen Strecke s im Zeitintervall t.",
            variables: [
                FormulaVariable(symbol: "v", name: "Geschwindigkeit v", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "s", name: "Wegstrecke s", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "t", name: "Zeitdauer t", defaultUnit: "s", unitCategory: .time)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_kin_accel",
            name: "Gleichmäßig beschleunigte Bewegung (Geschwindigkeit)",
            category: "Physik",
            subcategory: "Kinematik",
            rawEquation: "v = v0 + a * t",
            latex: #"v = v_0 + a \\cdot t"#,
            description: "Momentangeschwindigkeit bei konstanter linearer Beschleunigung 'a' mit Anfangsgeschwindigkeit v0.",
            variables: [
                FormulaVariable(symbol: "v", name: "Endgeschwindigkeit v", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "v0", name: "Anfangsgeschwindigkeit v0", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "a", name: "Beschleunigung a", defaultUnit: "m/s²", unitCategory: .acceleration),
                FormulaVariable(symbol: "t", name: "Zeitdauer t", defaultUnit: "s", unitCategory: .time)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_kin_dist_accel",
            name: "Weg-Zeit-Gesetz (Beschleunigung)",
            category: "Physik",
            subcategory: "Kinematik",
            rawEquation: "s = v0 * t + 0.5 * a * t^2",
            latex: #"s = v_0 \\cdot t + \\frac{1}{2} a \\cdot t^2"#,
            description: "Zurückgelegte Strecke bei gleichmäßig beschleunigter linearer Bewegung.",
            variables: [
                FormulaVariable(symbol: "s", name: "Wegstrecke s", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "v0", name: "Anfangsgeschwindigkeit v0", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "a", name: "Beschleunigung a", defaultUnit: "m/s²", unitCategory: .acceleration),
                FormulaVariable(symbol: "t", name: "Zeitdauer t", defaultUnit: "s", unitCategory: .time)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_kin_centripetal",
            name: "Zentripetalbeschleunigung",
            category: "Physik",
            subcategory: "Kinematik",
            rawEquation: "a = v^2 / r",
            latex: #"a_z = \\frac{v^2}{r}"#,
            description: "Auf das Zentrum gerichtete Radialbeschleunigung bei einer gleichförmigen Kreisbewegung.",
            variables: [
                FormulaVariable(symbol: "a", name: "Zentripetalbeschleunigung az", defaultUnit: "m/s²", unitCategory: .acceleration),
                FormulaVariable(symbol: "v", name: "Bahngeschwindigkeit v", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "r", name: "Kurvenradius r", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_dyn_newton2",
            name: "2. Newtonsches Axiom (Grundgesetz)",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "F = m * a",
            latex: #"F = m \\cdot a"#,
            description: "Axiom der klassischen Mechanik: Die Kraft F auf eine träge Masse m bewirkt eine proportionale Beschleunigung a.",
            variables: [
                FormulaVariable(symbol: "F", name: "Kraft F", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "m", name: "Masse m", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "a", name: "Beschleunigung a", defaultUnit: "m/s²", unitCategory: .acceleration)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_dyn_friction",
            name: "Coulombsche Reibungskraft",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "F = mu * FN",
            latex: #"F_R = \\mu \\cdot F_N"#,
            description: "Reibungskraft an Berührungsflächen proportional zur Normalkraft FN und Reibbeiwert mu.",
            variables: [
                FormulaVariable(symbol: "F", name: "Reibungskraft FR", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "mu", name: "Reibbeiwert mu", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "FN", name: "Normalkraft FN", defaultUnit: "N", unitCategory: .force)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_dyn_hooke_spring",
            name: "Hookesches Gesetz (Federkraft)",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "F = k * s",
            latex: #"F = k \\cdot s"#,
            description: "Rückstellkraft einer linearen elastischen Feder bei Auslenkung s mit Federkonstante k.",
            variables: [
                FormulaVariable(symbol: "F", name: "Federkraft F", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "k", name: "Federsteifigkeit k", defaultUnit: "N/m", unitCategory: .dimensionless),
                FormulaVariable(symbol: "s", name: "Auslenkung / Dehnung s", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_dyn_momentum",
            name: "Mechanischer Impuls",
            category: "Physik",
            subcategory: "Dynamik",
            rawEquation: "p = m * v",
            latex: #"p = m \\cdot v"#,
            description: "Produkt aus träger Masse m und Geschwindigkeit v eines Körpers. Fundamentale Erhaltungsgröße.",
            variables: [
                FormulaVariable(symbol: "p", name: "Impuls p", defaultUnit: "kg·m/s", unitCategory: .dimensionless),
                FormulaVariable(symbol: "m", name: "Masse m", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "v", name: "Geschwindigkeit v", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_nrj_kin",
            name: "Kinetische Energie (Bewegungsenergie)",
            category: "Physik",
            subcategory: "Arbeit & Energie",
            rawEquation: "E = 0.5 * m * v^2",
            latex: #"E_k = \\frac{1}{2} m \\cdot v^2"#,
            description: "Mechanische Energie eines translatorisch bewegten Körpers mit Masse m und Geschwindigkeit v.",
            variables: [
                FormulaVariable(symbol: "E", name: "Kinetische Energie Ek", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "m", name: "Masse m", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "v", name: "Geschwindigkeit v", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_nrj_pot",
            name: "Potenzielle Energie (Lageenergie)",
            category: "Physik",
            subcategory: "Arbeit & Energie",
            rawEquation: "E = m * g * h",
            latex: #"E_p = m \\cdot g \\cdot h"#,
            description: "Gravitative Lageenergie im homogenen Schwerefeld der Erde.",
            variables: [
                FormulaVariable(symbol: "E", name: "Potenzielle Energie Ep", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "m", name: "Masse m", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "g", name: "Fallbeschleunigung g", defaultUnit: "m/s²", unitCategory: .acceleration),
                FormulaVariable(symbol: "h", name: "Höhe h", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_nrj_power",
            name: "Mechanische Leistung",
            category: "Physik",
            subcategory: "Arbeit & Energie",
            rawEquation: "P = W / t",
            latex: #"P = \\frac{W}{t}"#,
            description: "Verrichtete Arbeit W pro Zeiteinheit t.",
            variables: [
                FormulaVariable(symbol: "P", name: "Leistung P", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "W", name: "Arbeit / Energie W", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "t", name: "Zeitdauer t", defaultUnit: "s", unitCategory: .time)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_nrj_efficiency",
            name: "Wirkungsgrad",
            category: "Physik",
            subcategory: "Arbeit & Energie",
            rawEquation: "eta = Pab / Pzu",
            latex: #"\\eta = \\frac{P_{ab}}{P_{zu}}"#,
            description: "Verhältnis von abgegebener Nutzleistung zur zugeführten Gesamtleistung.",
            variables: [
                FormulaVariable(symbol: "eta", name: "Wirkungsgrad eta", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "Pab", name: "Nutzleistung Pab", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "Pzu", name: "Zugeführte Leistung Pzu", defaultUnit: "W", unitCategory: .power)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_osc_pendulum",
            name: "Fadenpendel (Schwingungsdauer)",
            category: "Physik",
            subcategory: "Schwingungen & Wellen",
            rawEquation: "T = 2 * 3.1415926535 * sqrt(l / g)",
            latex: #"T = 2 \\pi \\cdot \\sqrt{\\frac{l}{g}}"#,
            description: "Periodendauer eines mathematischen Pendels bei kleinen Auslenkungswinkeln.",
            variables: [
                FormulaVariable(symbol: "T", name: "Periodendauer T", defaultUnit: "s", unitCategory: .time),
                FormulaVariable(symbol: "l", name: "Pendellänge l", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "g", name: "Fallbeschleunigung g", defaultUnit: "m/s²", unitCategory: .acceleration)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_osc_spring",
            name: "Federschwinger (Periodendauer)",
            category: "Physik",
            subcategory: "Schwingungen & Wellen",
            rawEquation: "T = 2 * 3.1415926535 * sqrt(m / k)",
            latex: #"T = 2 \\pi \\cdot \\sqrt{\\frac{m}{k}}"#,
            description: "Eigenperiode eines harmonischen Oszillators mit Masse m und Federkonstante k.",
            variables: [
                FormulaVariable(symbol: "T", name: "Periodendauer T", defaultUnit: "s", unitCategory: .time),
                FormulaVariable(symbol: "m", name: "Masse m", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "k", name: "Federsteifigkeit k", defaultUnit: "N/m", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_wave_speed",
            name: "Wellengleichung (Phasengeschwindigkeit)",
            category: "Physik",
            subcategory: "Schwingungen & Wellen",
            rawEquation: "c = lambda * f",
            latex: #"c = \\lambda \\cdot f"#,
            description: "Ausbreitungsgeschwindigkeit einer Welle aus Wellenlänge lambda und Frequenz f.",
            variables: [
                FormulaVariable(symbol: "c", name: "Phasengeschwindigkeit c", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "lambda", name: "Wellenlänge lambda", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "f", name: "Frequenz f", defaultUnit: "Hz", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_opt_wien",
            name: "Wiensches Verschiebungsgesetz",
            category: "Physik",
            subcategory: "Optik & Strahlung",
            rawEquation: "lambda = 0.0028977719 / T",
            latex: #"\\lambda_{max} = \\frac{b}{T} \\quad (b \\approx 2.89777 \\cdot 10^{-3}\\,\\text{m}\\cdot\\text{K})"#,
            description: "Zusammenhang zwischen thermodynamischer Temperatur eines schwarzen Strahlers und dem Maximum seines Emissionsspektrums.",
            variables: [
                FormulaVariable(symbol: "lambda", name: "Wellenlängenmaximum lambda_max", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "T", name: "Absolute Temperatur T", defaultUnit: "K", unitCategory: .temperature)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_thermo_heat",
            name: "Spezifische Wärmekapazität (Wärmemenge)",
            category: "Physik",
            subcategory: "Thermodynamik & Wärme",
            rawEquation: "Q = m * c * dT",
            latex: #"Q = m \\cdot c \\cdot \\Delta T"#,
            description: "Benötigte thermische Energie zur Erwärmung eines Körpers der Masse m um die Temperaturdifferenz dT.",
            variables: [
                FormulaVariable(symbol: "Q", name: "Wärmemenge Q", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "m", name: "Masse m", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "c", name: "Spezifische Wärmekapazität c", defaultUnit: "J/(kg·K)", unitCategory: .dimensionless),
                FormulaVariable(symbol: "dT", name: "Temperaturdifferenz dT", defaultUnit: "K", unitCategory: .temperature)
            ]
        ))

        list.append(FormulaItem(
            id: "thermo_carnot",
            name: "Carnot-Wirkungsgrad",
            category: "Physik",
            subcategory: "Thermodynamik & Wärme",
            rawEquation: "eta = 1 - (TK / TH)",
            latex: #"\\eta_C = 1 - \\frac{T_{kalt}}{T_{heiss}}"#,
            description: "Maximal erreichbarer theoretischer thermodynamischer Wirkungsgrad einer Wärmekraftmaschine.",
            variables: [
                FormulaVariable(symbol: "eta", name: "Carnot-Wirkungsgrad eta", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "TK", name: "Temperatur kaltes Reservoir", defaultUnit: "K", unitCategory: .temperature),
                FormulaVariable(symbol: "TH", name: "Temperatur warmes Reservoir", defaultUnit: "K", unitCategory: .temperature)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_elec_coulomb",
            name: "Coulombsches Gesetz (Elektrostatik)",
            category: "Physik",
            subcategory: "Elektromagnetismus & Felder",
            rawEquation: "F = 8.9875517923e9 * (q1 * q2) / r^2",
            latex: #"F = \\frac{1}{4\\pi\\varepsilon_0} \\cdot \\frac{q_1 \\cdot q_2}{r^2}"#,
            description: "Elektrostatische Kraftwirkung zwischen zwei punktförmigen Ladungen q1 und q2 im Vakuum.",
            variables: [
                FormulaVariable(symbol: "F", name: "Coulombkraft F", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "q1", name: "Elektrische Ladung q1", defaultUnit: "C", unitCategory: .dimensionless),
                FormulaVariable(symbol: "q2", name: "Elektrische Ladung q2", defaultUnit: "C", unitCategory: .dimensionless),
                FormulaVariable(symbol: "r", name: "Abstand r", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_elec_field",
            name: "Homogenes Elektrisches Feld",
            category: "Physik",
            subcategory: "Elektromagnetismus & Felder",
            rawEquation: "E = U / d",
            latex: #"E = \\frac{U}{d}"#,
            description: "Elektrische Feldstärke im homogenen Feld (Plattenkondensator) bei Spannung U und Plattenabstand d.",
            variables: [
                FormulaVariable(symbol: "E", name: "Elektrische Feldstärke E", defaultUnit: "V/m", unitCategory: .dimensionless),
                FormulaVariable(symbol: "U", name: "Spannung U", defaultUnit: "V", unitCategory: .electricVoltage),
                FormulaVariable(symbol: "d", name: "Plattenabstand d", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_rel_einstein",
            name: "Äquivalenz von Masse und Energie",
            category: "Physik",
            subcategory: "Relativität & Quantenphysik",
            rawEquation: "E = m * (2.99792458e8)^2",
            latex: #"E = m \\cdot c^2 \\quad (c \\approx 2.99792458 \\cdot 10^8\\,\\text{m/s})"#,
            description: "Einsteins berühmteste Formel der Speziellen Relativitätstheorie: Ruhemasse entspricht Ruheenergie.",
            variables: [
                FormulaVariable(symbol: "E", name: "Ruheenergie E", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "m", name: "Masse m", defaultUnit: "kg", unitCategory: .mass)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_rel_gamma",
            name: "Lorentz-Faktor",
            category: "Physik",
            subcategory: "Relativität & Quantenphysik",
            rawEquation: "gamma = 1 / sqrt(1 - (v / 2.99792458e8)^2)",
            latex: #"\\gamma = \\frac{1}{\\sqrt{1 - \\frac{v^2}{c^2}}}"#,
            description: "Relativistischer Skalierungsfaktor für Zeitdilatation und Längenkontraktion.",
            variables: [
                FormulaVariable(symbol: "gamma", name: "Lorentzfaktor gamma", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "v", name: "Geschwindigkeit v", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_quant_photon",
            name: "Photonenenergie (Planck-Einstein)",
            category: "Physik",
            subcategory: "Relativität & Quantenphysik",
            rawEquation: "E = 6.62607015e-34 * f",
            latex: #"E = h \\cdot f \\quad (h \\approx 6.62607 \\cdot 10^{-34}\\,\\text{J}\\cdot\\text{s})"#,
            description: "Quantelung elektromagnetischer Strahlung: Energie eines Photons proportional zu seiner Frequenz f.",
            variables: [
                FormulaVariable(symbol: "E", name: "Photonenenergie E", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "f", name: "Frequenz f", defaultUnit: "Hz", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "phys_quant_debroglie",
            name: "De-Broglie-Wellenlänge (Materiewellen)",
            category: "Physik",
            subcategory: "Relativität & Quantenphysik",
            rawEquation: "lambda = 6.62607015e-34 / p",
            latex: #"\\lambda = \\frac{h}{p}"#,
            description: "Welle-Teilchen-Dualismus: Wellenlänge eines massereichen Teilchens mit Impuls p.",
            variables: [
                FormulaVariable(symbol: "lambda", name: "De-Broglie-Wellenlänge lambda", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "p", name: "Impuls p", defaultUnit: "kg·m/s", unitCategory: .dimensionless)
            ]
        ))

        // ==========================================
        // 3. ASTRONOMIE & ASTROPHYSIK
        // ==========================================

        list.append(FormulaItem(
            id: "astro_grav_newton",
            name: "Newtonsches Gravitationsgesetz",
            category: "Astronomie & Astrophysik",
            subcategory: "Gravitation & Bahnbewegung",
            rawEquation: "F = 6.67430e-11 * (m1 * m2) / r^2",
            latex: #"F = G \\cdot \\frac{m_1 \\cdot m_2}{r^2} \\quad (G \\approx 6.67430 \\cdot 10^{-11}\\,\\text{m}^3/(\\text{kg}\\cdot\\text{s}^2))"#,
            description: "Universelle Massenanziehung zwischen zwei Himmelskörpern im Abstand r.",
            variables: [
                FormulaVariable(symbol: "F", name: "Gravitationskraft F", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "m1", name: "Masse 1 (z. B. Stern)", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "m2", name: "Masse 2 (z. B. Planet)", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "r", name: "Abstand r", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "astro_orbital_vel",
            name: "1. Kosmische Geschwindigkeit (Kreisbahn)",
            category: "Astronomie & Astrophysik",
            subcategory: "Gravitation & Bahnbewegung",
            rawEquation: "v = sqrt(6.67430e-11 * M / R)",
            latex: #"v_1 = \\sqrt{\\frac{G \\cdot M}{R}}"#,
            description: "Notwendige Kreisbahngeschwindigkeit eines Satelliten um einen Zentralkörper ohne abzustürzen.",
            variables: [
                FormulaVariable(symbol: "v", name: "Kreisbahngeschwindigkeit v1", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "M", name: "Masse des Zentralkörpers M", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "R", name: "Bahnradius R", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "astro_escape_vel",
            name: "2. Kosmische Geschwindigkeit (Fluchtgeschwindigkeit)",
            category: "Astronomie & Astrophysik",
            subcategory: "Gravitation & Bahnbewegung",
            rawEquation: "v = sqrt(2 * 6.67430e-11 * M / R)",
            latex: #"v_{esc} = \\sqrt{\\frac{2 \\cdot G \\cdot M}{R}}"#,
            description: "Mindestgeschwindigkeit zum Verlassen des Gravitationsfeldes eines Himmelskörpers.",
            variables: [
                FormulaVariable(symbol: "v", name: "Fluchtgeschwindigkeit vesc", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "M", name: "Masse des Himmelskörpers M", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "R", name: "Radius des Himmelskörpers R", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "astro_schwarzschild",
            name: "Schwarzschild-Radius (Ereignishorizont)",
            category: "Astronomie & Astrophysik",
            subcategory: "Hochenergie-Astrophysik",
            rawEquation: "Rs = (2 * 6.67430e-11 * M) / (2.99792458e8)^2",
            latex: #"R_s = \\frac{2 \\cdot G \\cdot M}{c^2}"#,
            description: "Radius des Ereignishorizonts eines statischen Schwarzen Lochs gegebener Masse M.",
            variables: [
                FormulaVariable(symbol: "Rs", name: "Schwarzschild-Radius Rs", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "M", name: "Masse des Schwarzen Lochs M", defaultUnit: "kg", unitCategory: .mass)
            ]
        ))

        list.append(FormulaItem(
            id: "astro_hubble",
            name: "Hubble-Lemaître-Gesetz (Kosmische Expansion)",
            category: "Astronomie & Astrophysik",
            subcategory: "Kosmologie & Sterne",
            rawEquation: "v = H0 * d",
            latex: #"v = H_0 \\cdot d"#,
            description: "Fluchtgeschwindigkeit entfernter Galaxien proportional zu ihrer Entfernung d.",
            variables: [
                FormulaVariable(symbol: "v", name: "Fluchtgeschwindigkeit v", defaultUnit: "km/s", unitCategory: .dimensionless),
                FormulaVariable(symbol: "H0", name: "Hubble-Konstante H0", defaultUnit: "km/(s·Mpc)", unitCategory: .dimensionless),
                FormulaVariable(symbol: "d", name: "Entfernung d", defaultUnit: "Mpc", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "astro_stefan_boltzmann",
            name: "Stefan-Boltzmann-Gesetz (Sternleuchtkraft)",
            category: "Astronomie & Astrophysik",
            subcategory: "Kosmologie & Sterne",
            rawEquation: "L = 4 * 3.1415926535 * (R^2) * 5.670374419e-8 * (T^4)",
            latex: #"L = 4 \\pi \\cdot R^2 \\cdot \\sigma \\cdot T^4"#,
            description: "Gesamte bolometrische Strahlungsleistung eines kugelförmigen Sterns aus Radius R und Effektivtemperatur T.",
            variables: [
                FormulaVariable(symbol: "L", name: "Leuchtkraft L", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "R", name: "Sternradius R", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "T", name: "Effektive Oberflächentemperatur T", defaultUnit: "K", unitCategory: .temperature)
            ]
        ))

        // ==========================================
        // 4. CHEMIE
        // ==========================================

        list.append(FormulaItem(
            id: "chem_gas_ideal",
            name: "Ideales Gasgesetz",
            category: "Chemie",
            subcategory: "Gase & Thermodynamik",
            rawEquation: "p = (n * 8.314462618 * T) / V",
            latex: #"p \\cdot V = n \\cdot R \\cdot T \\quad (R \\approx 8.31446\\,\\text{J}/(\\text{mol}\\cdot\\text{K}))"#,
            description: "Zustandsgleichung idealer Gase zwischen Druck p, Volumen V, Stoffmenge n und Temperatur T.",
            variables: [
                FormulaVariable(symbol: "p", name: "Druck p", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "V", name: "Volumen V", defaultUnit: "m³", unitCategory: .dimensionless),
                FormulaVariable(symbol: "n", name: "Stoffmenge n", defaultUnit: "mol", unitCategory: .dimensionless),
                FormulaVariable(symbol: "T", name: "Thermodynamische Temperatur T", defaultUnit: "K", unitCategory: .temperature)
            ]
        ))

        list.append(FormulaItem(
            id: "chem_stoich_molar_mass",
            name: "Stoffmenge & Molare Masse",
            category: "Chemie",
            subcategory: "Stöchiometrie & Lösungen",
            rawEquation: "n = m / M",
            latex: #"n = \\frac{m}{M}"#,
            description: "Zusammenhang zwischen Einwaage m, molarer Masse M und Stoffmenge n in der chemischen Stöchiometrie.",
            variables: [
                FormulaVariable(symbol: "n", name: "Stoffmenge n", defaultUnit: "mol", unitCategory: .dimensionless),
                FormulaVariable(symbol: "m", name: "Masse m", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "M", name: "Molare Masse M", defaultUnit: "kg/mol", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "chem_sol_molarity",
            name: "Stoffmengenkonzentration (Molarität)",
            category: "Chemie",
            subcategory: "Stöchiometrie & Lösungen",
            rawEquation: "c = n / V",
            latex: #"c = \\frac{n}{V}"#,
            description: "Konzentration gelöster Teilchen n im Gesamtvolumen V der chemischen Lösung.",
            variables: [
                FormulaVariable(symbol: "c", name: "Konzentration c", defaultUnit: "mol/l", unitCategory: .dimensionless),
                FormulaVariable(symbol: "n", name: "Stoffmenge n", defaultUnit: "mol", unitCategory: .dimensionless),
                FormulaVariable(symbol: "V", name: "Lösungsvolumen V", defaultUnit: "l", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "chem_thermo_gibbs",
            name: "Gibbs-Helmholtz-Gleichung (Freie Enthalpie)",
            category: "Chemie",
            subcategory: "Gase & Thermodynamik",
            rawEquation: "dG = dH - T * dS",
            latex: #"\\Delta G = \\Delta H - T \\cdot \\Delta S"#,
            description: "Spontanitätskriterium chemischer Reaktionen: Delta G < 0 entspricht einer freiwillig ablaufenden exergonen Reaktion.",
            variables: [
                FormulaVariable(symbol: "dG", name: "Freie Reaktionsenthalpie Delta G", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "dH", name: "Reaktionsenthalpie Delta H", defaultUnit: "J", unitCategory: .energy),
                FormulaVariable(symbol: "T", name: "Reaktionstemperatur T", defaultUnit: "K", unitCategory: .temperature),
                FormulaVariable(symbol: "dS", name: "Reaktionsentropie Delta S", defaultUnit: "J/K", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "chem_elchem_faraday",
            name: "Faradaysches Gesetz der Elektrolyse",
            category: "Chemie",
            subcategory: "Elektrochemie & pH-Gleichgewichte",
            rawEquation: "m = (M * I * t) / (z * 96485.33212)",
            latex: #"m = \\frac{M \\cdot I \\cdot t}{z \\cdot F} \\quad (F \\approx 96485.33\\,\\text{C/mol})"#,
            description: "Abscheidungsmasse eines Elements an der Elektrode bei Stromfluss I und Zeit t.",
            variables: [
                FormulaVariable(symbol: "m", name: "Abgeschiedene Masse m", defaultUnit: "kg", unitCategory: .mass),
                FormulaVariable(symbol: "M", name: "Molare Masse M", defaultUnit: "kg/mol", unitCategory: .dimensionless),
                FormulaVariable(symbol: "I", name: "Elektrolysestrom I", defaultUnit: "A", unitCategory: .electricCurrent),
                FormulaVariable(symbol: "t", name: "Elektrolysedauer t", defaultUnit: "s", unitCategory: .time),
                FormulaVariable(symbol: "z", name: "Wertigkeit / Ladungszahl z", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        // ==========================================
        // 5. BIOLOGIE & BIOPHYSIK
        // ==========================================

        list.append(FormulaItem(
            id: "bio_kin_michaelis_menten",
            name: "Michaelis-Menten-Enzymkinetik",
            category: "Biologie & Biophysik",
            subcategory: "Enzymkinetik & Membrantransport",
            rawEquation: "v = (Vmax * S) / (Km + S)",
            latex: #"v = \\frac{V_{max} \\cdot [S]}{K_m + [S]}"#,
            description: "Geschwindigkeit enzymkatalysierter biochemischer Reaktionen in Abhängigkeit von der Substratkonzentration [S].",
            variables: [
                FormulaVariable(symbol: "v", name: "Reaktionsgeschwindigkeit v", defaultUnit: "mol/(l·s)", unitCategory: .dimensionless),
                FormulaVariable(symbol: "Vmax", name: "Maximalgeschwindigkeit Vmax", defaultUnit: "mol/(l·s)", unitCategory: .dimensionless),
                FormulaVariable(symbol: "S", name: "Substratkonzentration [S]", defaultUnit: "mol/l", unitCategory: .dimensionless),
                FormulaVariable(symbol: "Km", name: "Michaelis-Konstante Km", defaultUnit: "mol/l", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "bio_gen_hardy_weinberg",
            name: "Hardy-Weinberg-Gleichgewicht (Heterozygotenrate)",
            category: "Biologie & Biophysik",
            subcategory: "Populationsgenetik & Evolution",
            rawEquation: "H = 2 * p * (1 - p)",
            latex: #"2pq = 2 \\cdot p \\cdot (1 - p) \\quad (p + q = 1)"#,
            description: "Heterozygotenfrequenz in einer idealen Population unter Zufallspaarung ohne Selektion.",
            variables: [
                FormulaVariable(symbol: "H", name: "Heterozygotenanteil 2pq", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "p", name: "Allelhäufigkeit p", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "bio_diff_fick",
            name: "1. Ficksches Diffusionsgesetz",
            category: "Biologie & Biophysik",
            subcategory: "Enzymkinetik & Membrantransport",
            rawEquation: "J = D * (c1 - c2) / d",
            latex: #"J = D \\cdot \\frac{\\Delta c}{\\Delta x}"#,
            description: "Stoffstromdichte J durch eine Biomembran oder Gewebeschicht der Dicke d bei Konzentrationsdifferenz.",
            variables: [
                FormulaVariable(symbol: "J", name: "Diffusionsstromdichte J", defaultUnit: "mol/(m²·s)", unitCategory: .dimensionless),
                FormulaVariable(symbol: "D", name: "Diffusionskoeffizient D", defaultUnit: "m²/s", unitCategory: .dimensionless),
                FormulaVariable(symbol: "c1", name: "Konzentration außen c1", defaultUnit: "mol/m³", unitCategory: .dimensionless),
                FormulaVariable(symbol: "c2", name: "Konzentration innen c2", defaultUnit: "mol/m³", unitCategory: .dimensionless),
                FormulaVariable(symbol: "d", name: "Membrandicke d", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "bio_ecol_kleiber",
            name: "Kleibersches Gesetz (Allometrischer Grundumsatz)",
            category: "Biologie & Biophysik",
            subcategory: "Ökologie & Allometrie",
            rawEquation: "B = B0 * M^0.75",
            latex: #"B = B_0 \\cdot M^{3/4}"#,
            description: "Biologisches Skalierungsgesetz: Der Ruheumsatz B eines Organismus skaliert mit der 3/4-Potenz seiner Körpermasse M.",
            variables: [
                FormulaVariable(symbol: "B", name: "Metabolischer Grundumsatz B", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "B0", name: "Artenspezifische Konstante B0", defaultUnit: "W/kg^0.75", unitCategory: .dimensionless),
                FormulaVariable(symbol: "M", name: "Körpermasse M", defaultUnit: "kg", unitCategory: .mass)
            ]
        ))

        // ==========================================
        // 6. ELEKTROTECHNIK
        // ==========================================

        list.append(FormulaItem(
            id: "elec_ohm",
            name: "Ohmsches Gesetz",
            category: "Elektrotechnik",
            subcategory: "Gleichstrom & Netzwerke",
            rawEquation: "U = R * I",
            latex: #"U = R \\cdot I"#,
            description: "Linearer Zusammenhang zwischen elektrischer Spannung U, ohmschem Widerstand R und Stromstärke I.",
            variables: [
                FormulaVariable(symbol: "U", name: "Spannung U", defaultUnit: "V", unitCategory: .electricVoltage),
                FormulaVariable(symbol: "R", name: "Widerstand R", defaultUnit: "Ω", unitCategory: .electricResistance),
                FormulaVariable(symbol: "I", name: "Stromstärke I", defaultUnit: "A", unitCategory: .electricCurrent)
            ]
        ))

        list.append(FormulaItem(
            id: "elec_power_ui",
            name: "Elektrische Leistung (Gleichstrom)",
            category: "Elektrotechnik",
            subcategory: "Gleichstrom & Netzwerke",
            rawEquation: "P = U * I",
            latex: #"P = U \\cdot I"#,
            description: "Gleichstromleistung aus angelegter Spannung U und fließendem Gleichstrom I.",
            variables: [
                FormulaVariable(symbol: "P", name: "Elektrische Leistung P", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "U", name: "Spannung U", defaultUnit: "V", unitCategory: .electricVoltage),
                FormulaVariable(symbol: "I", name: "Stromstärke I", defaultUnit: "A", unitCategory: .electricCurrent)
            ]
        ))

        list.append(FormulaItem(
            id: "elec_power_ri",
            name: "Joulesche Wärmeleistung (Widerstandsverlust)",
            category: "Elektrotechnik",
            subcategory: "Gleichstrom & Netzwerke",
            rawEquation: "P = R * I^2",
            latex: #"P = R \\cdot I^2"#,
            description: "Wärmeverlustleistung in einem Leiter mit Widerstand R bei Stromdurchfluss I.",
            variables: [
                FormulaVariable(symbol: "P", name: "Verlustleistung P", defaultUnit: "W", unitCategory: .power),
                FormulaVariable(symbol: "R", name: "Widerstand R", defaultUnit: "Ω", unitCategory: .electricResistance),
                FormulaVariable(symbol: "I", name: "Stromstärke I", defaultUnit: "A", unitCategory: .electricCurrent)
            ]
        ))

        list.append(FormulaItem(
            id: "elec_res_wire",
            name: "Spezifischer Leiterwiderstand",
            category: "Elektrotechnik",
            subcategory: "Gleichstrom & Netzwerke",
            rawEquation: "R = rho * l / A",
            latex: #"R = \\rho \\cdot \\frac{l}{A}"#,
            description: "Ohmscher Gesamtwiderstand eines elektrischen Leiters aus Länge l, Querschnittsfläche A und Materialresistivität rho.",
            variables: [
                FormulaVariable(symbol: "R", name: "Widerstand R", defaultUnit: "Ω", unitCategory: .electricResistance),
                FormulaVariable(symbol: "rho", name: "Spezifischer Widerstand rho", defaultUnit: "Ω·m", unitCategory: .dimensionless),
                FormulaVariable(symbol: "l", name: "Leiterlänge l", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "A", name: "Querschnittsfläche A", defaultUnit: "m²", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "elec_ac_xc",
            name: "Kapazitiver Blindwiderstand (Kondensator)",
            category: "Elektrotechnik",
            subcategory: "Wechselstrom & Blindwiderstände",
            rawEquation: "Xc = 1 / (2 * 3.1415926535 * f * C)",
            latex: #"X_C = \\frac{1}{2 \\pi \\cdot f \\cdot C}"#,
            description: "Frequenzabhängiger Wechselstromwiderstand eines idealen Kondensators mit Kapazität C.",
            variables: [
                FormulaVariable(symbol: "Xc", name: "Blindwiderstand Xc", defaultUnit: "Ω", unitCategory: .electricResistance),
                FormulaVariable(symbol: "f", name: "Wechselstromfrequenz f", defaultUnit: "Hz", unitCategory: .dimensionless),
                FormulaVariable(symbol: "C", name: "Kapazität C", defaultUnit: "F", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "elec_ac_xl",
            name: "Induktiver Blindwiderstand (Spule)",
            category: "Elektrotechnik",
            subcategory: "Wechselstrom & Blindwiderstände",
            rawEquation: "Xl = 2 * 3.1415926535 * f * L",
            latex: #"X_L = 2 \\pi \\cdot f \\cdot L"#,
            description: "Frequenzabhängiger Wechselstromwiderstand einer Spule mit Induktivität L.",
            variables: [
                FormulaVariable(symbol: "Xl", name: "Blindwiderstand Xl", defaultUnit: "Ω", unitCategory: .electricResistance),
                FormulaVariable(symbol: "f", name: "Frequenz f", defaultUnit: "Hz", unitCategory: .dimensionless),
                FormulaVariable(symbol: "L", name: "Induktivität L", defaultUnit: "H", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "elec_ac_thomson",
            name: "Thomsonsche Schwingungsgleichung (Resonanz)",
            category: "Elektrotechnik",
            subcategory: "Wechselstrom & Blindwiderstände",
            rawEquation: "f = 1 / (2 * 3.1415926535 * sqrt(L * C))",
            latex: #"f_0 = \\frac{1}{2 \\pi \\cdot \\sqrt{L \\cdot C}}"#,
            description: "Eigenresonanzfrequenz eines ungedämpften LC-Schwingkreises aus Induktivität L und Kapazität C.",
            variables: [
                FormulaVariable(symbol: "f", name: "Resonanzfrequenz f0", defaultUnit: "Hz", unitCategory: .dimensionless),
                FormulaVariable(symbol: "L", name: "Induktivität L", defaultUnit: "H", unitCategory: .dimensionless),
                FormulaVariable(symbol: "C", name: "Kapazität C", defaultUnit: "F", unitCategory: .dimensionless)
            ]
        ))

        // ==========================================
        // 7. MASCHINENBAU & STATIK
        // ==========================================

        list.append(FormulaItem(
            id: "eng_mech_hooke",
            name: "Hookesches Spannungsgesetz (Elastizität)",
            category: "Maschinenbau & Statik",
            subcategory: "Festigkeitslehre & Elastizität",
            rawEquation: "sigma = E * eps",
            latex: #"\\sigma = E \\cdot \\varepsilon"#,
            description: "Linear-elastische Beziehung im Werkstoff zwischen mechanischer Normalspannung sigma, Elastizitätsmodul E und Dehnung eps.",
            variables: [
                FormulaVariable(symbol: "sigma", name: "Normalspannung sigma", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "E", name: "Elastizitätsmodul E", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "eps", name: "Elastische Dehnung epsilon", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "eng_mech_stress",
            name: "Mechanische Spannung (Kraft auf Querschnitt)",
            category: "Maschinenbau & Statik",
            subcategory: "Festigkeitslehre & Elastizität",
            rawEquation: "sigma = F / A",
            latex: #"\\sigma = \\frac{F}{A}"#,
            description: "Zug- oder Druckspannung in einem prismatischen Bauteil unter Belastungskraft F auf Querschnittsfläche A.",
            variables: [
                FormulaVariable(symbol: "sigma", name: "Spannung sigma", defaultUnit: "Pa", unitCategory: .pressure),
                FormulaVariable(symbol: "F", name: "Zug-/Druckkraft F", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "A", name: "Querschnittsfläche A", defaultUnit: "m²", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "eng_mech_torque",
            name: "Drehmoment & Hebelgesetz",
            category: "Maschinenbau & Statik",
            subcategory: "Statik & Antriebe",
            rawEquation: "M = F * r",
            latex: #"M = F \\cdot r"#,
            description: "Drehmoment M einer tangential angreifenden Kraft F am Hebelarm r um den Drehpunkt.",
            variables: [
                FormulaVariable(symbol: "M", name: "Drehmoment M", defaultUnit: "N·m", unitCategory: .dimensionless),
                FormulaVariable(symbol: "F", name: "Hebelkraft F", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "r", name: "Hebelarm r", defaultUnit: "m", unitCategory: .length)
            ]
        ))

        list.append(FormulaItem(
            id: "eng_archimedes_buoyancy",
            name: "Statischer Auftrieb (Archimedes)",
            category: "Maschinenbau & Statik",
            subcategory: "Strömungsmechanik",
            rawEquation: "FA = rho * V * g",
            latex: #"F_A = \\rho \\cdot V \\cdot g"#,
            description: "Hydrostatischer Auftrieb eines eingetauchten Körpers gleich dem Gewicht des verdrängten Fluidvolumens.",
            variables: [
                FormulaVariable(symbol: "FA", name: "Auftriebskraft FA", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "rho", name: "Fluiddichte rho", defaultUnit: "kg/m³", unitCategory: .dimensionless),
                FormulaVariable(symbol: "V", name: "Verdrängtes Volumen V", defaultUnit: "m³", unitCategory: .dimensionless),
                FormulaVariable(symbol: "g", name: "Erdbeschleunigung g", defaultUnit: "m/s²", unitCategory: .acceleration)
            ]
        ))

        list.append(FormulaItem(
            id: "eng_fluid_reynolds",
            name: "Reynolds-Zahl (Strömungscharakteristik)",
            category: "Maschinenbau & Statik",
            subcategory: "Strömungsmechanik",
            rawEquation: "Re = (rho * v * d) / eta",
            latex: #"Re = \\frac{\\rho \\cdot v \\cdot d}{\\eta}"#,
            description: "Dimensionslose Kennzahl zur Vorhersage von laminarer oder turbulenter Rohrströmung.",
            variables: [
                FormulaVariable(symbol: "Re", name: "Reynolds-Zahl Re", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "rho", name: "Fluiddichte rho", defaultUnit: "kg/m³", unitCategory: .dimensionless),
                FormulaVariable(symbol: "v", name: "Strömungsgeschwindigkeit v", defaultUnit: "m/s", unitCategory: .velocity),
                FormulaVariable(symbol: "d", name: "Rohrdurchmesser d", defaultUnit: "m", unitCategory: .length),
                FormulaVariable(symbol: "eta", name: "Dynamische Viskosität eta", defaultUnit: "Pa·s", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "eng_fluid_drag",
            name: "Aerodynamischer Strömungswiderstand",
            category: "Maschinenbau & Statik",
            subcategory: "Strömungsmechanik",
            rawEquation: "Fw = 0.5 * cw * rho * A * v^2",
            latex: #"F_W = \\frac{1}{2} c_w \\cdot \\rho \\cdot A \\cdot v^2"#,
            description: "Strömungswiderstandskraft eines umströmten Körpers mit Luftwiderstandsbeiwert cw und Stirnfläche A.",
            variables: [
                FormulaVariable(symbol: "Fw", name: "Widerstandskraft Fw", defaultUnit: "N", unitCategory: .force),
                FormulaVariable(symbol: "cw", name: "Widerstandsbeiwert cw", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "rho", name: "Mediendichte rho", defaultUnit: "kg/m³", unitCategory: .dimensionless),
                FormulaVariable(symbol: "A", name: "Stirnfläche A", defaultUnit: "m²", unitCategory: .dimensionless),
                FormulaVariable(symbol: "v", name: "Anströmgeschwindigkeit v", defaultUnit: "m/s", unitCategory: .velocity)
            ]
        ))

        // ==========================================
        // 8. INFORMATIK & INFORMATION
        // ==========================================

        list.append(FormulaItem(
            id: "cs_amdahl",
            name: "Amdahlsches Gesetz (Parallelisierung)",
            category: "Informatik & Information",
            subcategory: "Systemleistung & Skalierung",
            rawEquation: "S = 1 / ((1 - p) + (p / s))",
            latex: #"S = \\frac{1}{(1 - p) + \\frac{p}{s}}"#,
            description: "Maximal erreichbarer theoretischer Geschwindigkeitszuwachs (Speedup) eines Programms durch parallele Prozessoren s bei parallelem Anteil p.",
            variables: [
                FormulaVariable(symbol: "S", name: "Beschleunigungsfaktor S (Speedup)", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "p", name: "Paralleler Codeanteil p (0..1)", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "s", name: "Prozessoranzahl s", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "cs_gustafson",
            name: "Gustafsonsches Skalierungsgesetz",
            category: "Informatik & Information",
            subcategory: "Systemleistung & Skalierung",
            rawEquation: "S = 1 - p + s * p",
            latex: #"S(s) = 1 - p + s \\cdot p"#,
            description: "Skalierter Speedup für massiv-parallele Supercomputer bei wachsender Problemgröße mit s Prozessoren.",
            variables: [
                FormulaVariable(symbol: "S", name: "Skalierter Speedup S", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "p", name: "Paralleler Codeanteil p (0..1)", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "s", name: "Rechenknoten / Prozessoren s", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "cs_shannon",
            name: "Shannon-Hartley-Kanalübertragungskapazität",
            category: "Informatik & Information",
            subcategory: "Informationstheorie & Codierung",
            rawEquation: "C = B * (ln(1 + SNR) / 0.69314718056)",
            latex: #"C = B \\cdot \\log_2(1 + \\text{SNR})"#,
            description: "Theoretische Obergrenze der fehlerfreien Datenübertragungsrate eines verrauschten Analogkanals der Bandbreite B.",
            variables: [
                FormulaVariable(symbol: "C", name: "Kanalkapazität C", defaultUnit: "bit/s", unitCategory: .dimensionless),
                FormulaVariable(symbol: "B", name: "Bandbreite B", defaultUnit: "Hz", unitCategory: .dimensionless),
                FormulaVariable(symbol: "SNR", name: "Signal-Rausch-Verhältnis SNR (linear)", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "cs_nyquist",
            name: "Nyquist-Shannon-Abtasttheorem",
            category: "Informatik & Information",
            subcategory: "Informationstheorie & Codierung",
            rawEquation: "fs = 2 * fmax",
            latex: #"f_s \\ge 2 \\cdot f_{max}"#,
            description: "Minimale fehlerfreie Abtastfrequenz zur perfekten Rekonstruktion eines bandbegrenzten Signals ohne Aliasing.",
            variables: [
                FormulaVariable(symbol: "fs", name: "Mindest-Abtastrate fs", defaultUnit: "Hz", unitCategory: .dimensionless),
                FormulaVariable(symbol: "fmax", name: "Maximale Grenzfrequenz fmax", defaultUnit: "Hz", unitCategory: .dimensionless)
            ]
        ))

        // ==========================================
        // 9. FINANZMATHEMATIK & WIRTSCHAFT
        // ==========================================

        list.append(FormulaItem(
            id: "fin_compound_interest",
            name: "Zinseszinsrechnung (Endkapital)",
            category: "Finanzmathematik",
            subcategory: "Zins & Zinseszins",
            rawEquation: "Kn = K0 * (1 + p / 100)^n",
            latex: #"K_n = K_0 \\cdot \\left(1 + \\frac{p}{100}\\right)^n"#,
            description: "Berechnung des Endkapitals Kn aus Anfangskapital K0 bei jährlicher Zinsgutschrift über n Jahre.",
            variables: [
                FormulaVariable(symbol: "Kn", name: "Endkapital Kn", defaultUnit: "€", unitCategory: .dimensionless),
                FormulaVariable(symbol: "K0", name: "Anfangskapital K0", defaultUnit: "€", unitCategory: .dimensionless),
                FormulaVariable(symbol: "p", name: "Zinssatz p in %", defaultUnit: "%", unitCategory: .dimensionless),
                FormulaVariable(symbol: "n", name: "Laufzeit n (Jahre)", defaultUnit: "a", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "fin_continuous_interest",
            name: "Kontinuierliche Verzinsung (Exponentiell)",
            category: "Finanzmathematik",
            subcategory: "Zins & Zinseszins",
            rawEquation: "Kt = K0 * 2.7182818284^(r * t)",
            latex: #"K(t) = K_0 \\cdot e^{r \\cdot t}"#,
            description: "Kapitalwachstum bei stetiger kontinuierlicher Verzinsung mit Zinsrate r über die Zeit t.",
            variables: [
                FormulaVariable(symbol: "Kt", name: "Kapital nach Zeit t", defaultUnit: "€", unitCategory: .dimensionless),
                FormulaVariable(symbol: "K0", name: "Startkapital K0", defaultUnit: "€", unitCategory: .dimensionless),
                FormulaVariable(symbol: "r", name: "Stetige Zinsrate r (z. B. 0.05)", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "t", name: "Anlagezeit t", defaultUnit: "a", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "fin_present_value",
            name: "Barwert / Diskontierung (Present Value)",
            category: "Finanzmathematik",
            subcategory: "Investitionsrechnung & Barwert",
            rawEquation: "PV = FV / (1 + i)^n",
            latex: #"PV = \\frac{FV}{(1 + i)^n}"#,
            description: "Gegenwartswert einer zukünftigen Zahlungsleistung FV bei Diskontierungszinssatz i über n Perioden.",
            variables: [
                FormulaVariable(symbol: "PV", name: "Barwert (Present Value)", defaultUnit: "€", unitCategory: .dimensionless),
                FormulaVariable(symbol: "FV", name: "Zukunftswert (Future Value)", defaultUnit: "€", unitCategory: .dimensionless),
                FormulaVariable(symbol: "i", name: "Diskontierungszins i (dezimal)", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "n", name: "Periodenanzahl n", defaultUnit: "1", unitCategory: .dimensionless)
            ]
        ))

        list.append(FormulaItem(
            id: "fin_annuity_rate",
            name: "Annuitäten-Kreditrate (Tilgungsrechnung)",
            category: "Finanzmathematik",
            subcategory: "Investitionsrechnung & Barwert",
            rawEquation: "A = S0 * ((1 + i)^n * i) / ((1 + i)^n - 1)",
            latex: #"A = S_0 \\cdot \\frac{q^n \\cdot (q - 1)}{q^n - 1} \\quad (q = 1 + i)"#,
            description: "Regelmäßige konstante Annuitätenrate zur vollständigen Tilgung eines Darlehens S0 über n Jahre.",
            variables: [
                FormulaVariable(symbol: "A", name: "Jährliche Annuität A", defaultUnit: "€", unitCategory: .dimensionless),
                FormulaVariable(symbol: "S0", name: "Darlehensbetrag S0", defaultUnit: "€", unitCategory: .dimensionless),
                FormulaVariable(symbol: "i", name: "Zinssatz i (z. B. 0.04)", defaultUnit: "1", unitCategory: .dimensionless),
                FormulaVariable(symbol: "n", name: "Laufzeit n Jahre", defaultUnit: "a", unitCategory: .dimensionless)
            ]
        ))

        self.formulas = list
    }

    public func find(id: String) -> FormulaItem? {
        formulas.first(where: { $0.id == id })
    }

    public func formulas(forCategory category: String) -> [FormulaItem] {
        formulas.filter { $0.category == category }
    }

    public func formulas(forSubcategory subcategory: String) -> [FormulaItem] {
        formulas.filter { $0.subcategory == subcategory }
    }

    public func search(query: String) -> [FormulaItem] {
        let q = query.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !q.isEmpty else { return formulas }

        return formulas.filter { item in
            item.name.lowercased().contains(q) ||
            item.category.lowercased().contains(q) ||
            item.subcategory.lowercased().contains(q) ||
            item.description.lowercased().contains(q) ||
            item.rawEquation.lowercased().contains(q) ||
            item.variables.contains { $0.name.lowercased().contains(q) || $0.symbol.lowercased().contains(q) }
        }
    }
}
'''

with open('Sources/FormulaExMachinaKit/FormulaCatalog.swift', 'w') as f:
    f.write(catalog_code)

print("FormulaCatalog.swift with worldwide university faculties generated.")
