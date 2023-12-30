    import SwiftUI

struct HomeScreen: View {
    @StateObject private var categoryViewModel = CategoryViewModel()
    @State private var navigateToTextItems: Bool = false
    @State private var navigateToGame: Bool = false
    @Binding var isTabBarPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Accueil")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Image("Home")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .clipped()
                    .padding(.top)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 30) {
                        ForEach(categoryViewModel.categories, id: \.id) { category in
                            CategoryView(
                                viewModel: categoryViewModel,
                                category: category,
                                isActive: false,
                                text: category.title,
                                onCategoryTap: { selectedCategory in
                                    
                                    if selectedCategory.title.lowercased() == "Match card".lowercased() {
                                        navigateToGame = true
                                    } else if selectedCategory.title.lowercased() == "cours".lowercased() {
                                        navigateToTextItems = true
                                    }
                                }
                            )
                            .frame(width: 150, height: 150)
                        }
                        
                    }
                    .padding(.vertical, 20)
                }
                
                if navigateToTextItems {
                    NavigationLink(destination: TextCategoriesListView(isTabBarPresented: $isTabBarPresented), isActive: $navigateToTextItems) {
                        EmptyView()
                    }
                }
                
                if navigateToGame {
                           NavigationLink(destination: GameView(isTabBarPresented: $isTabBarPresented), isActive: $navigateToGame) {
                               EmptyView()
                           }
                       }
                
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .padding(.horizontal)
        }
    }
   
}
