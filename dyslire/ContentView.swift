//
//  ContentView.swift
//  dyslire
//
//  Created by rayenbellali on 8/11/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var changeScreen = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 50){
                Image("materiel")
                    .resizable()
                    .scaledToFit()
                    .frame(width:300,height:300)
                Text("Nous livrons\n le matériel à votre porte")
                    .font(.system(size:42, weight: .bold, design: .rounded ))
                    .multilineTextAlignment(.center)
                Text("dyslire vous fournit le matériel et les logiciels nécessaires\n commander chez dyslire ")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.brown)
                Button() {
                    changeScreen = true
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                        Text("Commencer")
                            .foregroundColor(
                                .white)
                            .bold()
                    }
                }.frame(width: 200, height: 70)
                    .foregroundColor(.blue)
            }
            .navigationDestination(isPresented:
                $changeScreen) {
                shop()
                
            }
        }
    }
}
        
    
struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
