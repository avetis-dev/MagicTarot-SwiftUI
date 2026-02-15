import SwiftUI

enum SpreadCategory: String, CaseIterable {
    case love = "Miłość"
    case personality = "Osobowość"
    case career = "Kariera"
    
    var emoji: String {
        switch self {
        case .love:        return "❤️"
        case .personality: return "👤"
        case .career:      return "💼"
        }
    }
    
    var color: Color {
        switch self {
        case .love:        return .pink
        case .personality: return .purple
        case .career:      return .orange
        }
    }
}

struct SpreadType: Identifiable {
    let id = UUID()
    let emoji: String
    let name: String
    let subtitle: String
    let gradientColors: [Color]
    let category: SpreadCategory
    let isAvailable: Bool
}

// Все расклады
let allSpreads: [SpreadType] = [
    // Любовь
    SpreadType(
        emoji: "💕",
        name: "Rozkład Miłosny",
        subtitle: "Co czuje do Ciebie ta osoba?",
        gradientColors: [.pink, .red],
        category: .love,
        isAvailable: true
    ),
    SpreadType(
        emoji: "💘",
        name: "Związek",
        subtitle: "Przeszłość i przyszłość Waszej relacji",
        gradientColors: [.pink, .purple],
        category: .love,
        isAvailable: false
    ),
    SpreadType(
        emoji: "🥀",
        name: "Rozstanie",
        subtitle: "Czy warto walczyć o tę relację?",
        gradientColors: [.red, .orange],
        category: .love,
        isAvailable: false
    ),
    
    // Личность
    SpreadType(
        emoji: "🔮",
        name: "Trzy Karty",
        subtitle: "Przeszłość • Teraźniejszość • Przyszłość",
        gradientColors: [.blue, .cyan],
        category: .personality,
        isAvailable: true
    ),
    SpreadType(
        emoji: "🌙",
        name: "Tak / Nie",
        subtitle: "Proste pytanie — prosta odpowiedź",
        gradientColors: [.indigo, .blue],
        category: .personality,
        isAvailable: false
    ),
    SpreadType(
        emoji: "🪞",
        name: "Kim jestem?",
        subtitle: "Odkryj swoją prawdziwą naturę",
        gradientColors: [.purple, .indigo],
        category: .personality,
        isAvailable: false
    ),
    
    // Карьера
    SpreadType(
        emoji: "🚀",
        name: "Kariera",
        subtitle: "Co czeka Cię w pracy?",
        gradientColors: [.orange, .yellow],
        category: .career,
        isAvailable: true
    ),
    SpreadType(
        emoji: "💰",
        name: "Finanse",
        subtitle: "Jak poprawić swoją sytuację finansową?",
        gradientColors: [.green, .mint],
        category: .career,
        isAvailable: false
    ),
    SpreadType(
        emoji: "✨",
        name: "Krzyż Celtycki",
        subtitle: "Najpotężniejszy rozkład — 10 kart",
        gradientColors: [.yellow, .orange],
        category: .career,
        isAvailable: false
    ),
]

// Топ 3 расклада (которые показываются по умолчанию)
let topSpreads: [SpreadType] = Array(allSpreads.filter { $0.isAvailable || true }.prefix(3))
