import SwiftUI

struct CardDetailView: View {
    let card: TarotCard
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            MysticBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    // Кнопка закрыть
                    HStack {
                        Spacer()
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title2)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    // Картинка
                    Image(card.image)
                        .resizable()
                        .aspectRatio(2/3, contentMode: .fit)
                        .frame(width: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: card.color.opacity(0.5), radius: 20)
                    
                    // Название
                    VStack(spacing: 8) {
                        Text(card.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        // Масть
                        HStack(spacing: 6) {
                            Text(card.suit.emoji)
                            Text(card.suit.rawValue)
                                .font(.subheadline)
                        }
                        .foregroundStyle(.white.opacity(0.6))
                        .padding(.horizontal, 14)
                        .padding(.vertical, 6)
                        .background(.white.opacity(0.1))
                        .clipShape(Capsule())
                    }
                    
                    // Описание
                    Text(card.description)
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)
                    
                    // Значения по позициям
                    VStack(spacing: 12) {
                        meaningCard(
                            emoji: "☀️",
                            title: "Ogólne znaczenie",
                            text: card.interpretations.general
                        )
                        meaningCard(
                            emoji: "⏪",
                            title: "W pozycji Przeszłość",
                            text: card.interpretations.past
                        )
                        meaningCard(
                            emoji: "✨",
                            title: "W pozycji Teraźniejszość",
                            text: card.interpretations.present
                        )
                        meaningCard(
                            emoji: "⏩",
                            title: "W pozycji Przyszłość",
                            text: card.interpretations.future
                        )
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 40)
            }
        }
        .presentationDetents([.large])
        .presentationDragIndicator(.visible)
    }
    
    private func meaningCard(emoji: String, title: String, text: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Text(emoji)
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            
            Text(text)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.7))
                .lineSpacing(4)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(card.color.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(card.color.opacity(0.15), lineWidth: 1)
        )
    }
}

#Preview {
    CardDetailView(card: deck[0])
}
