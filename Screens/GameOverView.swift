//
//  GameOverView.swift
//  Furniture_app
//
//  Created by mohamed loukil on 16/11/2023.
//

import SwiftUI

struct GameOverView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Game Over")
                .font(.largeTitle)
                .padding()
            Text("Returning to Home...")
        }
        .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
    }
}
