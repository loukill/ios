import SwiftUI

struct TextCategoriesListView: View {
    @StateObject private var viewModel = TextCategoryViewModel()
    @State private var scale: CGFloat = 1 // Début avec l'échelle normale
    @Binding var isTabBarPresented: Bool
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        List(viewModel.textIds, id: \.self) { textId in
            if let index = viewModel.textIds.firstIndex(of: textId) {
                let title = viewModel.textTitles[index]
                NavigationLink(destination: TextDetailView(textId: textId, title: title)) {
                    Text(title)
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
        }
        .navigationBarTitle("Titres de Texte")
                .navigationBarBackButtonHidden(true) // Cachez le bouton de retour par défaut
                .navigationBarItems(leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss() // Action pour retourner en arrière
                }) {
                    HStack {
                        Image(systemName: "arrow.left") // Icône de flèche vers la gauche
                        Text("Retour") // Texte du bouton
                    }
                })
               
    }
        
}
