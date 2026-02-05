//
//  ThreeCardsView.swift
//  MagicTarot
//
//  Created by Avetis Davydov on 06/02/2026.
//

import SwiftUI

struct ThreeCardsView: View {
    
    @State private var selectedPosition: String? = nil
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack {
                Text("Рассклад: Три Карты")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .padding(.top, 50)
                Spacer()
                
                HStack(spacing: 15){
                    CardPlaceholder(title: "Прошлое", action : {
                        selectedPosition = "Прошлое"
                    })
                    CardPlaceholder(title: "Настоящее", action : {
                        selectedPosition = "Настоящее"
                    })
                    CardPlaceholder(title: "Будущее", action : {
                        selectedPosition = "Будущее"
                    })
                }
                Spacer()
            }
        }
        .sheet(item: $selectedPosition) { position in
            VStack {
                Text("Карта позиции: ")
                Text(position)
                    .font(.largeTitle)
                    .bold()
            }
            .presentationDetents([.medium])
        }
    }
}


extension String: @retroactive Identifiable {
    public var id: String { self }
}

#Preview {
    ThreeCardsView()
}
