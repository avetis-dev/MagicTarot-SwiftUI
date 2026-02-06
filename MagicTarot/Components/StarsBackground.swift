import SwiftUI

struct StarsBackground: View {
    var body: some View {
        GeometryReader { geo in
            ForEach(0..<30, id: \.self) { _ in
                Circle()
                    .fill(.white.opacity(Double.random(in: 0.1...0.4)))
                    .frame(width: CGFloat.random(in: 1...3))
                    .position(
                        x: CGFloat.random(in: 0...geo.size.width),
                        y: CGFloat.random(in: 0...geo.size.height)
                    )
            }
        }
    }
}
