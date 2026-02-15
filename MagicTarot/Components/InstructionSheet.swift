import SwiftUI

struct InstructionSheet: View {
    let spreadInfo: SpreadInfo
    let onStart: () -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            MysticBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    headerSection
                    aboutSection
                    positionsSection
                    questionsSection
                    stepsSection
                    tipsSection
                    startButton
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 30)
            }
        }
        .presentationDetents([.large])
        .presentationDragIndicator(.visible)
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 12) {
            Text(spreadInfo.emoji)
                .font(.system(size: 50))
            
            Text(spreadInfo.title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            // Количество карт
            HStack(spacing: 6) {
                Image(systemName: "rectangle.stack")
                    .font(.caption)
                Text("\(spreadInfo.cardCount) kart")
                    .font(.caption)
                    .fontWeight(.medium)
            }
            .foregroundStyle(.yellow)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(.yellow.opacity(0.15))
            .clipShape(Capsule())
        }
    }
    
    // MARK: - About
    private var aboutSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("📖 O rozkładzie")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text(spreadInfo.description)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
                .lineSpacing(4)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
    
    // MARK: - Positions
    private var positionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("🃏 Pozycje kart")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            ForEach(Array(spreadInfo.positions.enumerated()), id: \.offset) { index, position in
                HStack(alignment: .top, spacing: 12) {
                    // Номер
                    ZStack {
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width: 36, height: 36)
                        Text(position.emoji)
                            .font(.callout)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(position.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                        
                        Text(position.description)
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.6))
                    }
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
    
    // MARK: - Example Questions
    private var questionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("💭 Przykładowe pytania")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            ForEach(spreadInfo.exampleQuestions, id: \.self) { question in
                HStack(alignment: .top, spacing: 8) {
                    Text("„")
                        .foregroundStyle(.yellow.opacity(0.7))
                    Text(question)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                        .italic()
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.purple.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .strokeBorder(.purple.opacity(0.15), lineWidth: 1)
        )
    }
    
    // MARK: - Steps
    private var stepsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("📋 Jak wykonać rozkład?")
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            InstructionStep(
                number: "1",
                emoji: "🧘",
                title: "Wycisz się",
                description: "Weź głęboki oddech. Zamknij oczy na chwilę. Odłóż inne myśli."
            )
            InstructionStep(
                number: "2",
                emoji: "💭",
                title: "Zadaj pytanie",
                description: "Pomyśl o pytaniu, które Cię nurtuje. Im jaśniejsze pytanie, tym lepsza odpowiedź."
            )
            InstructionStep(
                number: "3",
                emoji: "🃏",
                title: "Wyciągnij karty",
                description: "Dotknij kolejno \(spreadInfo.cardCount) pozycji i wybierz karty intuicyjnie."
            )
            InstructionStep(
                number: "4",
                emoji: "🤖",
                title: "Otrzymaj interpretację AI",
                description: "Sztuczna inteligencja przeanalizuje Twoje karty i przygotuje spersonalizowane przesłanie."
            )
        }
    }
    
    // MARK: - Tips
    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("💡 Wskazówki")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.yellow)
            
            ForEach(spreadInfo.tips, id: \.self) { tip in
                TipRow(text: tip)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.yellow.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .strokeBorder(.yellow.opacity(0.15), lineWidth: 1)
        )
    }
    
    // MARK: - Start Button
    private var startButton: some View {
        Button {
            dismiss()
            onStart()
        } label: {
            HStack {
                Image(systemName: "sparkles")
                Text("Rozpocznij rozkład")
            }
            .font(.headline)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.yellow)
            .cornerRadius(15)
        }
        .padding(.top, 10)
    }
    // MARK: - Instruction Step
    struct InstructionStep: View {
        let number: String
        let emoji: String
        let title: String
        let description: String
        
        var body: some View {
            HStack(alignment: .top, spacing: 16) {
                ZStack {
                    Circle()
                        .fill(.ultraThinMaterial)
                        .frame(width: 44, height: 44)
                    
                    Text(emoji)
                        .font(.title3)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Krok \(number): \(title)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text(description)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                        .lineSpacing(4)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }
}

struct TipRow: View {
    let text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text("•")
                .foregroundStyle(.yellow.opacity(0.7))
            Text(text)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.6))
        }
    }
}

#Preview {
    InstructionSheet(
        spreadInfo: SpreadInfoLibrary.loveSpread,
        onStart: {}
    )
}
