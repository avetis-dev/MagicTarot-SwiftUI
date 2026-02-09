import SwiftUI


struct ResultCard: View{
    let position: String
    let emoji: String
    let card: TarotCard
    let index: Int
    
    @State private var isVisible = false
    
    private var interpretationText: String {
        switch position {
                case "Przeszłość":      return card.interpretations.past
                case "Teraźniejszość":  return card.interpretations.present
                case "Przyszłość":      return card.interpretations.future
                case "Karta Dnia":      return card.interpretations.general
                default:                return card.interpretations.general
                }
    }
    
    var body: some View{
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                Text(emoji)
                    .font(.title2)
                Text(position)
                    .font(.headline)
                    .foregroundStyle(.white.opacity(0.6))
            }
            
            HStack(alignment: .top, spacing: 16) {
                Image(card.image)
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .frame(width: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: card.color.opacity(0.5), radius: 10)
                VStack(alignment: .leading, spacing: 8) {
                    Text(card.name)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    Text(card.description)
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.8))
                        .lineSpacing(4)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(card.color.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(card.color.opacity(0.3), lineWidth: 1)
            )
            InterpretationBox(
                text: interpretationText,
                cardColor: card.color,
                index: index
            )
        }
        .opacity(isVisible ? 1 : 0)
        .offset(y: isVisible ? 0 : 30)
        .onAppear {
            withAnimation(.easeOut(duration: 0.5).delay(Double(index) * 0.3)) {
                isVisible = true
            }
        }
    }
}


#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ResultCard(
            position: "Przeszłość",
            emoji: "⏪",
            card: deck[0],
            index: 0
        )
        .padding()
    }
}
