import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Główna")
                }
                .tag(0)
            CardsLibraryView()
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("Karty")
                }
                .tag(1)
            LearnView()
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Nauka")
                }
                .tag(2)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(3)
        }
        .tint(.yellow)
    }
}


#Preview {
    MainTabView()
}
