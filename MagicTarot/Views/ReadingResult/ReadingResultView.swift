
import SwiftUI

struct ReadingResultView: View {
    let result: ReadingResult
    @Environment(\.dismiss) private var dismiss
    @State private var showContent = true
    
    var body: some View {
        ZStack {
            MysticBackground()
            StarsBackground()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    headerSection
                    miniCardsSection
                    dividerSection
                    detailedCardsSection
                    bottomSection
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                }label: {
                    HStack(spacing:  4) {
                        Image(systemName: "chevron.left")
                        Text("Wróć")
                    }
                    .foregroundStyle(.white.opacity(0.7))
                }
            }
        }
    }
    
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("🔮")
                .font(.system(size: 40))
                .opacity(showContent ? 1 : 0)
                .scaleEffect(showContent ? 1 : 0.5)
            Text("Twój Rozkład")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .opacity(showContent ? 1 : 0)
            Text(resultSubtitle)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))
                .opacity(showContent ? 1 : 0)
        }
        .padding(.top, 20)
        .onAppear {
            withAnimation(.easeOut(duration: 0.6)) {
                showContent = true
            }
        }
    }
    
    
    private var miniCardsSection: some View {
        MiniCardRow(cards: result.cards)
            .opacity(showContent ? 1 : 0)
    }
    
    private var dividerSection: some View {
        HStack(spacing: 12){
            line
            Text("Interpretacja")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.white.opacity(0.4))
            line
        }
        .padding(.horizontal, 20)
    }
    
    private var line: some View {
        Rectangle()
            .fill(.white.opacity(0.1))
            .frame(height: 1)
    }
    
    private var detailedCardsSection: some View {
        VStack(spacing: 20) {
            ForEach(Array(result.cards.enumerated()), id: \.offset) { index, item in
                ResultCard(
                    position: item.position,
                    emoji: item.emoji,
                    card: item.card,
                    index: index
                )
            }
        }
    }
    
    private var bottomSection: some View {
        VStack(spacing: 12) {
            Button {
                dismiss()
            } label: {
                HStack {
                    Image(systemName: "arrow.counterclockwise")
                    Text("Nowy rozkład")
                }
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.yellow)
                .cornerRadius(15)
            }
            Button {
                dismiss()
            } label: {
                HStack {
                    Image(systemName: "house.fill")
                    Text("Powrót do menu")
                }
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))
            }
        }
        .padding(.top, 10)
    }
    
    private var resultSubtitle: String {
        if result.cards.count == 1 {
            return "Karta Dnia"
        } else {
            return "Przeszłość • Teraźniejszość • Przyszłość"
        }
    }
}

#Preview {
    NavigationStack {
        ReadingResultView(
            result: .threeCards(
                past: deck[0],
                present: deck[1],
                future: deck[8]
            )
        )
    }
}
