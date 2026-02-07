import SwiftUI

struct MysticBackground: View {
    var body: some View {
        LinearGradient(
            colors: [
                Color(red: 0.1, green: 0.0, blue: 0.2),
                Color(red: 0.05, green: 0.0, blue: 0.15),
                Color(red: 0.0, green: 0.0, blue: 0.1)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}

#Preview {
    MysticBackground()
}
