//
//  Card.swift
//  Furniture_app
//
//  Created by mohamed loukil on 15/11/2023.
//

import Foundation

class Card: Identifiable, ObservableObject {
    var id = UUID()
    @Published var isFaceUp = false
    @Published var isMatched = false
    var text: String
  
    init(text: String) {
        self.text = text
    }
    
    func turnOver() {
           isFaceUp.toggle()
       }
}
