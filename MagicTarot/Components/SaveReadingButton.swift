import SwiftUI

struct SaveReadingButton: View {
    let isSaved: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: isSaved ? "checkmark.circle.fill" : "square.and.arrow.down")
                Text(isSaved ? "Zapisano!" : "Zapisz rozkład")
            }
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundStyle(isSaved ? .green : .white)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(isSaved ? .green.opacity(0.15) : .white.opacity(0.1))
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .strokeBorder(isSaved ? .green.opacity(0.3) : .white.opacity(0.15), lineWidth: 1)
            )
        }
        .disabled(isSaved)
        .animation(.spring(duration: 0.3), value: isSaved)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 20) {
            SaveReadingButton(isSaved: false) {}
            SaveReadingButton(isSaved: true) {}
        }
    }
}
