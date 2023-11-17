//
//  GameViewModel.swift
//  Furniture_app
//
//  Created by mohamed loukil on 16/11/2023.
//

import SwiftUI


class GameViewModel: ObservableObject {
    @Published var isGameOver = false
    @Published var navigateToGameOver = false
    @Published var cards = [Card]()
    @Published var matchedCards = [Card]()
    @Published var userChoices = [Card]()
    
    let fourColumnGrid = [GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible())]
    
    let sixColumnGrid = [GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible())]

    init() {
        self.cards = createCardList().shuffled()
    }

    func createCardList() -> [Card] {
        var cardList = [Card]()
        for cardValue in cardValues {
            cardList.append(Card(text: cardValue))
            cardList.append(Card(text: cardValue))
        }
        return cardList
    }

    func processTapOnCard(_ card: Card) {
        if !userChoices.contains(where: { $0.id == card.id }) && userChoices.count < 2 {
            card.turnOver()
            userChoices.append(card)
            if userChoices.count == 2 {
                checkForMatch()
            }
        }
    }
    
    var onGameOver: (() -> Void)?

    private func checkForMatch() {
        guard userChoices.count == 2 else { return }

        if userChoices[0].text == userChoices[1].text {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.matchedCards.append(contentsOf: self.userChoices)
                    self.userChoices.forEach { $0.isMatched = true }
                    self.userChoices.removeAll()
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.userChoices.forEach { $0.turnOver() }
                    self.userChoices.removeAll()
                }
            }
        }
        if matchedCards.count == cards.count {
                  DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                      withAnimation {
                          self.isGameOver = true
                          DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                              print("Setting navigateToGameOver to true")
                              self.navigateToGameOver = true
                          }
                      }
                  }
              }
    }

    func isCardMatched(_ card: Card) -> Bool {
        matchedCards.contains { $0.id == card.id }
    }

    func isCardFlipped(_ card: Card) -> Bool {
        userChoices.contains { $0.id == card.id }
    }
}

