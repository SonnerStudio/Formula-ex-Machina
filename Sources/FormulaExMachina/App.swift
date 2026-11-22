import SwiftUI
import FormulaEngine
import FormulaExMachinaKit

@main
struct FormulaExMachinaApp: App {
    @State private var model = AppModel()

    var body: some Scene {
        Window("Formula ex Machina", id: "main") {
            MainSplitView(model: model)
                .noInitialFocus()
                .tint(Palette.accent)
        }
        .commands {
            SidebarCommands()

            CommandMenu("Berechnung") {
                Button("Neu berechnen") {
                    model.recalculate()
                }
                .keyboardShortcut("r", modifiers: [.command])

                Button("Ergebnis kopieren") {
                    model.copyResultToClipboard()
                }
                .keyboardShortcut("c", modifiers: [.command, .shift])
            }
        }

        Settings {
            SettingsView()
                .tint(Palette.accent)
        }
    }
}
