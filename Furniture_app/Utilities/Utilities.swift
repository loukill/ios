//
//  memory.swift
//  memory game
//
//  Created by mohamed loukil on 14/11/2023.
//

import Foundation
import SwiftUI


let cardValues: [String] = [
    "🦑","🦐","🦞","🐡","🦀","🐠","🐟","🐬","🐳","🦭","🐊","🐙"
]

func createCardList() -> [Card] {
    var cardList = [Card]()
    
    for cardValue in cardValues {
        cardList.append(Card(text: cardValue))
        cardList.append(Card(text: cardValue))
    }
    return cardList
}

let faceDownCard = Card(text: "?")
