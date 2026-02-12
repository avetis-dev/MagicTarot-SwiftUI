import SwiftUI

struct AILoadingView: View {
    @State private var dots = ""
    @State private var currentPhrase = 0
    
    let phrases = [
        "Łączę się z kosmosem",
        "Odczytuję energię karty",
        "Przygotowuję interpretację",
        "Konsultuję się z gwiazdami",
        "Analizuję Twój rozkład"
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            // Анимированный эмодзи
            Text("🔮")
                .font(.system(size: 50))
                .rotationEffect(.degrees(Double(dots.count) * 30))
                .animation(.easeInOut(duration: 0.5), value: dots)
            
            // Текст
            Text(phrases[currentPhrase] + dots)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
                .animation(.none, value: dots)
            
            // Прогресс бар
            ProgressView()
                .tint(.yellow)
                .scaleEffect(1.2)
        }
        .padding(30)
        .frame(maxWidth: .infinity)
        .background(.ultraThinMaterial.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(.white.opacity(0.1), lineWidth: 1)
        )
        .onAppear {
            startAnimation()
        }
    }
    
    private func startAnimation() {
        // Точки
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            if dots.count >= 3 {
                dots = ""
            } else {
                dots += "."
            }
        }
        
        // Смена фразы
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            withAnimation {
                currentPhrase = (currentPhrase + 1) % phrases.count
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        AILoadingView()
            .padding()
    }
}
