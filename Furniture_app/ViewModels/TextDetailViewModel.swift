//
//  TextDetailViewModel.swift
//  Furniture_app
//
//  Created by mohamed loukil on 20/11/2023.
//

import Foundation


class TextDetailViewModel: ObservableObject {
    @Published var detailedText: String
    
    init(detailedText: String) {
            self.detailedText = detailedText
        }

    // Fonction pour charger le texte depuis le backend
    func loadTextFromBackend() {
        // Ici, ajoutez votre logique pour récupérer les données du backend
        // Par exemple, une requête HTTP
        // Après la récupération des données :
        self.detailedText = "Texte récupéré du backend"
    }
}

