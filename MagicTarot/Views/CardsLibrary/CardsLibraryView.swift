import SwiftUI

struct CardsLibraryView: View {
    
    @State private var selectedSuit: CardSuit? = nil
    @State private var searchText = ""
    @State private var selectedCard: TarotCard? = nil
    
    private var filteredCards: [TarotCard] {
        var cards = deck
        
        if let suit = selectedSuit {
            cards = cards.filter { $0.suit == suit }
        }
        
        if !searchText.isEmpty {
            cards = cards.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return cards
    }
    
    private let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                MysticBackground()
                
                VStack(spacing: 16) {
                    headerSection
                    searchBar
                    SuitFilterBar(selectedSuit: $selectedSuit)
                    cardCounter
                    cardGrid
                }
            }
            .sheet(item: $selectedCard) { card in
                CardDetailView(card: card)
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("🃏")
                .font(.system(size: 40))
            
            Text("Biblioteka Kart")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text("Poznaj wszystkie karty tarota")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))
        }
        .padding(.top, 20)
    }
    
    // MARK: - Search
    private var searchBar: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.white.opacity(0.4))
            
            TextField("Szukaj karty...", text: $searchText)
                .foregroundStyle(.white)
                .autocorrectionDisabled()
            
            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.white.opacity(0.4))
                }
            }
        }
        .padding(12)
        .background(.white.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(.white.opacity(0.1), lineWidth: 1)
        )
        .padding(.horizontal, 20)
    }
    
    // MARK: - Counter
    private var cardCounter: some View {
        HStack {
            Text("\(filteredCards.count) kart")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.4))
            Spacer()
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - Grid
    private var cardGrid: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(filteredCards) { card in
                    CardGridItem(card: card)
                        .onTapGesture {
                            selectedCard = card
                            hapticFeedback()
                        }
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 100)
        }
    }
    
    private func hapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
}

#Preview {
    CardsLibraryView()
}
