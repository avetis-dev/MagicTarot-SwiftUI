import SwiftUI

struct OneCardView: View {
    
    @State private var vm = OneCardViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                MysticBackground()
                StarsBackground()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        headerSection
                        
                        if !vm.isReadingStarted {
                            // Ещё не начал — показываем кнопку старта
                            notStartedSection
                        } else if !vm.hasCard {
                            // Начал, но карту не выбрал
                            selectCardSection
                        } else {
                            // Карта выбрана — показываем результат
                            resultSection
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
            }
            // Инструкция
            .sheet(isPresented: $vm.showInstruction) {
                InstructionSheet {
                    vm.startReading()
                }
            }
            // Выбор карты
            .sheet(isPresented: $vm.showCardSelection) {
                CardSelectionView(
                    cardToChange: Binding(
                        get: { vm.card },
                        set: { newCard in
                            vm.card = newCard
                            // Автоматически запрашиваем AI после выбора
                            if newCard != nil {
                                Task {
                                    await vm.getAIReading()
                                }
                            }
                        }
                    )
                )
            }
        }
    }
    
    // MARK: - Header
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text("🧙🏻")
                .font(.system(size: 40))
            
            Text("Karta Dnia")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text(headerSubtitle)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))
        }
        .padding(.top, 30)
    }
    
    private var headerSubtitle: String {
        if !vm.isReadingStarted {
            return "Poznaj przesłanie na dziś"
        } else if !vm.hasCard {
            return "Wyciągnij swoją kartę"
        } else {
            return "Twoja karta na dziś"
        }
    }
    
    // MARK: - Not Started
    private var notStartedSection: some View {
        VStack(spacing: 20) {
            Spacer()
                .frame(height: 60)
            
            // Красивая анимированная карта-заглушка
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.ultraThinMaterial)
                    .frame(width: 180, height: 270)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(
                                .white.opacity(0.2),
                                style: StrokeStyle(lineWidth: 2, dash: [8, 5])
                            )
                    )
                
                VStack(spacing: 12) {
                    Text("🃏")
                        .font(.system(size: 50))
                    Text("Twoja karta\nczeka na Ciebie")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white.opacity(0.5))
                }
            }
            
            // Кнопка начать
            Button {
                vm.showInstructionSheet()
            } label: {
                HStack {
                    Image(systemName: "book.fill")
                    Text("Jak wykonać rozkład?")
                }
                .font(.headline)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.yellow)
                .cornerRadius(15)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Select Card
    private var selectCardSection: some View {
        VStack(spacing: 20) {
            Spacer()
                .frame(height: 40)
            
            Text("Skup się na swoim pytaniu...")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))
            
            // Карта для нажатия
            Button {
                vm.selectCard()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                colors: [.purple.opacity(0.3), .indigo.opacity(0.3)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 180, height: 270)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(.purple.opacity(0.5), lineWidth: 2)
                        )
                        .shadow(color: .purple.opacity(0.3), radius: 20)
                    
                    VStack(spacing: 12) {
                        Text("✨")
                            .font(.system(size: 40))
                        Text("Dotknij aby\nwyciągnąć kartę")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                    }
                }
            }
            
            Text("Zaufaj swojej intuicji")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.4))
        }
    }
    
    // MARK: - Result
    private var resultSection: some View {
        VStack(spacing: 20) {
            // Выбранная карта
            if let card = vm.card {
                // Картинка карты
                Image(card.image)
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .frame(width: 160)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .shadow(color: card.color.opacity(0.5), radius: 15)
                
                // Название
                VStack(spacing: 4) {
                    Text(card.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text(card.description)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.6))
                        .multilineTextAlignment(.center)
                }
                
                // Разделитель
                HStack(spacing: 12) {
                    Rectangle().fill(.white.opacity(0.1)).frame(height: 1)
                    Text("AI Interpretacja").font(.caption).foregroundStyle(.white.opacity(0.4))
                    Rectangle().fill(.white.opacity(0.1)).frame(height: 1)
                }
                .padding(.horizontal, 20)
                
                // AI контент
                if vm.isLoadingAI {
                    AILoadingView()
                } else if let error = vm.aiError {
                    // Ошибка
                    errorSection(error: error)
                } else if vm.hasInterpretation {
                    // Интерпретация
                    AIInterpretationView(
                        text: vm.aiInterpretation,
                        cardColor: card.color
                    )
                }
                
                // Кнопка сброса
                Button {
                    withAnimation(.spring(duration: 0.5)) {
                        vm.resetCard()
                    }
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "arrow.counterclockwise")
                        Text("Nowy rozkład")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.6))
                }
                .padding(.top, 10)
            }
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
}

#Preview {
    OneCardView()
}
