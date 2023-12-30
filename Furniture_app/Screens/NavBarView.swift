//
//  NavBarView.swift
//  Furniture_app
//
//  Created by mohamed loukil on 24/11/2023.
//
/*
import SwiftUI

struct NavBarView: View {
    @StateObject var categoryViewModel = CategoryViewModel()
    @StateObject var viewModel = CategoryViewModel()
    

    var body: some View {
        NavigationView {
            TabView {
                CategoryView(viewModel: categoryViewModel,
                             category: Category(id: "ciuhb", title: "Exemple", imageUrl: "url_de_l'image"),
                                             isActive: true,
                                             text: "Description",
                                             onCategoryTap: { _ in /* Action lorsqu'une catégorie est tapée */ })
                                    .tabItem {
                                        Label("Forum", systemImage: "text.bubble.fill")
                                    }
                                    .environmentObject(categoryViewModel)
                
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
            .navigationBarColor(backgroundColor: .orange, textColor: .white)
            .environmentObject(categoryViewModel)
        }
    }
}

extension View {
    func navigationBarColor(backgroundColor: UIColor, textColor: UIColor) -> some View {
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
*/
