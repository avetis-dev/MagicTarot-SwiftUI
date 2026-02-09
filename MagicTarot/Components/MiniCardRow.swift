import SwiftUI

struct MiniCardRow: View {
    let cards: [(position: String, emoji: String, card: TarotCard)]
    
    var body: some View {
        HStack(spacing: 16) {
            ForEach(Array(cards.enumerated()), id: \.offset) { index, item in
                VStack(spacing: 8) {
                    Image(item.card.image)
                        .resizable()
                        .aspectRatio(2/3, contentMode: .fit)
                        .frame(width: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(color: item.card.color.opacity(0.5), radius: 5)
                    
                    Text(item.emoji)
                        .font(.caption)
                }
            }
        }
    }
}
