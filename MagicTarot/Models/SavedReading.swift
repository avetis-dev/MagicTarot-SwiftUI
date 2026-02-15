import SwiftUI
import SwiftData

@Model
class SavedReading {
    var id: UUID
    var date: Date
    var spreadType: String        // "oneCard" / "threeCards" / "loveSpread"
    var spreadTitle: String       // "Karta Dnia" / "Trzy Karty" / "Rozkład Miłosny"
    var spreadEmoji: String       // "🧙🏻" / "🔮" / "💕"
    var cardNames: [String]       // ["Głupiec", "Mag", "Siła"]
    var cardImages: [String]      // ["m00", "m01", "m08"]
    var cardPositions: [String]   // ["Przeszłość", "Teraźniejszość", "Przyszłość"]
    var aiInterpretation: String  // Текст от Gemini
    
    init(
        spreadType: String,
        spreadTitle: String,
        spreadEmoji: String,
        cardNames: [String],
        cardImages: [String],
        cardPositions: [String],
        aiInterpretation: String
    ) {
        self.id = UUID()
        self.date = Date()
        self.spreadType = spreadType
        self.spreadTitle = spreadTitle
        self.spreadEmoji = spreadEmoji
        self.cardNames = cardNames
        self.cardImages = cardImages
        self.cardPositions = cardPositions
        self.aiInterpretation = aiInterpretation
    }
}

// Хелперы для создания
extension SavedReading {
    
    static func fromOneCard(card: TarotCard, interpretation: String) -> SavedReading {
        SavedReading(
            spreadType: "oneCard",
            spreadTitle: "Karta Dnia",
            spreadEmoji: "🧙🏻",
            cardNames: [card.name],
            cardImages: [card.image],
            cardPositions: ["Karta Dnia"],
            aiInterpretation: interpretation
        )
    }
    
    static func fromThreeCards(
        past: TarotCard,
        present: TarotCard,
        future: TarotCard,
        interpretation: String
    ) -> SavedReading {
        SavedReading(
            spreadType: "threeCards",
            spreadTitle: "Trzy Karty",
            spreadEmoji: "🔮",
            cardNames: [past.name, present.name, future.name],
            cardImages: [past.image, present.image, future.image],
            cardPositions: ["Przeszłość", "Teraźniejszość", "Przyszłość"],
            aiInterpretation: interpretation
        )
    }
    
    static func fromLoveSpread(
        yourFeelings: TarotCard,
        partnerFeelings: TarotCard,
        connection: TarotCard,
        obstacle: TarotCard,
        futureTogether: TarotCard,
        interpretation: String
    ) -> SavedReading {
        SavedReading(
            spreadType: "loveSpread",
            spreadTitle: "Rozkład Miłosny",
            spreadEmoji: "💕",
            cardNames: [yourFeelings.name, partnerFeelings.name, connection.name, obstacle.name, futureTogether.name],
            cardImages: [yourFeelings.image, partnerFeelings.image, connection.image, obstacle.image, futureTogether.image],
            cardPositions: ["Twoje uczucia", "Uczucia partnera", "Połączenie", "Przeszkoda", "Przyszłość razem"],
            aiInterpretation: interpretation
        )
    }
}
