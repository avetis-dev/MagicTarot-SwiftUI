import Foundation

class GeminiService {
    
    private let apiKey = Secrets.geminiAPIKey
    private let model = "gemini-3-flash-preview"
    
    private var baseURL: String {
        "https://generativelanguage.googleapis.com/v1beta/models/\(model):generateContent"
    }
    
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
        
        Pisz po polsku. Bądź ciepły i konkretny.
        NIE używaj formatowania Markdown (bez ** ani ##).
        Używaj TYLKO emoji na początku sekcji jako nagłówki.
        """
        
        return try await sendRequest(prompt: prompt)
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
        """
        
        return try await sendRequest(prompt: prompt)
    }
    
    // MARK: - Send Request (с подробным логированием!)
    private func sendRequest(prompt: String) async throws -> String {
        
        let fullURL = "\(baseURL)?key=\(apiKey)"
        
        // 📋 Лог 1: URL
        print("🌐 [Gemini] URL: \(baseURL)")
        print("🔑 [Gemini] API Key: \(apiKey.prefix(10))...")
        
        guard let url = URL(string: fullURL) else {
            print("❌ [Gemini] Invalid URL!")
            throw GeminiError.invalidURL
        }
        
        // Тело запроса
        let body: [String: Any] = [
            "contents": [
                [
                    "parts": [
                        ["text": prompt]
                    ]
                ]
            ],
            "generationConfig": [
                "temperature": 0.9,
                "maxOutputTokens": 2048
            ]
        ]
        
        let jsonData = try JSONSerialization.data(withJSONObject: body)
        
        // 📋 Лог 2: Тело запроса
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            print("📤 [Gemini] Request body: \(jsonString.prefix(200))...")
        }
        
        // Настройка запроса
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 30
        
        // Отправка
        print("⏳ [Gemini] Sending request...")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // 📋 Лог 3: Ответ сервера
        if let httpResponse = response as? HTTPURLResponse {
            print("📥 [Gemini] Status code: \(httpResponse.statusCode)")
        }
        
        // 📋 Лог 4: Тело ответа (САМОЕ ВАЖНОЕ!)
        if let responseString = String(data: data, encoding: .utf8) {
            print("📥 [Gemini] Response body: \(responseString)")
        }
        
        // Проверка статуса
        guard let httpResponse = response as? HTTPURLResponse else {
            print("❌ [Gemini] No HTTP response!")
            throw GeminiError.serverError
        }
        
        // Если ошибка — парсим текст ошибки
        if httpResponse.statusCode != 200 {
            if let errorJSON = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let error = errorJSON["error"] as? [String: Any],
               let message = error["message"] as? String {
                print("❌ [Gemini] Error: \(message)")
                throw GeminiError.custom(message)
            }
            print("❌ [Gemini] HTTP Error: \(httpResponse.statusCode)")
            throw GeminiError.serverError
        }
        
        // Парсинг ответа
        guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              let candidates = json["candidates"] as? [[String: Any]],
              let content = candidates.first?["content"] as? [String: Any],
              let parts = content["parts"] as? [[String: Any]],
              let text = parts.first?["text"] as? String else {
            print("❌ [Gemini] Failed to parse response!")
            throw GeminiError.parsingError
        }
        
        print("✅ [Gemini] Success! Response length: \(text.count) chars")
        return text
    }
}

// MARK: - Errors
enum GeminiError: LocalizedError {
    case invalidURL
    case serverError
    case parsingError
    case custom(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:       return "Nieprawidłowy URL"
        case .serverError:      return "Błąd serwera. Spróbuj ponownie."
        case .parsingError:     return "Nie udało się odczytać odpowiedzi."
        case .custom(let msg):  return msg
        }
    }
}
