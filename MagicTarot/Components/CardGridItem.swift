//
//  CardGridItem.swift
//  MagicTarot
//
//  Created by Avetis Davydov on 11/02/2026.
//

import SwiftUI

struct CardGridItem: View {
    let card: TarotCard
    
    var body: some View {
        VStack(spacing: 8) {
            Image(card.image)
                .resizable()
                .aspectRatio(2/3, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: card.color.opacity(0.4), radius: 5)
            
            Text(card.name)
                .font(.caption2)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .lineLimit(1)
            
            Text(card.suit.emoji)
                .font(.caption2)
        }
        .padding(8)
        .background(.ultraThinMaterial.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(.white.opacity(0.08), lineWidth: 1)
        )
    }
}

#Preview {
    ZStack {
        Color.black
        CardGridItem(card: deck[30])
            .frame(width: 120)
    }
}
