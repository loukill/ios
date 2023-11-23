import SwiftUI

struct TextCategoriesListView: View {
    @StateObject private var viewModel = TextCategoryViewModel()
    @State private var scale: CGFloat = 1 // Début avec l'échelle normale

    var body: some View {
            
                    List(viewModel.textCategories) { category in
                        NavigationLink(destination: TextDetailView(categoryId: category.id)) {
                            Text(category.title)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .scaleEffect(scale) // Appliquez l'effet d'échelle
                                .onAppear {
                                    // Appliquez l'animation après que la vue apparaisse
                                    withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                                        scale = 1.1 // Changez l'échelle pour l'animation
                                    }
                                }
                        }
                    }
                    .navigationBarTitle("Catégories de Texte")
    }
}




