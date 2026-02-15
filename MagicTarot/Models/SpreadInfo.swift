import SwiftUI

struct SpreadInfo {
    let title: String
    let emoji: String
    let description: String
    let cardCount: Int
    let positions: [SpreadPosition]
    let tips: [String]
    let exampleQuestions: [String]
}

struct SpreadPosition {
    let name: String
    let emoji: String
    let description: String
}

// Все расклады
enum SpreadInfoLibrary {
    
    // Карта Дня
    static let oneCard = SpreadInfo(
        title: "Karta Dnia",
        emoji: "🧙🏻",
        description: "Najprostszy rozkład — jedna karta, która pokaże Ci energię dnia. Idealna na początek przygody z tarotem.",
        cardCount: 1,
        positions: [
            SpreadPosition(name: "Karta Dnia", emoji: "☀️", description: "Główna energia i przesłanie na dziś")
        ],
        tips: [
            "Najlepszy czas na rozkład — rano, zaraz po przebudzeniu",
            "Wykonuj maksymalnie jeden rozkład dziennie",
            "Zapisz swoją kartę i wieczorem sprawdź, czy się sprawdziła"
        ],
        exampleQuestions: [
            "Jaka energia będzie mi towarzyszyć dziś?",
            "Na co powinienem zwrócić uwagę?",
            "Jaką lekcję przyniesie mi ten dzień?"
        ]
    )
    
    // Три Карты
    static let threeCards = SpreadInfo(
        title: "Trzy Karty",
        emoji: "🔮",
        description: "Klasyczny rozkład pokazujący przepływ czasu — od przeszłości, przez teraźniejszość, aż po przyszłość. Pomaga zrozumieć, skąd idziesz i dokąd zmierzasz.",
        cardCount: 3,
        positions: [
            SpreadPosition(name: "Przeszłość", emoji: "⏪", description: "Co wydarzyło się wcześniej i wpłynęło na obecną sytuację"),
            SpreadPosition(name: "Teraźniejszość", emoji: "✨", description: "Co dzieje się teraz, jakie wyzwania i szanse Cię otaczają"),
            SpreadPosition(name: "Przyszłość", emoji: "⏩", description: "Co nadchodzi, jeśli podążysz obecną ścieżką")
        ],
        tips: [
            "Skup się na jednym konkretnym temacie",
            "Nie zadawaj pytań tak/nie — pytaj 'jak' i 'co'",
            "Pamiętaj: przyszłość nie jest ustalona — karty pokazują możliwości"
        ],
        exampleQuestions: [
            "Jak rozwinie się moja sytuacja w pracy?",
            "Co powinienem wiedzieć o mojej relacji?",
            "Jaki kierunek rozwoju jest dla mnie najlepszy?"
        ]
    )
    
    // Расклад на Любовь
    static let loveSpread = SpreadInfo(
        title: "Rozkład Miłosny",
        emoji: "💕",
        description: "Specjalny rozkład na 5 kart, stworzony do analizy relacji miłosnych. Pokazuje uczucia obu stron, przeszkody i potencjał związku.",
        cardCount: 5,
        positions: [
            SpreadPosition(name: "Twoje uczucia", emoji: "💖", description: "Co Ty czujesz w tej relacji"),
            SpreadPosition(name: "Uczucia partnera", emoji: "💙", description: "Co czuje druga osoba wobec Ciebie"),
            SpreadPosition(name: "Połączenie", emoji: "🔗", description: "Co Was łączy, fundament relacji"),
            SpreadPosition(name: "Przeszkoda", emoji: "🚧", description: "Co stoi na drodze do szczęścia"),
            SpreadPosition(name: "Przyszłość razem", emoji: "🌅", description: "Dokąd zmierza Wasza relacja")
        ],
        tips: [
            "Myśl o konkretnej osobie podczas tasowania",
            "Bądź szczery wobec siebie — karty wyczuwają emocje",
            "Nie pytaj wielokrotnie o to samo — zaakceptuj odpowiedź",
            "Ten rozkład działa najlepiej wieczorem, w spokojnej atmosferze"
        ],
        exampleQuestions: [
            "Jak rozwinie się moja relacja z tą osobą?",
            "Co ta osoba naprawdę do mnie czuje?",
            "Czy ten związek ma przyszłość?",
            "Co mogę zrobić, aby poprawić naszą relację?"
        ]
    )
}
