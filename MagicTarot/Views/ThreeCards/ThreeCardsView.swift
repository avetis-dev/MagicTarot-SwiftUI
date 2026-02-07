//
//  ThreeCardsView.swift
//  MagicTarot
//
//  Created by Avetis Davydov on 06/02/2026.
//

import SwiftUI

struct ThreeCardsView: View {
    //MARK: State
    
    @State private var pastCard: TarotCard? = nil
    @State private var presentCard: TarotCard? = nil
    @State private var futureCard: TarotCard? = nil
    @State private var activePosition: CardPosition? = nil
    
    // MARK: - Computed Properties
    private var allCardsSelected: Bool {
        pastCard != nil && presentCard != nil && futureCard != nil
    }
    
    //MARK:  How much choose cards
    
    private var selectedCount: Int {
        [pastCard, presentCard, futureCard]
            .compactMap{$0}
            .count
    }
    
    private var hasAnyCard: Bool {
        selectedCount > 0
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                MysticBackground()
                StarsBackground()
                
                VStack(spacing: 20) {
                    headerSection
                    Spacer()
                    cardsSection
                    Spacer()
                    bottomSection
                }
            }
            .sheet(item: $activePosition) { position in
                CardSelectionView(
                    cardToChange: bindingForPosition(position)
                )
            }
        }
    }
    //MARK: Header
    private var headerSection: some View {
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
            
            HStack(spacing: 8) {
                ForEach(0..<3, id: \.self) { index in
                    Circle()
                        .fill(index < selectedCount ? Color.yellow : Color.white.opacity(0.3))
                        .frame(width: 8, height: 8)
                        .animation(.spring(duration: 0.4), value: selectedCount)
                }
                Text("\(selectedCount)/3")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(.top, 8)
        }
        .padding(.top, 50)
    }
    private var cardsSection: some View {
        HStack(spacing: 12) {
                    CardPlaceholder(title: "Przeszłość", emoji: "⏪", card: pastCard) {
                        activePosition = .past
                        hapticFeedback()
                    }
                    CardPlaceholder(title: "Teraźniejszość", emoji: "✨", card: presentCard) {
                        activePosition = .present
                        hapticFeedback()
                    }
                    CardPlaceholder(title: "Przyszłość", emoji: "⏩", card: futureCard) {
                        activePosition = .future
                        hapticFeedback()
                    }
                }
                .padding(.horizontal, 24)
    }
    private var bottomSection: some View {
        VStack(spacing: 12) {
                    // Кнопка "Посмотреть расклад"
                    NavigationLink(destination: ReadingResultView()) {
                        HStack {
                            Image(systemName: "sparkles")
                            Text("Sprawdź rozkład")
                        }
                        .font(.headline)
                        .foregroundStyle(allCardsSelected ? .black : .gray)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(allCardsSelected ? Color.yellow : Color.gray.opacity(0.3))
                        .cornerRadius(15)
                    }
                    .disabled(!allCardsSelected)
                    .animation(.easeInOut(duration: 0.3), value: allCardsSelected)
                    
                    // Кнопка "Новый расклад"
                    if hasAnyCard {
                        Button {
                            withAnimation(.spring(duration: 0.5)) {
                                resetCards()
                            }
                            hapticFeedback()
                        } label: {
                            HStack(spacing: 6) {
                                Image(systemName: "arrow.counterclockwise")
                                Text("Nowy rozkład")
                            }
                            .font(.subheadline)
                            .foregroundStyle(.white.opacity(0.6))
                        }
                        .transition(.opacity)
                    }
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 30)
    }
    // MARK: - Functions
        private func bindingForPosition(_ position: CardPosition) -> Binding<TarotCard?> {
            switch position {
            case .past:    return $pastCard
            case .present: return $presentCard
            case .future:  return $futureCard
            }
        }
        
        private func resetCards() {
            pastCard = nil
            presentCard = nil
            futureCard = nil
        }
        
        private func hapticFeedback() {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        }
}

#Preview {
    ThreeCardsView()
}
