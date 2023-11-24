//
//  shopItem.swift
//  dyslire
//
//  Created by rayenbellali on 8/11/2023.
//

import SwiftUI

struct shopItem: View {
    
    var imageName: String
    var title: String
    var price: Double
    var color: Color
    var selfIndex: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(color)
                .opacity(0.25)
                .frame(width:170, height: 200)
            VStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                Text(title)
                Button() {
                    cartItems.append(shopItems[selfIndex])
                }label: {
                    Text("$\(String(format: "%.2f", price))")
                        .foregroundColor(.blue)
                        .frame(width: 100, height: 40)
                        .background(color)
                }
            }
            
        }
    }
}

struct shopItem_Previews: PreviewProvider {
    static var previews: some View {
        shopItem(imageName: "regle", title: "regle", price: 5.00, color: Color.green
                 , selfIndex: 0)
    }
}
