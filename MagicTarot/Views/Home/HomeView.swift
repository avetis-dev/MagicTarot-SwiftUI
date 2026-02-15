//
//  HomeView.swift
//  MagicTarot
//
//  Created by Avetis Davydov on 05/02/2026.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedCategory: SpreadCategory? = nil
    
    private var filteredSpreads: [SpreadType] {
        if let category = selectedCategory {
            return allSpreads.filter { $0.category == category}
        }else {
            return Array(allSpreads.prefix(3))
        }
    }
    
    private var spreadsTitle: String {
        if let category = selectedCategory {
            return category.rawValue
        }else {
            return "Popularne rozkłady"
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                MysticBackground()
                StarsBackground()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        headerSection
                        DailyBanner()
                        categoriesSection
                        spreadSection
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("✨")
                .font(.system(size: 50))
            Text("Magic Tarot")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Text("Wybierz swój rozkład")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.5))
        }
    }
    
    private var categoriesSection: some View{
        VStack(alignment: .leading, spacing: 12) {
            Text("Kategorie")
                .font(.headline)
                .foregroundStyle(.white.opacity(0.8))
            HStack(spacing: 0) {
                ForEach(SpreadCategory.allCases, id: \.self) { category in
                    Spacer()
                    CategoryCircle(
                        category: category,
                        isSelected: selectedCategory == category
                    ) {
                        withAnimation(.spring(duration: 0.3)) {
                            if selectedCategory == category {
                                selectedCategory = nil
                            }else {
                                selectedCategory = category
                            }
                        }
                        hapticFeedback()
                    }
                    Spacer()
                }
            }
        }
    }
    
    private var spreadSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(spreadsTitle)
                .font(.headline)
                .foregroundStyle(.white.opacity(0.8))
            
            ForEach(filteredSpreads) { spread in
                if spread.isAvailable {
                    NavigationLink(destination: destinationForSpread(spread)){
                        SpreadCard(spread: spread)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func destinationForSpread(_ spread: SpreadType) -> some View {
        switch spread.name {
        case "Trzy Karty":
            ThreeCardsView()
        case "Rozkład Miłosny":
            LoveSpreadView()
        default:
            ThreeCardsView()
        }
    }
    private func hapticFeedback() {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
}

#Preview {
    HomeView()
}
