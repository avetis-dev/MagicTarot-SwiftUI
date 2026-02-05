//
//  CardPlaceholder.swift
//  MagicTarot
//
//  Created by Avetis Davydov on 06/02/2026.
//
import SwiftUI

struct CardPlaceholder: View {
    let title : String
    let action: () -> Void
    
    var body: some View {
        //Top Title
        VStack {
            Text(title)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.8))
            
            //Card
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.2))
                .frame(width: 100, height: 170)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 1)
                )
                .onTapGesture {
                    action()
                }
        }
    }
}
