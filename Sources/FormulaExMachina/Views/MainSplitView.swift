import SwiftUI
import FormulaEngine
import FormulaExMachinaKit

public struct MainSplitView: View {
    @Bindable var model: AppModel

    public init(model: AppModel) {
        self.model = model
    }

    public var body: some View {
        NavigationSplitView {
            sidebarView
        } content: {
            formulaListView
        } detail: {
            FormulaDetailView(model: model)
        }
        .navigationSplitViewStyle(.balanced)
        .frame(minWidth: 1040, minHeight: 680)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                HStack(spacing: Space.sm) {
                    // SonnerStudio Branding Badge
                    HStack(spacing: 6) {
                        Image(systemName: "atom")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(Palette.accent)

                        Text("SONNERSTUDIO")
                            .font(.system(size: 11, weight: .black, design: .rounded))
                            .tracking(1.2)
                            .foregroundStyle(.primary)

                        Text("PRO")
                            .font(.system(size: 9, weight: .heavy))
                            .padding(.horizontal, 5)
                            .padding(.vertical, 2)
                            .background(
                                Capsule()
                                    .fill(Palette.accent)
                            )
                            .foregroundStyle(Palette.onAccent)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .fill(Color.primary.opacity(0.04))
                            .overlay(
                                Capsule()
                                    .stroke(Palette.accent.opacity(0.2), lineWidth: 1)
                            )
                    )
                    .help("SonnerStudio Formula ex Machina – Universalwissenschaftliches Formelsystem")
                }
            }

            ToolbarItemGroup(placement: .automatic) {
                // Sprachauswahl-Dropdownmenü mit 130 Weltsprachen & Nationalflaggen
                HStack(spacing: 6) {
                    Text(model.currentLanguage.flag)
                        .font(.system(size: 18))
                        .help("Aktuelle Nationalflagge: \(model.currentLanguage.name)")

                    Picker("", selection: Binding(
                        get: { model.selectedLanguageCode },
                        set: { model.selectedLanguageCode = $0 }
                    )) {
                        ForEach(model.languages.languages) { lang in
                            Text("\(lang.flag)  \(lang.name) (\(lang.nativeName))")
                                .tag(lang.code)
                        }
                    }
                    .pickerStyle(.menu)
                    .frame(minWidth: 190)
                    .help("Sprachauswahl: Wählen Sie aus den 130 meistgesprochenen Sprachen der Erde mit Flaggen")
                }
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(nsColor: .controlBackgroundColor))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
                        )
                )

                // Update-Button (SternenMeister / Zeitmeister Methode)
                Button {
                    model.checkForUpdates()
                } label: {
                    HStack(spacing: 4) {
                        if model.isUpdating {
                            ProgressView()
                                .controlSize(.small)
                        } else {
                            Image(systemName: "arrow.triangle.2.circlepath")
                        }
                        if let status = model.updateStatusText {
                            Text(status)
                                .font(.caption2)
                        } else {
                            Text(model.localized(.update))
                                .font(.caption)
                        }
                    }
                }
                .disabled(model.isUpdating)
                .help("SonnerStudio Update-Manager: Synchronisiert mit GitHub und lokalem Git-Zentralarchiv")
            }
        }
    }

    // MARK: - Sidebar

    @ViewBuilder
    private var sidebarView: some View {
        List(selection: Binding(
            get: { model.selectedSubcategory },
            set: { sub in
                model.selectedSubcategory = sub
                if let sub = sub {
                    // Passende Hauptkategorie ermitteln
                    if let cat = model.catalog.categories.first(where: { $0.subcategories.contains(sub) }) {
                        model.selectedCategory = cat.name
                    }
                }
            }
        )) {
            Section(model.localized(.disciplines)) {
                ForEach(model.catalog.categories) { category in
                    DisclosureGroup {
                        ForEach(category.subcategories, id: \.self) { sub in
                            Text(sub)
                                .tag(sub)
                                .help("Thema '\(sub)' in \(model.localizedCategory(category.name)) anzeigen")
                        }
                    } label: {
                        Label(model.localizedCategory(category.name), systemImage: category.iconName)
                            .font(.headline)
                            .help("Fachbereich: \(model.localizedCategory(category.name)) (\(category.subcategories.count) Unterthemen)")
                    }
                }
            }
        }
        .listStyle(.sidebar)
        .navigationTitle("Formula ex Machina")
    }

    // MARK: - Formula List

    @ViewBuilder
    private var formulaListView: some View {
        VStack(spacing: 0) {
            // Suchfeld
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.secondary)
                TextField(model.localized(.searchPlaceholder), text: $model.searchQuery)
                    .textFieldStyle(.plain)
                    .help("Formelsuche: Suche nach Namen, Variablen (z. B. 'F', 'v', 'Ohm'), Formeln oder Einheiten")
                if !model.searchQuery.isEmpty {
                    Button {
                        model.searchQuery = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.secondary)
                    }
                    .buttonStyle(.plain)
                    .help("Suchbegriff zurücksetzen")
                }
            }
            .padding(Space.sm)
            .background(Color(nsColor: .controlBackgroundColor))
            .cornerRadius(8)
            .padding([.horizontal, .top], Space.sm)

            // Liste der gefilterten Formeln
            List(selection: Binding(
                get: { model.selectedFormulaID },
                set: { id in
                    if let id = id {
                        model.selectFormula(id: id)
                    }
                }
            )) {
                ForEach(model.filteredFormulas) { item in
                    VStack(alignment: .leading, spacing: 2) {
                        HStack {
                            Text(item.name)
                                .font(.headline)
                                .foregroundStyle(.primary)
                            Spacer()
                            Text(item.subcategory)
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                        }

                        Text(item.latex)
                            .font(.system(size: 13, weight: .medium, design: .serif))
                            .foregroundStyle(Palette.accent)

                        Text(item.description)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                    }
                    .padding(.vertical, 2)
                    .tag(item.id)
                    .help("Formel '\(item.name)' (\(item.rawEquation)) in der Maske öffnen")
                }
            }
            .listStyle(.inset)
        }
        .navigationTitle(model.selectedSubcategory ?? "Formeln")
    }
}
