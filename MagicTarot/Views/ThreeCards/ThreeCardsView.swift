import SwiftUI

struct ThreeCardsView: View {
    
    @State private var vm = ThreeCardsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                MysticBackground()
                StarsBackground()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        headerSection
                        cardsSection
                        
                        // Показываем результат ИЛИ кнопку
                        if vm.hasInterpretation {
                            resultSection
                        } else if vm.isLoadingAI {
                            AILoadingView()
                                .padding(.horizontal, 20)
                        } else if let error = vm.aiError {
                            errorSection(error: error)
                                .padding(.horizontal, 20)
                        }
                        
                        bottomSection
                    }
                    .padding(.bottom, 40)
                }
            }
            .sheet(item: $vm.activePosition) { position in
                CardSelectionView(
                    cardToChange: vm.bindingForPosition(position)
                )
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("🔮")
                .font(.system(size: 40))
            
            Text("Rozkład: Trzy Karty")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text(headerSubtitle)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))
            
            // Прогресс
            HStack(spacing: 8) {
                ForEach(0..<3, id: \.self) { index in
                    Circle()
                        .fill(index < vm.selectedCount ? Color.yellow : Color.white.opacity(0.3))
                        .frame(width: 8, height: 8)
                        .animation(.spring(duration: 0.4), value: vm.selectedCount)
                }
                Text("\(vm.selectedCount)/3")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.5))
            }
            .padding(.top, 8)
        }
        .padding(.top, 30)
    }
    
    private var headerSubtitle: String {
        if vm.hasInterpretation {
            return "Twój rozkład jest gotowy"
        } else if vm.isLoadingAI {
            return "Analizuję Twoje karty..."
        } else if vm.allCardsSelected {
            return "Wszystkie karty wybrane! Sprawdź rozkład"
        } else {
            return "Dotknij kartę, aby wybrać"
        }
    }
    
    // MARK: - Cards
    private var cardsSection: some View {
        HStack(spacing: 12) {
            CardPlaceholder(title: "Przeszłość", emoji: "⏪", card: vm.pastCard) {
                vm.selectPosition(.past)
            }
            CardPlaceholder(title: "Teraźniejszość", emoji: "✨", card: vm.presentCard) {
                vm.selectPosition(.present)
            }
            CardPlaceholder(title: "Przyszłość", emoji: "⏩", card: vm.futureCard) {
                vm.selectPosition(.future)
            }
        }
        .padding(.horizontal, 24)
    }
    
    // MARK: - Result (AI интерпретация)
    private var resultSection: some View {
        VStack(spacing: 16) {
            // Разделитель
            HStack(spacing: 12) {
                Rectangle().fill(.white.opacity(0.1)).frame(height: 1)
                Text("AI Interpretacja")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white.opacity(0.4))
                Rectangle().fill(.white.opacity(0.1)).frame(height: 1)
            }
            .padding(.horizontal, 20)
            
            // Мини карты
            miniCardsRow
            
            // AI текст
            AIInterpretationView(
                text: vm.aiInterpretation,
                cardColor: .purple
            )
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Mini Cards Row
    private var miniCardsRow: some View {
        HStack(spacing: 20) {
            if let past = vm.pastCard {
                miniCard(card: past, emoji: "⏪", label: "Przeszłość")
            }
            if let present = vm.presentCard {
                miniCard(card: present, emoji: "✨", label: "Teraźniejszość")
            }
            if let future = vm.futureCard {
                miniCard(card: future, emoji: "⏩", label: "Przyszłość")
            }
        }
    }
    
    private func miniCard(card: TarotCard, emoji: String, label: String) -> some View {
        VStack(spacing: 6) {
            Image(card.image)
                .resizable()
                .aspectRatio(2/3, contentMode: .fit)
                .frame(width: 55)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .shadow(color: card.color.opacity(0.4), radius: 5)
            
            Text(emoji)
                .font(.caption2)
            
            Text(card.name)
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.6))
                .lineLimit(1)
        }
    }
    
    // MARK: - Error
    private func errorSection(error: String) -> some View {
        VStack(spacing: 12) {
            Text("😔")
                .font(.system(size: 30))
            
            Text(error)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))
                .multilineTextAlignment(.center)
            
            Button {
                Task {
                    await vm.getAIReading()
                }
            } label: {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("Spróbuj ponownie")
                }
                .font(.subheadline)
                .foregroundStyle(.yellow)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(.yellow.opacity(0.15))
                .clipShape(Capsule())
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(.red.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
    
    // MARK: - Bottom
    private var bottomSection: some View {
        VStack(spacing: 12) {
            // Кнопка "Получить толкование"
            if vm.allCardsSelected && !vm.hasInterpretation && !vm.isLoadingAI {
                Button {
                    Task {
                        await vm.getAIReading()
                    }
                } label: {
                    HStack {
                        Image(systemName: "sparkles")
                        Text("Sprawdź rozkład")
                    }
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.yellow)
                    .cornerRadius(15)
                }
                .padding(.horizontal, 40)
            } else if !vm.allCardsSelected {
                // Неактивная кнопка
                HStack {
                    Image(systemName: "sparkles")
                    Text("Sprawdź rozkład")
                }
                .font(.headline)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(15)
                .padding(.horizontal, 40)
            }
            
            // Кнопка сброса
            if vm.hasAnyCard {
                Button {
                    withAnimation(.spring(duration: 0.5)) {
                        vm.resetCards()
                    }
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "arrow.counterclockwise")
                        Text("Nowy rozkład")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.6))
                }
                .transition(.opacity)
            }
        }
        .padding(.top, 10)
        .padding(.bottom, 30)
    }
}

#Preview {
    ThreeCardsView()
}
