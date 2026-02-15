import SwiftUI

struct LoveSpreadView: View {
    
    @State private var vm = LoveSpreadViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                MysticBackground()
                StarsBackground()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        headerSection
                        
                        if !vm.isReadingStarted {
                            notStartedSection
                        } else {
                            cardsSection
                            
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
                    }
                    .padding(.bottom, 40)
                }
            }
            .sheet(isPresented: $vm.showInstruction) {
                InstructionSheet(spreadInfo: SpreadInfoLibrary.loveSpread) {
                    vm.startReading()
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
            Text("💕")
                .font(.system(size: 40))
            
            Text("Rozkład Miłosny")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text(headerSubtitle)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))
            
            if vm.isReadingStarted {
                HStack(spacing: 8) {
                    ForEach(0..<5, id: \.self) { index in
                        Circle()
                            .fill(index < vm.selectedCount ? Color.pink : Color.white.opacity(0.3))
                            .frame(width: 8, height: 8)
                            .animation(.spring(duration: 0.4), value: vm.selectedCount)
                    }
                    Text("\(vm.selectedCount)/5")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.5))
                }
                .padding(.top, 8)
            }
        }
        .padding(.top, 30)
    }
    
    private var headerSubtitle: String {
        if !vm.isReadingStarted {
            return "Odkryj tajemnice Waszej relacji"
        } else if vm.hasInterpretation {
            return "Twój rozkład miłosny jest gotowy"
        } else if vm.allCardsSelected {
            return "Wszystkie karty wybrane!"
        } else {
            return "Wybierz \(5 - vm.selectedCount) kart"
        }
    }
    
    // MARK: - Not Started
    private var notStartedSection: some View {
        VStack(spacing: 20) {
            Spacer().frame(height: 40)
            
            // Красивая иллюстрация
            ZStack {
                Circle()
                    .fill(.pink.opacity(0.1))
                    .frame(width: 150, height: 150)
                
                Circle()
                    .strokeBorder(.pink.opacity(0.2), lineWidth: 2)
                    .frame(width: 150, height: 150)
                
                Text("💕")
                    .font(.system(size: 60))
            }
            
            Text("Pomyśl o osobie, którą kochasz\nlub o relacji, która Cię nurtuje")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))
                .multilineTextAlignment(.center)
            
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
                .background(Color.pink)
                .cornerRadius(15)
            }
            .padding(.horizontal, 40)
        }
    }
    
    // MARK: - Cards (5 карт в 2 ряда)
    private var cardsSection: some View {
        VStack(spacing: 12) {
            // Первый ряд: 3 карты
            HStack(spacing: 10) {
                CardPlaceholder(title: "Twoje uczucia", emoji: "💖", card: vm.yourFeelings) {
                    vm.selectPosition(.yourFeelings)
                }
                CardPlaceholder(title: "Połączenie", emoji: "🔗", card: vm.connection) {
                    vm.selectPosition(.connection)
                }
                CardPlaceholder(title: "Uczucia partnera", emoji: "💙", card: vm.partnerFeelings) {
                    vm.selectPosition(.partnerFeelings)
                }
            }
            
            // Второй ряд: 2 карты
            HStack(spacing: 10) {
                CardPlaceholder(title: "Przeszkoda", emoji: "🚧", card: vm.obstacle) {
                    vm.selectPosition(.obstacle)
                }
                CardPlaceholder(title: "Przyszłość", emoji: "🌅", card: vm.futureTogether) {
                    vm.selectPosition(.futureTogether)
                }
            }
            .padding(.horizontal, 40)
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - Result
    private var resultSection: some View {
        VStack(spacing: 16) {
            HStack(spacing: 12) {
                Rectangle().fill(.white.opacity(0.1)).frame(height: 1)
                Text("AI Interpretacja Miłosna")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white.opacity(0.4))
                Rectangle().fill(.white.opacity(0.1)).frame(height: 1)
            }
            .padding(.horizontal, 20)
            
            AIInterpretationView(
                text: vm.aiInterpretation,
                cardColor: .pink
            )
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Error
    private func errorSection(error: String) -> some View {
        VStack(spacing: 12) {
            Text("😔").font(.system(size: 30))
            Text(error)
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.6))
                .multilineTextAlignment(.center)
            
            Button {
                Task { await vm.getAIReading() }
            } label: {
                HStack {
                    Image(systemName: "arrow.clockwise")
                    Text("Spróbuj ponownie")
                }
                .font(.subheadline)
                .foregroundStyle(.pink)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(.pink.opacity(0.15))
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
            if vm.allCardsSelected && !vm.hasInterpretation && !vm.isLoadingAI {
                Button {
                    Task { await vm.getAIReading() }
                } label: {
                    HStack {
                        Image(systemName: "heart.fill")
                        Text("Sprawdź rozkład miłosny")
                    }
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.pink)
                    .cornerRadius(15)
                }
                .padding(.horizontal, 40)
            } else if !vm.allCardsSelected && vm.isReadingStarted {
                HStack {
                    Image(systemName: "heart.fill")
                    Text("Sprawdź rozkład miłosny")
                }
                .font(.headline)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(15)
                .padding(.horizontal, 40)
            }
            
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
    LoveSpreadView()
}
