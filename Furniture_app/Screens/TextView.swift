//
//  TextView.swift
//  Furniture_app
//
//  Created by mohamed loukil on 22/11/2023.
//

import Foundation
import SwiftUI

struct TextView: View {
    @StateObject var viewModel = TextViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.textes) { texte in
                VStack(alignment: .leading) {
                    Text(texte.contenu)
                        .font(.headline)
                    // Autres détails du texte
                }
            }
            .onAppear {
                viewModel.fetchAllTextes()
            }
            .onAppear {
                let specificTextId = "textId" // Remplacez ceci par un ID réel
                viewModel.lireTexte(textId: specificTextId)
            }
            .navigationBarTitle("Textes")
        }
    }
}
