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
        .frame(minWidth: 960, minHeight: 640)
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
            Section("Fachgebiete") {
                ForEach(model.catalog.categories) { category in
                    DisclosureGroup {
                        ForEach(category.subcategories, id: \.self) { sub in
                            Text(sub)
                                .tag(sub)
                        }
                    } label: {
                        Label(category.name, systemImage: category.iconName)
                            .font(.headline)
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
                TextField("Formeln, Symbole, Einheiten suchen...", text: $model.searchQuery)
                    .textFieldStyle(.plain)
                if !model.searchQuery.isEmpty {
                    Button {
                        model.searchQuery = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.secondary)
                    }
                    .buttonStyle(.plain)
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
                }
            }
            .listStyle(.inset)
        }
        .navigationTitle(model.selectedSubcategory ?? "Formeln")
    }
}
