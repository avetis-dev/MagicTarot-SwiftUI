import SwiftUI
import SwiftData


@Observable
class OneCardViewModel {
    
    // MARK: - Properties
    var card: TarotCard? = nil
    var showInstruction = false
    var showCardSelection = false
    var isReadingStarted = false
    
    // AI
    var aiInterpretation: String = ""
    var isLoadingAI = false
    var aiError: String? = nil
    var isSaved = false
    
    private let geminiService = GeminiService()
    
    // MARK: - Computed
    var hasCard: Bool {
        card != nil
    }
    
    var hasInterpretation: Bool {
        !aiInterpretation.isEmpty
    }
    
    // MARK: - Methods
    
    func saveReading(context: ModelContext) {
            guard let card = card, hasInterpretation else { return }
            
            let reading = SavedReading.fromOneCard(
                card: card,
                interpretation: aiInterpretation
            )
            context.insert(reading)
            isSaved = true
            hapticFeedback()
        }
    
    /// Показать инструкцию
    func showInstructionSheet() {
        showInstruction = true
        hapticFeedback()
    }
    
    /// Начать расклад после инструкции
    func startReading() {
        isReadingStarted = true
        hapticFeedback()
    }
    
    /// Выбрать карту
    func selectCard() {
        showCardSelection = true
        hapticFeedback()
    }
    
    /// Получить AI интерпретацию
    func getAIReading() async {
        guard let card = card else { return }
        
        isLoadingAI = true
        aiError = nil
        
        do {
            let interpretation = try await geminiService.getOneCardReading(card: card)
            
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
    
    /// Сброс
    func resetCard() {
        card = nil
        aiInterpretation = ""
        aiError = nil
        isReadingStarted = false
        hapticFeedback()
    }
    
    // MARK: - Private
    private func hapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}
