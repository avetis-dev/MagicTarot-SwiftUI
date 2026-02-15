import SwiftUI

struct SavedReadingDetailView: View {
    let reading: SavedReading
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            MysticBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    headerSection
                    cardsSection
                    dividerSection
                    interpretationSection
                    dateSection
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
        .presentationDetents([.large])
        .presentationDragIndicator(.visible)
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 12) {
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
            
            Text(reading.spreadEmoji)
                .font(.system(size: 40))
            
            Text(reading.spreadTitle)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text(reading.date.formatted(
                .dateTime.day().month().year().hour().minute()
            ))
            .font(.caption)
            .foregroundStyle(.white.opacity(0.5))
        }
    }
    
    // MARK: - Cards
    private var cardsSection: some View {
        VStack(spacing: 12) {
            // Мини карты в ряд
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Array(reading.cardNames.enumerated()), id: \.offset) { index, name in
                        VStack(spacing: 8) {
                            // Картинка
                            if index < reading.cardImages.count {
                                Image(reading.cardImages[index])
                                    .resizable()
                                    .aspectRatio(2/3, contentMode: .fit)
                                    .frame(width: 70)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .shadow(color: .purple.opacity(0.3), radius: 5)
                            }
                            
                            // Позиция
                            if index < reading.cardPositions.count {
                                Text(reading.cardPositions[index])
                                    .font(.caption2)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            
                            // Название
                            Text(name)
                                .font(.caption)
                                .fontWeight(.medium)
                                .foregroundStyle(.white.opacity(0.8))
                                .lineLimit(1)
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .padding(16)
        .background(.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    // MARK: - Divider
    private var dividerSection: some View {
        HStack(spacing: 12) {
            Rectangle().fill(.white.opacity(0.1)).frame(height: 1)
            Text("Interpretacja AI")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.white.opacity(0.4))
            Rectangle().fill(.white.opacity(0.1)).frame(height: 1)
        }
    }
    
    // MARK: - Interpretation
    private var interpretationSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Заголовок
            HStack(spacing: 8) {
                Image(systemName: "sparkles")
                    .foregroundStyle(.yellow)
                Text("Interpretacja")
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Text("Gemini")
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.5))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.white.opacity(0.1))
                    .clipShape(Capsule())
            }
            
            // Текст
            Text(reading.aiInterpretation)
                .font(.body)
                .foregroundStyle(.white.opacity(0.85))
                .lineSpacing(6)
        }
        .padding(20)
        .background(.purple.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(.purple.opacity(0.2), lineWidth: 1)
        )
    }
    
    // MARK: - Date
    private var dateSection: some View {
        HStack(spacing: 8) {
            Image(systemName: "calendar")
                .foregroundStyle(.white.opacity(0.4))
            Text("Rozkład wykonany: \(reading.date.formatted(.dateTime.day().month().year()))")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.4))
        }
    }
}

#Preview {
    SavedReadingDetailView(
        reading: SavedReading(
            spreadType: "threeCards",
            spreadTitle: "Trzy Karty",
            spreadEmoji: "🔮",
            cardNames: ["Głupiec", "Mag", "Siła"],
            cardImages: ["m00", "m01", "m08"],
            cardPositions: ["Przeszłość", "Teraźniejszość", "Przyszłość"],
            aiInterpretation: "🌟 OGÓLNE PRZESŁANIE\nTwoje karty opowiadają historię transformacji.\n\n⏪ PRZESZŁOŚĆ\nW przeszłości podjąłeś odważną decyzję.\n\n✨ TERAŹNIEJSZOŚĆ\nTeraz masz wszystkie narzędzia.\n\n⏩ PRZYSZŁOŚĆ\nPrzed Tobą wyzwanie wymagające siły."
        )
    )
}
