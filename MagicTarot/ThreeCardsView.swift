//
//  ThreeCardsView.swift
//  MagicTarot
//
//  Created by Avetis Davydov on 06/02/2026.
//

import SwiftUI

struct ThreeCardsView: View {
    //Variable for Cards in Data
    @State private var pastCard: TarotCard? = nil
    @State private var presentCard: TarotCard? = nil
    @State private var futureCard: TarotCard? = nil
    @State private var activePosition: CardPosition? = nil
    
    enum CardPosition: String, Identifiable {
        case past = "Przeszłość"
        case present = "Teraźniejszość"
        case future = "Przyszłość"
        
        var id: String {rawValue}
    }
    
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.1, green: 0.0, blue: 0.2),  // Тёмно-фиолетовый
                    Color(red: 0.05, green: 0.0, blue: 0.15), // Почти чёрный
                    Color(red: 0.0, green: 0.0, blue: 0.1)    // Тёмно-синий
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            StarsBackground()
            
            VStack(spacing: 20) {
                VStack(spacing: 8) {
                    Text("🔮")
                        .font(.system(size: 40))
                    
                    Text("Rozkład: Trzy Karty")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    Text("Dotknij kartę, aby wybrać")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.6))
                }
                .padding(.top, 50)
                
                Spacer()
                    
                    HStack(spacing: 12){
                        CardPlaceholder(title: "Przeszłość", emoji: "⏪", card: pastCard) {
                            activePosition = .past
                        }
                        CardPlaceholder(title: "Teraźniejszość", emoji: "✨", card: presentCard) {
                            activePosition = .present
                        }
                        CardPlaceholder(title: "Przyszłość", emoji: "⏩", card: futureCard) {
                            activePosition = .future
                        }
                    }
                    .padding(.horizontal, 32)
                    Spacer()
                }
            }
            .sheet(item: $activePosition) { position in
                CardSelectionView(
                    cardToChange: bindingForPosition(position)
                )
            }
        }
    
    private func bindingForPosition(_ position: CardPosition) -> Binding<TarotCard?> {
            switch position {
            case .past:    return $pastCard
            case .present: return $presentCard
            case .future:  return $futureCard
            }
        }
    }


extension String: @retroactive Identifiable {
    public var id: String { self }
}

#Preview {
    ThreeCardsView()
}
