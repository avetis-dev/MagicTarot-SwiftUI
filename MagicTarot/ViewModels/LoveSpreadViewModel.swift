import SwiftUI

@Observable
class LoveSpreadViewModel {
    
    // MARK: - Properties
    var yourFeelings: TarotCard? = nil
    var partnerFeelings: TarotCard? = nil
    var connection: TarotCard? = nil
    var obstacle: TarotCard? = nil
    var futureTogether: TarotCard? = nil
    
    var activePosition: LovePosition? = nil
    var showInstruction = false
    var isReadingStarted = false
    
    // AI
    var aiInterpretation: String = ""
    var isLoadingAI = false
    var aiError: String? = nil
    
    private let geminiService = GeminiService()
    
    // MARK: - Love Positions
    enum LovePosition: String, Identifiable {
        case yourFeelings = "Twoje uczucia"
        case partnerFeelings = "Uczucia partnera"
        case connection = "Połączenie"
        case obstacle = "Przeszkoda"
        case futureTogether = "Przyszłość razem"
        
        var id: String { rawValue }
        
        var emoji: String {
            switch self {
            case .yourFeelings:    return "💖"
            case .partnerFeelings: return "💙"
            case .connection:      return "🔗"
            case .obstacle:        return "🚧"
            case .futureTogether:  return "🌅"
            }
        }
    }
    
    // MARK: - Computed
    var allCardsSelected: Bool {
        yourFeelings != nil && partnerFeelings != nil &&
        connection != nil && obstacle != nil && futureTogether != nil
    }
    
    var selectedCount: Int {
        [yourFeelings, partnerFeelings, connection, obstacle, futureTogether]
            .compactMap { $0 }.count
    }
    
    var hasAnyCard: Bool {
        selectedCount > 0
    }
    
    var hasInterpretation: Bool {
        !aiInterpretation.isEmpty
    }
    
    // MARK: - Methods
    func showInstructionSheet() {
        showInstruction = true
        hapticFeedback()
    }
    
    func startReading() {
        isReadingStarted = true
        hapticFeedback()
    }
    
    func selectPosition(_ position: LovePosition) {
        activePosition = position
        hapticFeedback()
    }
    
    func resetCards() {
        yourFeelings = nil
        partnerFeelings = nil
        connection = nil
        obstacle = nil
        futureTogether = nil
        aiInterpretation = ""
        aiError = nil
        isReadingStarted = false
        isLoadingAI = false
        hapticFeedback()
    }
    
    // AI
    func getAIReading() async {
        guard let yf = yourFeelings,
              let pf = partnerFeelings,
              let conn = connection,
              let obs = obstacle,
              let ft = futureTogether else { return }
        
        isLoadingAI = true
        aiError = nil
        
        do {
            let interpretation = try await geminiService.getLoveReading(
                yourFeelings: yf,
                partnerFeelings: pf,
                connection: conn,
                obstacle: obs,
                futureTogether: ft
            )
            
            await MainActor.run {
                aiInterpretation = interpretation
                isLoadingAI = false
                hapticFeedback()
            }
        } catch {
            await MainActor.run {
                aiError = error.localizedDescription
                isLoadingAI = false
            }
        }
    }
    
    func bindingForPosition(_ position: LovePosition) -> Binding<TarotCard?> {
        switch position {
        case .yourFeelings:    return Binding(get: { self.yourFeelings }, set: { self.yourFeelings = $0 })
        case .partnerFeelings: return Binding(get: { self.partnerFeelings }, set: { self.partnerFeelings = $0 })
        case .connection:      return Binding(get: { self.connection }, set: { self.connection = $0 })
        case .obstacle:        return Binding(get: { self.obstacle }, set: { self.obstacle = $0 })
        case .futureTogether:  return Binding(get: { self.futureTogether }, set: { self.futureTogether = $0 })
        }
    }
    
    private func hapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}
