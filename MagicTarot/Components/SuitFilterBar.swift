import SwiftUI

struct SuitFilterBar: View {
    
    @Binding var selectedSuit: CardSuit?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10) {
                FilterChip(
                    title: "Wszystkie",
                    emoji: "🃏",
                    isSelected: selectedSuit == nil,
                    color: .white
                ){
                    withAnimation(.spring(duration: 0.3)) {
                        selectedSuit = nil
                    }
                }
                ForEach(CardSuit.allCases, id: \.self) { suit in
                    FilterChip(
                        title: suit.rawValue,
                        emoji: suit.emoji,
                        isSelected: selectedSuit == suit,
                        color: suit.color
                    ) {
                        withAnimation(.spring(duration: 0.3)) {
                            selectedSuit = suit
                        }
                    }
                }
            }
        }
    }
}

struct FilterChip: View {
    let title: String
    let emoji: String
    let isSelected: Bool
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Text(emoji)
                    .font(.caption)
                Text(title)
                    .font(.caption)
                    .fontWeight(isSelected ? .bold : .medium)
            }
            .foregroundStyle(isSelected ? .white : .white.opacity(0.6))
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .background(
                isSelected
                ? color.opacity(0.3)
                : Color.white.opacity(0.08)
            )
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .strokeBorder(
                        isSelected ? color.opacity(0.5) : .white.opacity(0.1),
                        lineWidth: 1
                    )
            )
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SuitFilterBar(selectedSuit: .constant(.cups))
    }
}
