//
//  HomeView.swift
//  MagicTarot
//
//  Created by Avetis Davydov on 05/02/2026.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.ignoresSafeArea()
                VStack {
                    Text("Magic Tarot")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                    Spacer()
                    NavigationLink(destination: ContentView()) {
                        Text("Karta Dnia")
                            .frame(width: 250,height: 50)
                            .background(Color.yellow)
                            .foregroundStyle(Color.black)
                            .clipShape(.capsule)
                            
                    }
                    
                    NavigationLink(destination: ThreeCardsView()) {
                        Text("3 Karty")
                            .frame(width: 250,height: 50)
                            .background(Color.green)
                            .foregroundStyle(Color.white)
                            .clipShape(.capsule)
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
