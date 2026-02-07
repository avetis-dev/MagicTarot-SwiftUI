import SwiftUI


enum CardPosition: String, Identifiable {
    case past = "Przeszłość"
    case present = "Teraźniejszość"
    case future = "Przyszłość"
    
    var id: String { rawValue }
}
