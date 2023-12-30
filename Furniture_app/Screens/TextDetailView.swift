import SwiftUI
import AVFoundation

struct TextDetailView: View {
    @ObservedObject var viewModel = TextDetailViewModel()
    var textId: String 
    var title: String

    var body: some View {
        VStack {
            HStack {
                if let texte = viewModel.texte {
                    Text(texte.contenu)
                        //.font(.custom("PlayfairDisplay-Bold", size: 24))
                        //.foregroundColor(Color.darkBlue)
                        .padding()
                        //.background(Color.lightYellow)
                        .lineSpacing(10)
                    Spacer() // Pousse le texte à gauche
                } else {
                    Text("Chargement...")
                }
                Spacer() // Pousse le contenu en haut
            }
            Spacer() // Pousse le contenu en haut
            Button("Lire") {
                viewModel.fetchAudioUrlForCategory(textId: textId)
            }
            .font(.system(size: 24, weight: .bold))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.lightYellow.edgesIgnoringSafeArea(.all))
        .onAppear {
            viewModel.fetchTextById(textId)
        }
        .navigationBarTitle(title)
    }
}
