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
    
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(deck, id: \.name){ card in
                        VStack{
                            if card.image.isEmpty {
                                Rectangle().fill(.gray)
                            }else {
                                Image(card.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            Text(card.name).font(.caption)
                        }
                        .frame(height: 180)
                        .onTapGesture {
                            cardToChange = card // Save our Card
                            dismiss() // Close Window
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Choose your card")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
