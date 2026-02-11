//
//  CardSelectionView.swift
//  MagicTarot
//
//  Created by Avetis Davydov on 06/02/2026.
//

import SwiftUI

struct CardSelectionView: View {
    @Binding var cardToChange: TarotCard?
    @Environment(\.dismiss) var dismiss // For close window
    @State private var selectedSuit: CardSuit? = nil
    @State private var searchText = ""
    
    private var filteredCards: [TarotCard] {
        var cards = deck
        
        if let suit = selectedSuit {
            cards = cards.filter {$0.suit == suit}
        }
        
        if !searchText.isEmpty {
            cards = cards.filter{
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
        ZStack {
            MysticBackground()
            VStack(spacing: 16) {
                //Header
                headerSection
                
                //Search
                searchBar
                
                // Filter
                SuitFilterBar(selectedSuit: $selectedSuit)
                
                //Counter
                cardCounter
                
                //Grid
                cardGrid
            }
        }
    }
    private var headerSection: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
                    .foregroundStyle(.white.opacity(0.5))
            }
            Spacer()
            Text("Wybierz kartę")
                .font(.headline)
                .foregroundStyle(.white)
            
            Spacer()
            
            Image(systemName: "xmark.circle.fill")
                .font(.title2)
                .foregroundStyle(.clear)
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
    }
    
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
    
    private var cardCounter: some View {
        HStack {
            Text("\(filteredCards.count) kart")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.4))
            Spacer()
        }
        .padding(.horizontal, 20)
    }
    private var cardGrid: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(filteredCards) { card in
                    CardGridItem(card: card)
                        .onTapGesture {
                            cardToChange = card
                            haptickFeedback()
                            dismiss()
                        }
                }
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 30)
        }
    }
    
    private func haptickFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}


#Preview {
    CardSelectionView(cardToChange: .constant(nil))
}
