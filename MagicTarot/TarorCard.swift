import SwiftUI

struct TarotCard: Identifiable {
    var id: String { name }
    let name: String
    let description: String
    let color: Color
    let image: String
}

let deck: [TarotCard] = [
    TarotCard(
        name: "Głupiec",
        description: "Nowy początek. Zaryzykuj i skocz w nieznane!",
        color: .yellow,
        image: "m00"
    ),
    TarotCard(
        name: "Mag",
        description: "Masz wszystkie zasoby. Czas na działanie!",
        color: .purple,
        image: "m01"
    ),
    TarotCard(
        name: "Arcykapłanka",
        description: "Słuchaj swojej intuicji. Tajemnica czeka na odkrycie.",
        color: .blue,
        image: "m02"
    ),
    TarotCard(
        name: "Cesarzowa",
        description: "Płodność i obfitość. Twórz i dbaj o innych.",
        color: .green,
        image: "m03"
    ),
    TarotCard(
        name: "Cesarz",
        description: "Stabilność i władza. Czas przejąć kontrolę nad swoim życiem.",
        color: .red,
        image: "m04"
    ),
    TarotCard(
        name: "Hierofant",
        description: "Tradycja i mądrość. Szukaj nauczyciela lub mentora.",
        color: .orange,
        image: "m05"
    ),
    TarotCard(
        name: "Kochankowie",
        description: "Miłość i wybór. Podążaj za głosem serca.",
        color: .pink,
        image: "m06"
    ),
    TarotCard(
        name: "Rydwan",
        description: "Determinacja i zwycięstwo. Pędź naprzód z odwagą!",
        color: .gray,
        image: "m07"
    ),
    TarotCard(
        name: "Siła",
        description: "Wewnętrzna moc i cierpliwość. Poskrom swoje lęki.",
        color: .orange,
        image: "m08"
    ),
    TarotCard(
        name: "Pustelnik",
        description: "Czas na refleksję. Odpowiedzi znajdziesz w ciszy.",
        color: .indigo,
        image: "m09"
    ),
    TarotCard(
        name: "Koło Fortuny",
        description: "Zmiany nadchodzą. Los się obraca na twoją korzyść.",
        color: .cyan,
        image: "m10"
    ),
    TarotCard(
        name: "Sprawiedliwość",
        description: "Prawda wyjdzie na jaw. Bądź uczciwy wobec siebie.",
        color: .blue,
        image: "m11"
    ),
    TarotCard(
        name: "Wisielec",
        description: "Zmień perspektywę. Czasem trzeba się zatrzymać.",
        color: .teal,
        image: "m12"
    ),
    TarotCard(
        name: "Śmierć",
        description: "Koniec i nowy początek. Puść to, co już nie służy.",
        color: .black,
        image: "m13"
    ),
    TarotCard(
        name: "Umiar",
        description: "Równowaga i harmonia. Znajdź złoty środek.",
        color: .mint,
        image: "m14"
    ),
    TarotCard(
        name: "Diabeł",
        description: "Uwolnij się z łańcuchów. Nie daj się zniewolić!",
        color: .red,
        image: "m15"
    ),
    TarotCard(
        name: "Wieża",
        description: "Nagłe zmiany i przełom. Ze zniszczenia rodzi się nowe.",
        color: .gray,
        image: "m16"
    ),
    TarotCard(
        name: "Gwiazda",
        description: "Nadzieja i inspiracja. Twoje marzenia są w zasięgu ręki.",
        color: .cyan,
        image: "m17"
    ),
    TarotCard(
        name: "Księżyc",
        description: "Iluzje i lęki. Nie wszystko jest takie, jak się wydaje.",
        color: .indigo,
        image: "m18"
    ),
    TarotCard(
        name: "Słońce",
        description: "Radość i sukces. Ciepło i światło wypełniają twoje życie!",
        color: .yellow,
        image: "m19"
    ),
    TarotCard(
        name: "Sąd",
        description: "Odrodzenie i powołanie. Czas na wielkie przebudzenie!",
        color: .purple,
        image: "m20"
    ),
    TarotCard(
        name: "Świat",
        description: "Spełnienie i ukończenie. Osiągnąłeś cel podróży!",
        color: .green,
        image: "m21"
    ),
]
