import SwiftUI

struct InstructionSheet: View {
    let onStart: () -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            MysticBackground()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    
                    //Header
                    headerSection
                    
                    //Steps
                    stepsSection
                    
                    //Tips
                    tipsSection
                    
                    //Button
                    startButton
                }
            }
        }
    }
    private var headerSection: some View {
        VStack(spacing: 12) {
            Text("🔮")
                .font(.system(size: 50))
            Text("Jak wykonać rozkład?")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Text("Przeczytaj uważnie przed rozpoczęciem")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))
        }
    }
    private var stepsSection: some View {
        VStack(spacing: 16) {
            InstructionStep(
                number: "1", emoji: "🧘", title: "Skup się", description: "Weź głęboki oddech. Zamknij oczy na chwilę i wycisz umysł. Odłóż telefon na moment i skup się na sobie."
            )
            InstructionStep(
                            number: "2",
                            emoji: "💭",
                            title: "Zadaj pytanie",
                            description: "Pomyśl o pytaniu, które Cię nurtuje. Może dotyczyć miłości, kariery, relacji lub przyszłości. Im jaśniejsze pytanie, tym lepsza odpowiedź."
            )
            InstructionStep(
                            number: "3",
                            emoji: "🃏",
                            title: "Wyciągnij kartę",
                            description: "Kiedy poczujesz gotowość — dotknij karty. Twoja intuicja wybierze właściwą. Nie myśl za dużo, zaufaj sobie."
            )
            InstructionStep(
                            number: "4",
                            emoji: "📜",
                            title: "Odczytaj interpretację",
                            description: "Sztuczna inteligencja przeanalizuje Twoją kartę i przygotuje spersonalizowaną interpretację. Czytaj uważnie i z otwartym sercem."
            )
        }
    }
    
    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("💡 Wskazówki")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.yellow)
            
          //  Tip Row
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.yellow.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .strokeBorder(.yellow.opacity(0.15),lineWidth: 1)
        )
    }
    
    private var startButton: some View {
        Button {
            dismiss()
            onStart()
        }label: {
            HStack {
                Image(systemName: "sparkles")
                Text("Rozpocznij rozkład")
            }
            .font(.headline)
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.yellow)
            .cornerRadius(15)
        }
        .padding(.top, 15)
    }
    
    struct InstructionStep: View {
        let number: String
        let emoji: String
        let title: String
        let description: String
        
        var body: some View {
            HStack(alignment: .top, spacing: 16) {
                ZStack {
                    Circle()
                        .fill(.ultraThinMaterial)
                        .frame(width: 44, height: 44)
                    Text(emoji)
                        .font(.title3)
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text("Krok \(number): \(title)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    Text(description)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                        .lineSpacing(4)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14))
        }
    }
}


#Preview {
    InstructionSheet(onStart: {})
}
