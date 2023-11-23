//
//  RemoteImageView.swift
//  Furniture_app
//
//  Created by mohamed loukil on 20/11/2023.
//

import SwiftUI

struct RemoteImageView: View {
    @State private var image: Image?
    let url: URL

    var body: some View {
        Group {
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
            } else {
                // Placeholder or loading indicator
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
            }
        }
        .onAppear(perform: loadImage)
    }

    private func loadImage() {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = Image(uiImage: uiImage)
                }
            }
        }.resume()
    }
}


