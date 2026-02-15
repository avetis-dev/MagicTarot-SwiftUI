import Foundation

class GeminiService {
    
    private let apiKey = Secrets.geminiAPIKey
    
    private let models = [
        "gemini-3-flash-preview"
    ]
    
    // MARK: - Одна карта
    func getOneCardReading(card: TarotCard) async throws -> String {
        let prompt = """
        Jesteś doświadczonym mistrzem tarota z 30-letnim doświadczeniem.
        
        Klient wyciągnął kartę dnia: \(card.name)
        Opis karty: \(card.description)
        
        Przygotuj spersonalizowaną interpretację karty dnia. Napisz:
        
        1. 🌅 KARTA DNIA — co ta karta oznacza dziś (2-3 zdania)
        2. 💫 GŁĘBSZE ZNACZENIE — szczegółowa interpretacja (3-4 zdania)
        3. 💡 RADA NA DZIŚ — praktyczna rada (2-3 zdania)
        4. ⚠️ NA CO UWAŻAĆ — ostrzeżenie (1-2 zdania)
        5. ✨ AFIRMACJA DNIA — jedna afirmacja
        
        Pisz po polsku. Bądź ciepły i konkretny. Mów do osoby (Ty/Ciebie).
        NIE używaj formatowania Markdown (bez ** ani ##).
        """
        
        return try await sendWithFallback(prompt: prompt)
    }
    
    // MARK: - Три карты
    func getThreeCardReading(
        past: TarotCard,
        present: TarotCard,
        future: TarotCard
    ) async throws -> String {
        let prompt = """
        Jesteś doświadczonym mistrzem tarota z 30-letnim doświadczeniem.
        
        Klient wykonał rozkład trzech kart:
        - Przeszłość: \(past.name) — \(past.description)
        - Teraźniejszość: \(present.name) — \(present.description)
        - Przyszłość: \(future.name) — \(future.description)
        
        Przygotuj interpretację:
        1. 🌟 OGÓLNE PRZESŁANIE (2-3 zdania)
        2. ⏪ PRZESZŁOŚĆ — \(past.name) (3-4 zdania)
        3. ✨ TERAŹNIEJSZOŚĆ — \(present.name) (3-4 zdania)
        4. ⏩ PRZYSZŁOŚĆ — \(future.name) (3-4 zdania)
        5. 🔗 POŁĄCZENIE KART (2-3 zdania)
        6. 💡 RADA (2-3 zdania)
        7. ✨ AFIRMACJA
        
        Pisz po polsku. Bądź ciepły i konkretny.
        NIE używaj formatowania Markdown (bez ** ani ##).
        """
        
        return try await sendWithFallback(prompt: prompt)
    }
    
    // MARK: - Расклад на любовь
    func getLoveReading(
        yourFeelings: TarotCard,
        partnerFeelings: TarotCard,
        connection: TarotCard,
        obstacle: TarotCard,
        futureTogether: TarotCard
    ) async throws -> String {
        let prompt = """
        Jesteś doświadczonym mistrzem tarota specjalizującym się w rozkładach miłosnych.
        
        Klient wykonał rozkład miłosny na 5 kart:
        1. 💖 Uczucia klienta: \(yourFeelings.name) — \(yourFeelings.description)
        2. 💙 Uczucia partnera: \(partnerFeelings.name) — \(partnerFeelings.description)
        3. 🔗 Połączenie: \(connection.name) — \(connection.description)
        4. 🚧 Przeszkoda: \(obstacle.name) — \(obstacle.description)
        5. 🌅 Przyszłość razem: \(futureTogether.name) — \(futureTogether.description)
        
        Przygotuj głęboką interpretację miłosną:
        1. 💕 ENERGIA RELACJI (2-3 zdania)
        2. 💖 TWOJE UCZUCIA — \(yourFeelings.name) (3-4 zdania)
        3. 💙 UCZUCIA PARTNERA — \(partnerFeelings.name) (3-4 zdania)
        4. 🔗 WASZE POŁĄCZENIE — \(connection.name) (2-3 zdania)
        5. 🚧 PRZESZKODA — \(obstacle.name) (3-4 zdania)
        6. 🌅 PRZYSZŁOŚĆ RAZEM — \(futureTogether.name) (3-4 zdania)
        7. 💡 RADA DLA SERCA (2-3 zdania)
        8. ✨ AFIRMACJA MIŁOSNA
        
        Pisz po polsku. Bądź ciepły i romantyczny.
        NIE używaj formatowania Markdown (bez ** ani ##).
        """
        
        return try await sendWithFallback(prompt: prompt)
    }
    
    // MARK: - Отправка с fallback
    private func sendWithFallback(prompt: String) async throws -> String {
        var lastError: Error = GeminiError.serverError
        
        for model in models {
            do {
                print("🔄 [Gemini] Trying model: \(model)")
                let result = try await sendRequest(prompt: prompt, model: model)
                print("✅ [Gemini] Success with model: \(model)")
                return result
            } catch {
                print("⚠️ [Gemini] Model \(model) failed: \(error.localizedDescription)")
                lastError = error
                try? await Task.sleep(for: .seconds(1))
                continue
            }
        }
        
        throw lastError
    }
    
    // MARK: - Send Request
    private func sendRequest(prompt: String, model: String) async throws -> String {
        let baseURL = "https://generativelanguage.googleapis.com/v1beta/models/\(model):generateContent"
        let fullURL = "\(baseURL)?key=\(apiKey)"
        
        guard let url = URL(string: fullURL) else {
            throw GeminiError.invalidURL
        }
        
        let body: [String: Any] = [
            "contents": [
                ["parts": [["text": prompt]]]
            ],
            "generationConfig": [
                "temperature": 0.9,
                "maxOutputTokens": 4096
            ]
        ]
        
        let jsonData = try JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 30
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw GeminiError.serverError
        }
        
        print("📥 [Gemini] \(model) → Status: \(httpResponse.statusCode)")
        
        if httpResponse.statusCode != 200 {
            if let responseString = String(data: data, encoding: .utf8) {
                print("📥 [Gemini] Response: \(responseString.prefix(300))")
            }
            if let errorJSON = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let error = errorJSON["error"] as? [String: Any],
               let message = error["message"] as? String {
                throw GeminiError.custom(message)
            }
            throw GeminiError.serverError
        }
        
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              let candidates = json["candidates"] as? [[String: Any]],
              let content = candidates.first?["content"] as? [String: Any],
              let parts = content["parts"] as? [[String: Any]],
              let text = parts.first?["text"] as? String else {
            throw GeminiError.parsingError
        }
        
        return text
    }
}

enum GeminiError: LocalizedError {
    case invalidURL
    case serverError
    case parsingError
    case custom(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:       return "Nieprawidłowy URL"
        case .serverError:      return "Serwer jest przeciążony. Spróbuj za chwilę."
        case .parsingError:     return "Nie udało się odczytać odpowiedzi."
        case .custom(let msg):  return msg
        }
    }
}
