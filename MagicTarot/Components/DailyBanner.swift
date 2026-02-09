import SwiftUI


struct DailyBanner: View {
    var body: some View {
        NavigationLink(destination: OneCardView()) {
            ZStack {
                bannerBackground
                
                bannerStars
                
                bannerContent
                
            }
            .frame(height: 170)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
    
    private var bannerBackground: some View {
        LinearGradient(
            colors: [
                Color(red: 0.3, green: 0.0, blue: 0.5),
                Color(red: 0.1, green: 0.0, blue: 0.3),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    private var bannerContent: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 12) {
                Text("⭐ Karta Dnia")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.yellow)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(.yellow.opacity(0.15))
                    .clipShape(Capsule())
                
                Text("Sprawdź co Cię\nczeka dzisiaj!")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .lineSpacing(4)
                    .multilineTextAlignment(.leading)
                
                HStack(spacing: 6) {
                    Text("Wylosuj kartę")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                        .font(.caption)
                }
                .foregroundStyle(.yellow)
            }
            Spacer()
            Text("🧙🏻")
                .font(.system(size: 60))
        }
        .padding(24)
    }
    
    private var bannerStars: some View {
        GeometryReader { geo in
                    ForEach(0..<15, id: \.self) { _ in
                        Circle()
                            .fill(.white.opacity(Double.random(in: 0.05...0.2)))
                            .frame(width: CGFloat.random(in: 1...2))
                            .position(
                                x: CGFloat.random(in: 0...geo.size.width),
                                y: CGFloat.random(in: 0...geo.size.height)
                            )
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}


#Preview {
    ZStack{
        Color.black
        DailyBanner()
            .padding()
    }
}
