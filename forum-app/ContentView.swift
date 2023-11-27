import SwiftUI

struct ContentView: View {
    @StateObject var forumDetailsViewModel = ForumDetailsViewModel()
    @StateObject var viewModel = ForumListViewModel()
    let currentUser = User(id: "1", name: "John Doe", username: "john_doe")

    var body: some View {
        NavigationView {
            TabView {
                ForumListView()
                    .tabItem {
                        Label("Forum", systemImage: "text.bubble.fill")
                    }
                    .environmentObject(viewModel)
                
                // Ajoutez d'autres vues pour les onglets "Activité", "Bibliothèque", "Produits" ici
                Text("home")
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                Text("Activité")
                    .tabItem {
                        Label("Activité", systemImage: "bell")
                    }

                Text("Bibliothèque")
                    .tabItem {
                        Label("Bibliothèque", systemImage: "book")
                    }

                Text("Produits")
                    .tabItem {
                        Label("Produits", systemImage: "bag")
                    }
            }
            .accentColor(.purple) // Couleur pour les icônes actives
            .navigationBarColor(.orange, textColor: .white)
            .environmentObject(forumDetailsViewModel)
        }
    }
}

extension View {
    func navigationBarColor(_ backgroundColor: UIColor, textColor: UIColor) -> some View {
        modifier(NavigationBarModifier(backgroundColor: backgroundColor, textColor: textColor))
    }
}

struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor
    var textColor: UIColor

    init(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }

    func body(content: Content) -> some View {
        content
            .onAppear {
                let coloredAppearance = UINavigationBarAppearance()
                coloredAppearance.configureWithOpaqueBackground()
                coloredAppearance.backgroundColor = backgroundColor
                coloredAppearance.titleTextAttributes = [.foregroundColor: textColor]
                coloredAppearance.largeTitleTextAttributes = [.foregroundColor: textColor]

                UINavigationBar.appearance().standardAppearance = coloredAppearance
                UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
            }
    }
}
