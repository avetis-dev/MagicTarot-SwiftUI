import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    init() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(
                red: 0.05, green: 0.0, blue: 0.1, alpha: 0.95
            )
            
            // Цвет невыбранных иконок
            appearance.stackedLayoutAppearance.normal.iconColor = .gray
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                .foregroundColor: UIColor.gray
            ]
            
            // Цвет выбранной иконки
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(.yellow)
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                .foregroundColor: UIColor(.yellow)
            ]
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    
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
