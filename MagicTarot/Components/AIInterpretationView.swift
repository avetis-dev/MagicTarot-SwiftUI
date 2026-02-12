import SwiftUI

struct AIInterpretationView: View {
    let text: String
    let cardColor: Color
    @State private var displayedText = ""
    @State private var isTypingDone = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Заголовок
            HStack(spacing: 8) {
                Image(systemName: "sparkles")
                    .foregroundStyle(.yellow)
                Text("Interpretacja AI")
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Spacer()
                
                // Бейдж
                Text("Gemini")
                    .font(.caption2)
                    .fontWeight(.medium)
                    .foregroundStyle(.white.opacity(0.5))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.white.opacity(0.1))
                    .clipShape(Capsule())
            }
            
            // Текст интерпретации
            Text(displayedText)
                .font(.body)
                .foregroundStyle(.white.opacity(0.85))
                .lineSpacing(6)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            LinearGradient(
                colors: [
                    cardColor.opacity(0.1),
                    cardColor.opacity(0.05)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(cardColor.opacity(0.2), lineWidth: 1)
        )
        .onAppear {
            typeText()
        }
    }
    
    // Эффект печатания
    private func typeText() {
        displayedText = ""
        
        for (index, character) in text.enumerated() {
            DispatchQueue.main.asyncAfter(
                deadline: .now() + Double(index) * 0.008
            ) {
                displayedText += String(character)
                
                if index == text.count - 1 {
                    isTypingDone = true
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ScrollView {
            AIInterpretationView(
                text: "🌅 KARTA DNIA\n\nDziś Głupiec mówi Ci: odważ się! To idealny moment na nowy początek.\n\n💫 GŁĘBSZE ZNACZENIE\n\nWszechświat otwiera przed Tobą nowe drzwi.",
                cardColor: .yellow
            )
            .padding()
        }
    }
}
