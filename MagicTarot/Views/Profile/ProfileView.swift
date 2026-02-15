import SwiftUI
import SwiftData

struct ProfileView: View {
    
    @State private var selectedReading: SavedReading? = nil
    @Query(sort: \SavedReading.date, order: .reverse) private var readings: [SavedReading]
    @Environment(\.modelContext) private var modelContext
    @State private var showDeleteAlert = false
    
    // Статистика
    private var totalReadings: Int { readings.count }
    
    private var oneCardCount: Int {
        readings.filter { $0.spreadType == "oneCard" }.count
    }
    
    private var threeCardsCount: Int {
        readings.filter { $0.spreadType == "threeCards" }.count
    }
    
    private var loveSpreadCount: Int {
        readings.filter { $0.spreadType == "loveSpread" }.count
    }
    
    private var streakDays: Int {
        guard !readings.isEmpty else { return 0 }
        
        var streak = 1
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        guard let lastReading = readings.first,
              calendar.isDate(lastReading.date, inSameDayAs: today) else {
            return 0
        }
        
        var currentDate = today
        
        for reading in readings.dropFirst() {
            let readingDate = calendar.startOfDay(for: reading.date)
            let previousDay = calendar.date(byAdding: .day, value: -1, to: currentDate)!
            
            if calendar.isDate(readingDate, inSameDayAs: previousDay) {
                streak += 1
                currentDate = previousDay
            } else if !calendar.isDate(readingDate, inSameDayAs: currentDate) {
                break
            }
        }
        
        return streak
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                MysticBackground()
                StarsBackground()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        headerSection
                        statsSection
                        historySection
                        settingsSection
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 100)
                }
            }
            .sheet(item: $selectedReading) { reading in
                SavedReadingDetailView(reading: reading)
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 12) {
            // Аватар
            ZStack {
                Circle()
                    .fill(.ultraThinMaterial)
                    .frame(width: 80, height: 80)
                
                Text("🔮")
                    .font(.system(size: 35))
            }
            
            Text("Adept Tarota")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            // Streak
            if streakDays > 0 {
                HStack(spacing: 6) {
                    Image(systemName: "flame.fill")
                        .foregroundStyle(.orange)
                    Text("\(streakDays) dni z rzędu!")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(.orange)
                }
                .padding(.horizontal, 14)
                .padding(.vertical, 6)
                .background(.orange.opacity(0.15))
                .clipShape(Capsule())
            }
        }
        .padding(.top, 20)
    }
    
    // MARK: - Stats
    private var statsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("📊 Statystyki")
                .font(.headline)
                .foregroundStyle(.white)
            
            HStack(spacing: 12) {
                statCard(number: "\(totalReadings)", label: "Rozkłady", emoji: "🃏", color: .purple)
                statCard(number: "\(oneCardCount)", label: "Karta Dnia", emoji: "🧙🏻", color: .yellow)
            }
            
            HStack(spacing: 12) {
                statCard(number: "\(threeCardsCount)", label: "Trzy Karty", emoji: "🔮", color: .blue)
                statCard(number: "\(loveSpreadCount)", label: "Miłosny", emoji: "💕", color: .pink)
            }
        }
    }
    
    private func statCard(number: String, label: String, emoji: String, color: Color) -> some View {
        VStack(spacing: 8) {
            Text(emoji)
                .font(.title2)
            
            Text(number)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text(label)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.6))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(color.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .strokeBorder(color.opacity(0.2), lineWidth: 1)
        )
    }
    
    // MARK: - History
    private var historySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("📜 Historia rozkładów")
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Text("\(readings.count)")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.4))
            }
            
            if readings.isEmpty {
                VStack(spacing: 12) {
                    Text("🔮")
                        .font(.system(size: 30))
                    Text("Brak zapisanych rozkładów")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.5))
                    Text("Wykonaj rozkład i zapisz go!")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.3))
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 30)
                .background(.white.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            } else {
                ForEach(readings.prefix(10)) { reading in
                    historyRow(reading: reading)
                        .onTapGesture {
                            selectedReading = reading
                    }
                }
            }
        }
    }
    
    private func historyRow(reading: SavedReading) -> some View {
        HStack(spacing: 14) {
            // Эмодзи
            Text(reading.spreadEmoji)
                .font(.title2)
                .frame(width: 44, height: 44)
                .background(.white.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // Инфо
            VStack(alignment: .leading, spacing: 4) {
                Text(reading.spreadTitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Text(reading.cardNames.joined(separator: " • "))
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
                    .lineLimit(1)
            }
            
            Spacer()
            
            // Дата
            Text(reading.date.formatted(.dateTime.day().month()))
                .font(.caption)
                .foregroundStyle(.white.opacity(0.4))
        }
        .padding(12)
        .background(.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    // MARK: - Settings
    private var settingsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("⚙️ Ustawienia")
                .font(.headline)
                .foregroundStyle(.white)
            
            // Версия
            settingsRow(
                icon: "info.circle",
                title: "Wersja aplikacji",
                value: "1.0.0"
            )
            
            // Удалить историю
            Button {
                showDeleteAlert = true
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: "trash")
                        .foregroundStyle(.red)
                        .frame(width: 24)
                    
                    Text("Usuń historię rozkładów")
                        .font(.subheadline)
                        .foregroundStyle(.red)
                    
                    Spacer()
                }
                .padding(14)
                .background(.red.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .alert("Usunąć historię?", isPresented: $showDeleteAlert) {
                Button("Anuluj", role: .cancel) {}
                Button("Usuń", role: .destructive) {
                    deleteAllReadings()
                }
            } message: {
                Text("Wszystkie zapisane rozkłady zostaną usunięte. Tej operacji nie można cofnąć.")
            }
        }
    }
    
    private func settingsRow(icon: String, title: String, value: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(.white.opacity(0.5))
                .frame(width: 24)
            
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
            
            Spacer()
            
            Text(value)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.4))
        }
        .padding(14)
        .background(.white.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    // MARK: - Functions
    private func deleteAllReadings() {
        for reading in readings {
            modelContext.delete(reading)
        }
    }
}

#Preview {
    ProfileView()
        .modelContainer(for: SavedReading.self, inMemory: true)
}
