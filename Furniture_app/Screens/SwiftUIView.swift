//
//  SwiftUIView.swift
//  Furniture_app
//
//  Created by mohamed loukil on 22/11/2023.
//
import SwiftUI

struct DyslexicFriendlyTextView: View {
    var body: some View {
        Text("Dyslexia-Friendly Reading Example")
            .font(.custom("OpenDyslexic", size: 24)) // Utilisez votre police dyslexique
            .foregroundColor(Color.darkBlue) // Définissez une couleur de texte adaptée
            .padding()
            .background(Color.lightYellow) // Utilisez une couleur de fond à contraste élevé
            .lineSpacing(10) // Augmente l'espacement entre les lignes
    }
}

// Définissez les couleurs d'extension pour une utilisation facile dans votre application
extension Color {
    static let darkBlue = Color(red: 0.0, green: 0.0, blue: 0.55)
    static let lightYellow = Color(red: 1.0, green: 1.0, blue: 0.8)
}

struct DyslexicFriendlyTextView_Previews: PreviewProvider {
    static var previews: some View {
        DyslexicFriendlyTextView()
    }
}
