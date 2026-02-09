//
//  OneCardView.swift
//  MagicTarot
//
//  Created by Avetis Davydov on 08/02/2026.
//

import SwiftUI

struct OneCardView: View {
    
    @State private var vm = OneCardViewModel()
    
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
            .sheet(isPresented: $vm.showSheet) {
                CardSelectionView(cardToChange: Binding(
                    get: {vm.card},
                    set: {vm.card = $0}
                ))
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
                    .fill(vm.hasCard ? Color.yellow : Color.white.opacity(0.3))
                    .frame(width: 8, height: 8)
                    .animation(.spring(duration: 0.4), value: vm.hasCard)
                
                Text(vm.hasCard ? "1/1" : "0/1")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(.top, 8)
        }
        .padding(.top, 50)
    }
    
    private var cardSection: some View {
        CardPlaceholder(title: "Co dziś Cię czeka?", emoji: "🧚‍♀️", card: vm.card) {
            vm.selectedCard()
        }
        .frame(width: 200)
    }
    private var bottomSection: some View {
        VStack(spacing: 12) {
            if vm.hasCard {
                NavigationLink(
                    destination: ReadingResultView(
                        result: .oneCard(vm.card!)
                    )
                ){
                    HStack {
                        Image(systemName: "sparkles")
                        Text("Sprawdź znaczenie")
                    }
                    .font(.headline)
                    .foregroundStyle(vm.hasCard ? .black : .gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(vm.hasCard ? Color.yellow : Color.gray.opacity(0.3))
                    .cornerRadius(15)
                }
                } else {
                    HStack {
                        Image(systemName: "sparkles")
                        Text("Sprawdź znaczenie")
                    }
                    .font(.headline)
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(15)
                }
            
            // New Card Button
            if vm.hasCard {
                Button {
                    withAnimation(.spring(duration: 0.5)) {
                        vm.resetCard()
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
