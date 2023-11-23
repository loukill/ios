//
//  SplashScreenView.swift
//  Dyslire
//
//  Created by habachisirine on 22/11/2023.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        ZStack {
            // Background color or image for the splash screen
            Color.white.edgesIgnoringSafeArea(.all) // Change the color or provide an image
            
            // Logo overlay
            VStack {
                Spacer() // Spacer to push the logo to the middle
                Image("Frame") // Replace "SplashScreen" with the name of your logo image asset
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150) // Set the desired size of the image
                    .scaleEffect(0.8) // Adjust the scale to make it smaller
                Spacer() // Spacer to push the logo to the middle
            }
            .foregroundColor(.white) // Set the color of the logo
            
        }
        .onAppear {
            // Add an artificial delay to simulate an initialization task
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                isActive = true
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            // Add your home page here
            NavigationView {
                HomePageView()
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
