import SwiftUI

struct HomeScreen: View {
    @StateObject private var categoryViewModel = CategoryViewModel()
    @State private var navigateToTextItems: Bool = false
    @State private var navigateToGame: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Accueil")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Image("home")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipped()
                    .padding(.top)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) { // Ajout d'espace entre les images
                        ForEach(categoryViewModel.categories, id: \.id) { category in
                            CategoryView(
                                viewModel: categoryViewModel,
                                category: category,
                                isActive: false,
                                text: category.title,
                                onCategoryTap: { selectedCategory in
                                    if selectedCategory.title.lowercased() == "exercices".lowercased() {
                                        navigateToGame = true
                                    } else if selectedCategory.title.lowercased() == "cours".lowercased() {
                                        navigateToTextItems = true
                                    }
                                }
                            )
                            .frame(width: 150, height: 150)
                        }
                    }
                    .padding(.vertical, 20) // Ajout d'espace au-dessus et en dessous des images
                }

                if navigateToTextItems {
                    NavigationLink(destination: TextCategoriesListView(), isActive: $navigateToTextItems) {
                        EmptyView()
                    }
                }
                
                if navigateToGame {
                    NavigationLink(destination: GameView(), isActive: $navigateToGame) {
                        EmptyView()
                    }
                }
                Spacer()
            }
            .navigationBarTitle("", displayMode: .inline)
            .padding(.horizontal)
        }
    }
}
