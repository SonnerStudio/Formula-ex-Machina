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

            CommandMenu(model.localized(.calculation)) {
                Button(model.localized(.recalculate)) {
                    model.recalculate()
                }
                .keyboardShortcut("r", modifiers: [.command])

                Button(model.localized(.copyResult)) {
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
