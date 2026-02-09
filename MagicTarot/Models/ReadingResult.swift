import Foundation

struct ReadingResult {
    let cards: [(position: String, emoji: String, card: TarotCard)]
    
    //for one card
    static func oneCard(_ card: TarotCard) -> ReadingResult {
        ReadingResult(cards: [
            (position: "Karta Dnia", emoji: "🧙🏻", card: card)
        ])
    }
    
    static func threeCards(
        past: TarotCard,
        present: TarotCard,
        future: TarotCard
    ) -> ReadingResult {
        ReadingResult(cards: [
            (position: "Przeszłość", emoji: "⏪", card: past),
            (position: "Teraźniejszość", emoji: "✨", card: present),
            (position: "Przyszłość", emoji: "⏩", card: future)
        ])
    }
}
