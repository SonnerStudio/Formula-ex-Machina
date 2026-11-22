import SwiftUI
import FormulaEngine
import FormulaExMachinaKit

public struct FormulaDetailView: View {
    @Bindable var model: AppModel

    public init(model: AppModel) {
        self.model = model
    }

    public var body: some View {
        if let formula = model.selectedFormula {
            ScrollView {
                VStack(alignment: .leading, spacing: Space.xl) {
                    // 1. Header & Titel
                    headerView(formula: formula)

                    // 2. Mathematische Formelanzeige
                    formulaDisplayCard(formula: formula)

                    // 3. Umstell-Steuerung (Zielvariable wählen)
                    rearrangeControlCard(formula: formula)

                    // 4. Eingabefelder für bekannte Variablen
                    inputFieldsSection(formula: formula)

                    // 5. Großes Ergebnisfeld
                    resultSection(formula: formula)

                    // 6. Schritt-für-Schritt Umformungsweg
                    if let steps = model.currentOutput?.steps, steps.count > 1 {
                        stepsSection(steps: steps)
                    }

                    // 7. SonnerStudio Branding & System-Status Footer
                    sonnerStudioFooterView
                }
                .padding(Space.xl)
            }
            .background(Color(nsColor: .windowBackgroundColor))
        } else {
            ContentUnavailableView(
                model.localized(.noFormulaSelected),
                systemImage: "function",
                description: Text(model.localized(.noFormulaSelectedDesc))
            )
        }
    }

    // MARK: - Subviews

    @ViewBuilder
    private func headerView(formula: FormulaItem) -> some View {
        VStack(alignment: .leading, spacing: Space.xs) {
            HStack(spacing: Space.sm) {
                Text(formula.category.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)

                Image(systemName: "chevron.right")
                    .font(.caption2)
                    .foregroundStyle(.tertiary)

                Text(formula.subcategory)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Text(formula.name)
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .foregroundStyle(.primary)

            Text(formula.description)
                .font(.body)
                .foregroundStyle(.secondary)
                .lineLimit(3)
        }
    }

    @ViewBuilder
    private func formulaDisplayCard(formula: FormulaItem) -> some View {
        VStack(alignment: .center, spacing: Space.sm) {
            Text(formula.latex)
                .font(.system(size: 28, weight: .medium, design: .serif))
                .padding(.vertical, Space.lg)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(nsColor: .controlBackgroundColor))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.primary.opacity(0.08), lineWidth: 1)
                        )
                )
                .help("Mathematische Formel in Standarddarstellung: \(formula.rawEquation)")
        }
    }

    @ViewBuilder
    private func rearrangeControlCard(formula: FormulaItem) -> some View {
        VStack(alignment: .leading, spacing: Space.sm) {
            HStack {
                Label(model.localized(.rearrangeFor), systemImage: "arrow.triangle.swap")
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .help("Formelumstellung: Wähle die gesuchte Unbekannte, nach der die Formel symbolisch aufgelöst werden soll")

                Spacer()

                Picker("", selection: Binding(
                    get: { model.targetVariable },
                    set: { model.setTargetVariable($0) }
                )) {
                    ForEach(formula.variables) { v in
                        Text("\(v.symbol) – \(v.name)").tag(v.symbol)
                    }
                }
                .pickerStyle(.menu)
                .frame(minWidth: 180)
                .help("Zielvariable auswählen, nach der die Gleichung freigestellt wird")
            }

            if let out = model.currentOutput {
                HStack(spacing: Space.sm) {
                    Text(model.localized(.rearrangedFormula))
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                    Text(out.isolatedFormulaLaTeX)
                        .font(.system(size: 16, weight: .semibold, design: .serif))
                        .foregroundStyle(Palette.accent)
                }
                .padding(.top, Space.xs)
                .help("Symbolisch isolierte Gleichung: \(out.isolatedFormulaLaTeX)")
            }
        }
        .padding(Space.md)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.accentColor.opacity(0.06))
        )
    }

    @ViewBuilder
    private func inputFieldsSection(formula: FormulaItem) -> some View {
        VStack(alignment: .leading, spacing: Space.md) {
            Text(model.localized(.inputValues))
                .font(.headline)
                .foregroundStyle(.primary)

            let inputVars = formula.variables.filter { $0.symbol != model.targetVariable }

            ForEach(inputVars) { variable in
                variableRow(variable: variable)
            }
        }
    }

    @ViewBuilder
    private func variableRow(variable: FormulaVariable) -> some View {
        HStack(spacing: Space.md) {
            // Symbol-Badge
            Text(variable.symbol)
                .font(.system(size: 15, weight: .bold, design: .serif))
                .frame(width: 34, height: 34)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .fill(Color.primary.opacity(0.06))
                )
                .help("Variablensymbol: \(variable.symbol)")

            // Variablenname
            VStack(alignment: .leading, spacing: 2) {
                Text(variable.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                Text(variable.unitCategory.rawValue)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            .frame(width: 140, alignment: .leading)
            .help("\(variable.name) – Physikalische Kategorie: \(variable.unitCategory.rawValue)")

            // Eingabefeld
            TextField(
                model.localized(.enterValue),
                text: Binding(
                    get: { model.inputValues[variable.symbol] ?? "" },
                    set: { model.setInputValue($0, for: variable.symbol) }
                )
            )
            .textFieldStyle(.roundedBorder)
            .font(.system(size: 15, design: .monospaced))
            .frame(maxWidth: .infinity)
            .help("Eingabewert für \(variable.name) (\(variable.symbol)). Berechnung erfolgt live.")

            // Einheiten-Auswahlmenü
            let compatibleUnits = model.converter.units(for: variable.unitCategory)
            if !compatibleUnits.isEmpty {
                Picker("", selection: Binding(
                    get: { model.inputUnits[variable.symbol] ?? variable.defaultUnit },
                    set: { model.setInputUnit($0, for: variable.symbol) }
                )) {
                    ForEach(compatibleUnits) { u in
                        Text(u.symbol).tag(u.symbol)
                    }
                }
                .pickerStyle(.menu)
                .frame(width: 90)
                .help("Maßeinheit für \(variable.name) auswählen (wird automatisch in SI-Basiseinheiten umgerechnet)")
            }
        }
        .padding(Space.sm)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(nsColor: .controlBackgroundColor))
        )
    }

    @ViewBuilder
    private func resultSection(formula: FormulaItem) -> some View {
        VStack(alignment: .leading, spacing: Space.sm) {
            Text(model.localized(.calculatedResult))
                .font(.headline)
                .foregroundStyle(.primary)

            if let out = model.currentOutput {
                HStack(spacing: Space.lg) {
                    // Symbol Badge
                    Text(out.targetVariable)
                        .font(.system(size: 22, weight: .bold, design: .serif))
                        .foregroundStyle(Palette.onAccent)
                        .frame(width: 48, height: 48)
                        .background(
                            Circle()
                                .fill(Palette.accent)
                        )
                        .help("Freigestellte Zielvariable: \(out.targetVariable)")

                    VStack(alignment: .leading, spacing: 2) {
                        let varName = formula.variables.first { $0.symbol == out.targetVariable }?.name ?? ""
                        Text(varName)
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        Text(formattedValue(out.resultValue))
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundStyle(.primary)
                    }
                    .help("Berechneter Zahlenwert für \(out.targetVariable)")

                    Spacer()

                    // Zieleinheiten-Auswahl
                    if let targetVar = formula.variables.first(where: { $0.symbol == out.targetVariable }) {
                        let targetUnits = model.converter.units(for: targetVar.unitCategory)
                        Picker(model.localized(.unit), selection: Binding(
                            get: { model.targetUnit },
                            set: { model.setTargetUnit($0) }
                        )) {
                            ForEach(targetUnits) { u in
                                Text("\(u.symbol) (\(u.name))").tag(u.symbol)
                            }
                        }
                        .pickerStyle(.menu)
                        .frame(width: 140)
                        .help("Zieleinheit für das Ergebnis auswählen (z. B. \(targetVar.defaultUnit))")
                    }

                    // Kopieren-Button
                    Button {
                        model.copyResultToClipboard()
                    } label: {
                        HStack(spacing: Space.xs) {
                            Image(systemName: model.copiedFeedback ? "checkmark" : "doc.on.doc")
                            Text(model.copiedFeedback ? model.localized(.copied) : model.localized(.copy))
                        }
                        .padding(.horizontal, Space.sm)
                        .padding(.vertical, Space.xs)
                    }
                    .buttonStyle(.borderedProminent)
                    .help("Formelergebnis samt Einheit in die macOS-Zwischenablage kopieren (Kurzbefehl: ⇧⌘C)")
                }
                .padding(Space.lg)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(nsColor: .controlBackgroundColor))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Palette.accent.opacity(0.3), lineWidth: 1.5)
                        )
                )
            } else if let error = model.errorMessage {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundStyle(.orange)
                    Text(error)
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
                .padding(Space.md)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.orange.opacity(0.1))
                )
                .help("Hinweis zu fehlenden oder fehlerhaften Eingabewerten")
            }
        }
    }

    @ViewBuilder
    private func stepsSection(steps: [TransformationStep]) -> some View {
        DisclosureGroup("\(model.localized(.solutionSteps)) (\(steps.count) \(model.localized(.step))s)") {
            VStack(alignment: .leading, spacing: Space.md) {
                ForEach(steps, id: \.stepNumber) { step in
                    HStack(alignment: .top, spacing: Space.md) {
                        Text("\(step.stepNumber).")
                            .font(.system(size: 14, weight: .bold, design: .monospaced))
                            .foregroundStyle(.secondary)
                            .frame(width: 24, alignment: .trailing)
                            .help("\(model.localized(.step)) \(step.stepNumber)")

                        VStack(alignment: .leading, spacing: 2) {
                            Text(step.explanation)
                                .font(.subheadline)
                                .foregroundStyle(.primary)

                            Text(step.equation.toLaTeX)
                                .font(.system(size: 15, weight: .medium, design: .serif))
                                .foregroundStyle(Palette.accent)
                        }
                        .help("Äquivalenzumformung: \(step.explanation)")
                    }
                    .padding(.vertical, 2)
                    Divider()
                }
            }
            .padding(.top, Space.sm)
        }
        .padding(Space.md)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.primary.opacity(0.03))
        )
        .help("Klappt den vollständigen didaktischen Umformungsweg der Gleichung auf")
    }

    @ViewBuilder
    private var sonnerStudioFooterView: some View {
        HStack(spacing: Space.md) {
            Image(systemName: "atom")
                .font(.system(size: 20))
                .foregroundStyle(Palette.accent)

            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: Space.xs) {
                    Text("SONNERSTUDIO FORMULA EX MACHINA")
                        .font(.system(size: 11, weight: .black, design: .rounded))
                        .tracking(1.0)
                        .foregroundStyle(.primary)

                    Text("UNIVERSAL SCIENCE EDITION")
                        .font(.system(size: 9, weight: .bold))
                        .padding(.horizontal, 4)
                        .padding(.vertical, 1.5)
                        .background(Palette.accent.opacity(0.15))
                        .foregroundStyle(Palette.accent)
                        .cornerRadius(3)
                }

                Text("Entwickelt von SonnerStudio • Jan Friske • 100% Offline • Lokale symbolische Algebra • 130 Sprachen")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            HStack(spacing: Space.sm) {
                Label("Offline", systemImage: "bolt.horizontal.circle.fill")
                    .font(.caption2)
                    .foregroundStyle(.green)

                Label("Liquid Glass", systemImage: "sparkles")
                    .font(.caption2)
                    .foregroundStyle(Palette.accent)
            }
        }
        .padding(Space.md)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.primary.opacity(0.02))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary.opacity(0.06), lineWidth: 1)
                )
        )
        .padding(.top, Space.lg)
    }

    private func formattedValue(_ val: Double) -> String {
        if abs(val) >= 1e7 || (abs(val) > 0 && abs(val) < 1e-4) {
            return String(format: "%.6e", val)
        } else if val.truncatingRemainder(dividingBy: 1) == 0 {
            return String(Int(val))
        } else {
            return String(format: "%.4f", val)
        }
    }
}
