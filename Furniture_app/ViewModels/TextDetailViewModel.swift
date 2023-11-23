//
//  TextDetailViewModel.swift
//  Furniture_app
//
//  Created by mohamed loukil on 20/11/2023.
//

import Foundation
import Combine
import AVFoundation

class TextDetailViewModel: ObservableObject {
    @Published var textes: [Texte] = []
    @Published var texte: Texte?
    @Published var selectedTextId: String?
    @Published var texteAudioUrl: String = ""
    var audioPlayer: AVPlayer?
    
    func fetchTextByCategoryId(_ categoryId: String) {
        print("Fetching text for categoryId: \(categoryId)")
        guard let url = URL(string: "http://localhost:3000/text/parCategorie/\(categoryId)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(Texte.self, from: data)
                    DispatchQueue.main.async {
                        self?.texte = decodedResponse
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func fetchAllTextes() {
        let url = URL(string: "http://localhost:3000/text")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let textes = try JSONDecoder().decode([Texte].self, from: data)
                    DispatchQueue.main.async {
                        self.textes = textes
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                    print("Received data: \(String(data: data, encoding: .utf8) ?? "Invalid data")")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }.resume()
    }
    
    
    func fetchAudioUrlForCategory(categoryId: String) {
        guard let url = URL(string: "http://localhost:3000/text/synthese/parCategorie/\(categoryId)") else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let data = data {
                do {
                    // Décoder la réponse JSON pour obtenir l'URL audio
                    let response = try JSONDecoder().decode([String: String].self, from: data)
                    if let audioUrlStr = response["audioUrl"], let audioUrl = URL(string: audioUrlStr) {
                        DispatchQueue.main.async {
                            self?.texteAudioUrl = audioUrlStr
                            self?.audioPlayer = AVPlayer(url: audioUrl)
                            self?.audioPlayer?.play()
                        }
                    }
                } catch {
                    print("Failed to decode JSON or play audio: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            }
        }.resume()
    }

  
}
