import SwiftUI


struct TarotCard {
    let name: String
    let description: String
    let color: Color
    let image: String
}


let deck: [TarotCard] = [
    TarotCard(name: "Głupiec", description: "Nowy początek. Zaryzykuj i skocz w nieznane!", color: .yellow, image: "00-fool" ),
    TarotCard(name: "Mag", description: "Masz wszystkie zasoby. Czas na działanie!", color: .purple, image: "01-mag"),
    TarotCard(name: "Arcykapłanka", description: "Słuchaj swojej intuicji. Tajemnica czeka na odkrycie.", color: .blue, image: "02-magican"),
    TarotCard(name: "Cesarzowa", description: "Płodność i obfitość. Twórz i dbaj o innych.", color: .green, image: "03-impress"),
]
