

import SwiftUI
import SwiftData


@main
struct MagicTarotApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: SavedReading.self)
    }
}
