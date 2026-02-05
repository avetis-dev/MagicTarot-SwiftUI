//
//  ContentView.swift
//  MagicTarot
//
//  Created by Avetis Davydov on 04/02/2026.
//

import SwiftUI

struct ContentView: View {

    @State private var rotationAngle = 0.0 // Угол поворорта
    @State private var isLoading = false
    @State private var currentCard = TarotCard(name: "Таро Судьбы", description: "Нажми Кнопку ниже,чтобы получить предсказание", color: .white, image: "")
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 20) {
                
                //MARK: Header
                VStack(spacing: 5) {
                    Text("Магическое Таро")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                    
                    Text("Created by Avetis")
                        .font(.subheadline)
                        .foregroundStyle(Color.gray)
                        .italic()
                }
                .padding(.top, 40)
                Spacer()
                ZStack {
                    if currentCard.image == "" {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 350)
                                .frame(maxWidth: 250)
                            Text("🔮")
                                .font(.system(size: 80))
                        }
                        .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray, lineWidth: 2)
                        )
                    }else {
                        Image(currentCard.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 350)
                            .cornerRadius(25)
                            .shadow(color: currentCard.color.opacity(0.5), radius: 20, x: 0, y: 10)
                    }
                }
                
                .rotation3DEffect(
                    .degrees(rotationAngle),
                    axis: (x: 0, y: 1, z: 0)
                )
                
                VStack(spacing: 10) {
                    Text(currentCard.name)
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundStyle(currentCard.color)
                        .multilineTextAlignment(.center)
                    
                    Text(currentCard.description)
                        .font(.title3)
                        .foregroundStyle(currentCard.color)
                        .multilineTextAlignment(.center)
                        .padding()
                        .frame(height: 150)
                    Spacer()
                    
                    Button(action: {
                        isLoading = true
                        
                        withAnimation(.easeInOut(duration: 0.5)) {
                            rotationAngle += 180
                            currentCard = TarotCard(name: "...", description: "Связь с космосом", color: .gray, image: "")
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.spring()) {
                                if let randomCard = deck.randomElement() {
                                    print("Выбрана карта: \(randomCard.name)")
                                    print("Имя картинки: '\(randomCard.image)'")
                                    currentCard = randomCard
                                }
                                isLoading = false
                            }
                        }
                    }) {
                        Text("Вытянуть карту")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(currentCard.color == .white ? Color.white : currentCard.color)
                            .clipShape(RoundedRectangle.init(cornerRadius: 15))
                            .shadow(radius: 5)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
