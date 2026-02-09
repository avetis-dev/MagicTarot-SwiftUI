//
//  MenuCard.swift
//  MagicTarot
//
//  Created by Avetis Davydov on 09/02/2026.
//

import SwiftUI

struct MenuCard<Destination: View>: View {
    
    let emoji: String
    let title: String
    let subtitle: String
    let gradientColors: [Color]
    let destionation: Destination
    
    init(emoji: String, title: String, subtitle: String, gradientColors: [Color], @ViewBuilder destionation: () -> Destination) {
        self.emoji = emoji
        self.title = title
        self.subtitle = subtitle
        self.gradientColors = gradientColors
        self.destionation = destionation()
    }
    
    var body: some View {
        NavigationLink(destination: destionation) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(emoji)
                        .font(.system(size: 30))
                    
                    Text(title)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                }
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(20)
            .background(
                LinearGradient(
                    colors: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: gradientColors.first?.opacity(0.4) ?? .clear, radius: 10, y: 5)
        }
    }
}

#Preview {
    ZStack{
        Color.black
        MenuCard(emoji: "🧙🏻", title: "Karta Dnia", subtitle: "Sprawdź co Cię czeka dzisiaj", gradientColors: [.purple, .indigo]
        ) {
            Text("Preview")
        }
        .padding()
    }
}
