import SwiftUI


struct CardPlaceholder: View {
    let title: String
    let emoji: String
    let card: TarotCard?
    let action: () -> Void
    
    var body: some View {
        VStack(spacing: 10) {
            Text(emoji)
                .font(.title2)
            
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.white.opacity(0.8))
            
            Button(action: action) {
                ZStack {
                    if let card = card {
                        Image(card.image)
                            .resizable()
                            .aspectRatio(2/3, contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .shadow(color: card.color.opacity(0.6), radius: 10)
                    } else {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.ultraThinMaterial)
                            .aspectRatio(2/3, contentMode: .fit)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .strokeBorder(.white.opacity(0.3),style: StrokeStyle(lineWidth: 2, dash: [8, 5]
                                    )
                                )
                            )
                            .overlay(
                                VStack(spacing: 8) {
                                    Image(systemName: "plus.circle")
                                        .font(.title)
                                    Text("Wybrać")
                                        .font(.caption2)
                                }
                                    .foregroundStyle(.white.opacity(0.5))
                            )
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
