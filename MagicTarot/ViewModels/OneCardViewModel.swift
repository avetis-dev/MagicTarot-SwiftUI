import SwiftUI

@Observable

class OneCardViewModel {
    var card: TarotCard? = nil
    var showSheet = false
    
    var hasCard: Bool {
        card != nil
    }
    
    func selectedCard() {
        showSheet = true
        hapticFeedback()
    }
    
    func resetCard() {
        card = nil
        hapticFeedback()
    }
    
    private func hapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
}
