import SwiftUI

struct CategoryCircle: View {
    let category: SpreadCategory
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                ZStack {
                    Circle()
                        .fill(
                            isSelected
                            ? category.color.opacity(0.3)
                            : Color.white.opacity(0.1)
                        )
                        .frame(width: 65, height: 65)
                    Circle()
                        .strokeBorder(
                            isSelected ? category.color : .clear,
                            lineWidth: 2
                    )
                        .frame(width: 65, height: 65)
                    Text(category.emoji)
                        .font(.system(size: 28))
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
