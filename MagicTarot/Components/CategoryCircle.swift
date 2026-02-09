import SwiftUI

struct CategoryCircle: View {
    let category: SpreadCategory
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                ZStack {
                    if isSelected {
                        Circle()
                            .fill(category.color.opacity(0.3))
                            .frame(width: 75, height: 75)
                            .blur(radius: 10)
                    }
                    Circle()
                        .fill(.ultraThinMaterial)
                        .frame(width: 65, height: 65)
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: isSelected
                                ? [category.color.opacity(0.4), category.color.opacity(0.15)]
                                : [.white.opacity(0.08), .white.opacity(0.03)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 65, height: 65)
                    Circle()
                        .strokeBorder(
                            LinearGradient(
                                colors: isSelected
                                ? [category.color.opacity(0.8), category.color.opacity(0.2)]
                                : [.white.opacity(0.2), .white.opacity(0.05)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                        .frame(width: 65, height: 65)
                    
                    Text(category.emoji)
                        .font(.system(size: 28))
                        .shadow(
                            color: isSelected ? category.color.opacity(0.5) : .clear,
                            radius: 5
                        )
                }
                
                Text(category.rawValue)
                    .font(.caption)
                    .fontWeight(isSelected ? .bold : .regular)
                    .foregroundStyle(
                        isSelected ? .white : .white.opacity(0.6)
                    )
            }
        }
        .animation(.spring(duration: 0.3), value: isSelected)
    }
}

#Preview {
    ZStack {
        Color.black
        HStack(spacing: 30) {
            CategoryCircle(category: .love, isSelected: true) {}
            CategoryCircle(category: .personality, isSelected: false) {}
            CategoryCircle(category: .career, isSelected: false) {}
        }
    }
}
