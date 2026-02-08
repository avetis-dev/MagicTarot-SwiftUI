//
//  OneCardView.swift
//  MagicTarot
//
//  Created by Avetis Davydov on 08/02/2026.
//

import SwiftUI

struct OneCardView: View {
    
    @State private var oneCard: TarotCard? = nil
    @State private var showSheet = false
    
    private var hasCard: Bool {
        oneCard != nil
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                MysticBackground()
                StarsBackground()
                
                VStack(spacing: 20) {
                    headerSection
                    Spacer()
                    cardSection
                    Spacer()
                    bottomSection
                }
            }
            .sheet(isPresented: $showSheet) {
                CardSelectionView(cardToChange: $oneCard)
            }
        }
    }
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("🧙🏻")
                .font(.system(size: 40))
            
            Text("Karta Dnia")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text("Dotknij kartę, aby wybrać")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))
            
            HStack(spacing: 8) {
                Circle()
                    .fill(hasCard ? Color.yellow : Color.white.opacity(0.3))
                    .frame(width: 8, height: 8)
                    .animation(.spring(duration: 0.4), value: hasCard)
                
                Text(hasCard ? "1/1" : "0/1")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(.top, 8)
        }
        .padding(.top, 50)
    }
    
    private var cardSection: some View {
        CardPlaceholder(title: "Co dziś Cię czeka?", emoji: "🧚‍♀️", card: oneCard) {
            showSheet = true
        }
        .frame(width: 200)
    }
    private var bottomSection: some View {
        VStack(spacing: 12) {
            NavigationLink(destination: ReadingResultView()) {
                HStack {
                    Image(systemName: "sparkles")
                    Text("Sprawdź znaczenie")
                }
                .font(.headline)
                .foregroundStyle(hasCard ? .black : .gray)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(hasCard ? Color.yellow : Color.gray.opacity(0.3))
                .cornerRadius(15)
            }
            .disabled(!hasCard)
            .animation(.easeInOut(duration: 0.3), value: hasCard)
            
            // New Card Button
            if hasCard {
                Button {
                    withAnimation(.spring(duration: 0.5)) {
                        oneCard = nil
                    }
                    hapticFeedback()
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "arrow.counterclockwise")
                        Text("Wylosuj ponownie")
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
    private func hapticFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
}



#Preview {
    OneCardView()
}
