import SwiftUI

struct SpreadCard: View {
    let spread: SpreadType
    
    var body: some View {
        HStack{
            Text(spread.emoji)
                .font(.system(size: 24))
                .frame(width: 44, height: 44)
                .background(
                    LinearGradient(
                        colors: spread.gradientColors,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                )
                    .opacity(0.3)
            )
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 4) {
                Text(spread.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(spread.isAvailable ? .white : .white.opacity(4))
                
                Text(spread.subtitle)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
                    .lineLimit(1)
            }
            Spacer()
            
            if spread.isAvailable {
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.4))
            }else {
                Image(systemName: "lock.fill")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.2))
            }
        }
        .padding(16)
        .background(.ultraThinMaterial.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .strokeBorder(.white.opacity(0.5), lineWidth: 1)
        )
    }
}



#Preview {
    ZStack {
        Color.black
        VStack {
              SpreadCard(spread: allSpreads[0])
//            SpreadCard(spread: allSpreads[1])
        }
        .padding()
    }
}
