import SwiftUI

enum CardSuit: String, CaseIterable {
    case major = "Wielkie Arkana"
    case cups = "Kielichy"
    case pentacles = "Pentakle"
    case wands = "Różdżki"
    case swords = "Miecze"
    
    var emoji: String {
        switch self {
        case .major: return "🔮"
        case .cups:      return "🏆"
        case .pentacles: return "⭐"
        case .wands:     return "🪄"
        case .swords:    return "⚔️"
        }
    }
    
    var color: Color {
        switch self {
        case .major:     return .purple
        case .cups:      return .blue
        case .pentacles: return .yellow
        case .wands:     return .orange
        case .swords:    return .gray
        }
    }
}

struct TarotCard: Identifiable {
    var id: String { name }
    let name: String
    let description: String
    let color: Color
    let image: String
    let suit: CardSuit
    let interpretations: CardInterpretations
}

// Толкования для разных позиций
struct CardInterpretations {
    let general: String      // Общее значение (Карта Дня)
    let past: String         // В позиции "Прошлое"
    let present: String      // В позиции "Настоящее"
    let future: String       // В позиции "Будущее"
}
