import SwiftUI

@Observable

class ThreeCardsViewModel {
    var pastCard: TarotCard? = nil
    var presentCard: TarotCard? = nil
    var futureCard: TarotCard? = nil
    var activePosition: CardPosition? = nil
    
    //MARK: AI
    
    var aiInterpretation: String = ""
    var isLoadingAI = false
    var aiError: String? = nil
    
    private let geminiService = GeminiService()
    
    // MARK: - Computed Properties
    
    var allCardsSelected: Bool {
        pastCard != nil && presentCard != nil && futureCard != nil
    }
    
    var selectedCount: Int {
        [pastCard, presentCard, futureCard].compactMap{$0}.count
    }
    
    var hasAnyCard: Bool {
        selectedCount > 0
    }
    
    var hasInterpretation: Bool {
        !aiInterpretation.isEmpty
    }
    
    // MARK: - Methods
    
    func selectPosition(_ position: CardPosition) {
        activePosition = position
        hapticFeedback()
    }
    
    func resetCards() {
        pastCard = nil
        presentCard = nil
        futureCard = nil
        aiInterpretation = ""
        aiError = nil
        isLoadingAI = false
        hapticFeedback()
    }
    
    func getAIReading() async {
        guard let past = pastCard,
              let present = presentCard,
              let future = futureCard else {return}
        isLoadingAI = true
        aiError = nil
        
        do {
            let interpretation = try await geminiService.getThreeCardReading(
                past: past,
                present: present,
                future: future
            )
            await MainActor.run {
                aiInterpretation = interpretation
                isLoadingAI = false
                hapticFeedback()
            }
        }catch {
            await MainActor.run {
                aiError = error.localizedDescription
                isLoadingAI = false
            }
        }
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
