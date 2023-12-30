//
//  GameViewModel.swift
//  Furniture_app
//
//  Created by mohamed loukil on 16/11/2023.
//

import SwiftUI
import Foundation


class GameViewModel: ObservableObject {
    @Published var navigateToScoreboard = false
    @Published var cards = [Card]()
    @Published var matchedCards = [Card]()
    @Published var userChoices = [Card]()
    @Published var scores = [Score]()
    @Published var gameStarted = false
    @Published var gameTimer: Int = 0 // Le temps en secondes
    @Published var score: Int = 0
    var timer: Timer?
    @Published var allScores = [Score]()
    
    
    func loadScores() {
            APIService.shared.fetchScores { scores in
                self.allScores = scores
            }
        }
    
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
        if !gameStarted {
            startGame()
        }
        if !userChoices.contains(where: { $0.id == card.id }) && userChoices.count < 2 {
            card.turnOver()
            userChoices.append(card)
            if userChoices.count == 2 {
                checkForMatch()
            }
        }
    }
    
    private func startGame() {
        gameStarted = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.gameTimer += 1
        }
    }
    
    
    private func checkForMatch() {
        guard userChoices.count == 2 else { return }
        
        let isMatch = userChoices[0].text == userChoices[1].text
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                if isMatch {
                    self.matchedCards.append(contentsOf: self.userChoices)
                    self.userChoices.forEach { $0.isMatched = true }
                } else {
                    self.userChoices.forEach { $0.turnOver() }
                }
                self.userChoices.removeAll()
                
                // Vérifiez si le jeu est terminé
                if self.matchedCards.count == self.cards.count {
                    print("Toutes les cartes ont été appariées.")
                    self.calculateScore()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM/yyyy 'à' HH:mm"
                    let dateString = dateFormatter.string(from: Date())
                    let newScore = Score(id: UUID().uuidString, points: self.score, date: dateString) // Créez une nouvelle instance de Score
                    self.allScores.append(newScore)
                    self.sendScoreToServer() // Envoyer le score au serveur
                    
                    print("Score ajouté: \(newScore). Liste des scores: \(self.allScores)")
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
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.gameTimer += 1
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    
    private func calculateScore() {
        timer?.invalidate()
        timer = nil
        
        // Calculez le score basé sur le temps
        if gameTimer < 3 * 60 {
            score = 15
        } else if gameTimer < 5 * 60 {
            score = 10
        } else {
            score = 5
        }
        
        
        print("Le score calculé est : \(score)")
    }
    
    private func sendScoreToServer() {
        APIService.shared.sendScoreToServer(score: self.score) { success in
            if success {
                print("Score envoyé avec succès.")
                DispatchQueue.main.async {
                    self.navigateToScoreboard = true // Déclenche la navigation vers la vue Scoreboard
                }
            } else {
                print("Échec de l'envoi du score.")
            }
        }
        
    }
}
