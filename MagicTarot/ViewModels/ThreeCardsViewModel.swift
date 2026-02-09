import SwiftUI

@Observable

class ThreeCardsViewModel {
    var pastCard: TarotCard? = nil
    var presentCard: TarotCard? = nil
    var futureCard: TarotCard? = nil
    var activePosition: CardPosition? = nil
    
    var allCardsSelected: Bool {
        pastCard != nil && presentCard != nil && futureCard != nil
    }
    
    var selectedCount: Int {
        [pastCard, presentCard, futureCard].compactMap{$0}.count
    }
    
    var hasAnyCard: Bool {
        selectedCount > 0
    }
    func selectPosition(_ position: CardPosition) {
        activePosition = position
    }
    
    func resetCards() {
        pastCard = nil
        presentCard = nil
        futureCard = nil
    }
    func bindingForPosition(_ position: CardPosition) -> Binding<TarotCard?> {
        switch position {
        case .past:
            return Binding(
                get: { self.pastCard },
                set: { self.pastCard = $0 }
            )
        case .present:
            return Binding(
                get: { self.presentCard },
                set: { self.presentCard = $0 }
            )
        case .future:
            return Binding(
                get: { self.futureCard },
                set: { self.futureCard = $0 }
            )
        }
    }
    private func hapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}
