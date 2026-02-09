import SwiftUI

struct InterpretationBox: View {
    let text: String
    let cardColor: Color
    let index: Int
    
    @State private var isVisible = false
    @State private var displayedText = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8)  {
                Image(systemName: "text.book.closed.fill")
                    .foregroundStyle(cardColor)
                Text("Interpretacja")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white.opacity(0.6))
            }
            Text(displayedText)
                .font(.body)
                .foregroundStyle(.white.opacity(0.85))
                .lineSpacing(6)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .strokeBorder(cardColor.opacity(0.15), lineWidth: 1)
        )
        .onAppear {
            typeText()
        }
    }
    private func typeText() {
        displayedText = ""
        let delay = Double(index) * 0.8
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            for (charIndex, character) in text.enumerated() {
                DispatchQueue.main.asyncAfter(
                    deadline: .now() + Double(charIndex) * 0.015
                ){
                    displayedText += String(character)
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        InterpretationBox(
            text: "W przeszłości podjąłeś odważną decyzję, która wydawała się szalona. Ten skok w nieznane ukształtował to, kim dziś jesteś.",
            cardColor: .yellow,
            index: 0
        )
        .padding()
    }
}
