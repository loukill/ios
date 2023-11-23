//
//  TextDetailView.swift
//  Furniture_app
//
//  Created by mohamed loukil on 20/11/2023.
//

import Foundation
import SwiftUI

struct TextDetailView: View {
    let detailedText: String

    var body: some View {
        ScrollView {
            Text(detailedText)
                .padding()
        }
        .navigationTitle("Détails")
    }
}
