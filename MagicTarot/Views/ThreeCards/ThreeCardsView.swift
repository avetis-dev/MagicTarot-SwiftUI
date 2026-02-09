//
//  ThreeCardsView.swift
//  MagicTarot
//
//  Created by Avetis Davydov on 06/02/2026.
//

import SwiftUI

struct ThreeCardsView: View {
    @State private var vm = ThreeCardsViewModel()
    
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
            .sheet(item: $vm.activePosition) { position in
                CardSelectionView(
                    cardToChange: vm.bindingForPosition(position)
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
                        .fill(index < vm.selectedCount ? Color.yellow : Color.white.opacity(0.3))
                        .frame(width: 8, height: 8)
                        .animation(.spring(duration: 0.4), value: vm.selectedCount)
                }
                Text("\(vm.selectedCount)/3")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(.top, 8)
        }
        .padding(.top, 50)
    }
    private var cardsSection: some View {
        HStack(spacing: 12) {
            CardPlaceholder(title: "Przeszłość", emoji: "⏪", card: vm.pastCard) {
                vm.selectPosition(.past)
            }
            CardPlaceholder(title: "Teraźniejszość", emoji: "✨", card: vm.presentCard) {
                vm.selectPosition(.present)
            }
            CardPlaceholder(title: "Przyszłość", emoji: "⏩", card: vm.futureCard) {
                vm.selectPosition(.future)
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
                .foregroundStyle(vm.allCardsSelected ? .black : .gray)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(vm.allCardsSelected ? Color.yellow : Color.gray.opacity(0.3))
                .cornerRadius(15)
            }
            .disabled(!vm.allCardsSelected)
            .animation(.easeInOut(duration: 0.3), value: vm.allCardsSelected)
            
            // Кнопка "Новый расклад"
            if vm.hasAnyCard {
                Button {
                    withAnimation(.spring(duration: 0.5)) {
                        vm.resetCards()
                    }
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
}


#Preview {
    ThreeCardsView()
}
