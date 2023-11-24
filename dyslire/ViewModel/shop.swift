//
//  shop.swift
//  dyslire
//
//  Created by rayenbellali on 8/11/2023.
//

import SwiftUI

struct shop: View {
    
    @State var goToCart = false
    
    
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var items: [[Any]] = shopItems
    
    var body: some View {
        VStack(spacing: 5 ) {
            VStack {
                Text("Bonjour,")
                    .frame(width:320, alignment:
                            .leading)
                    .foregroundColor(.orange)
                Text("Commandons du matériel\nArticles pour vous")
                    .font(.system(size: 35, weight: .semibold, design: .rounded))
                    .frame(width: 320,alignment: .leading)
                Spacer().frame(height: 55)
                Text("Bons Articles")
                    .frame(width: 320,alignment: .leading)
                    .foregroundColor(.brown)
            }.padding(20)
            ScrollView() {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(0..<items.count,
                            id:\.self) { item in
                        shopItem(imageName:
                                    items[item][0] as! String,
                                 title: items[item][1] as!
                                 String, price: items[item][2]
                                 as! Double,
                                 color: items[item][3] as! Color, selfIndex: item)
                    }
                }
            }.padding(20)
        }
        .navigationDestination(isPresented: $goToCart) {
            Cart()
        }
        .toolbar {
            ToolbarItem(placement:
                    .navigationBarTrailing) {
                        Button() {
                            goToCart = true
                        }label: {
                            Image(systemName: "cart")
                        }             }
        }
    }
}
        
            
            
        
                        
                        
                    
    


struct shop_Previews: PreviewProvider {
    static var previews: some View {
        shop()
    }
}
