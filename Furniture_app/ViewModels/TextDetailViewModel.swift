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
    
    func fetchTextById(_ textId: String) {
        print("Fetching text for text ID: \(textId)")
        let timestamp = Date().timeIntervalSince1970
        guard let url = URL(string: "http://localhost:3000/text/\(textId)?timestamp=\(timestamp)") else {
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
    
    
    func fetchAudioUrlForCategory(textId: String) {
        guard let url = URL(string: "http://localhost:3000/text/synthese/parTexte/\(textId)") else { return }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            if let data = data {
                do {
                    // Decode the response as a dictionary
                    if let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let audioUrls = jsonDict["audioUrls"] as? [String] {
                        // Check if there are any audio URLs in the array
                        if !audioUrls.isEmpty {
                            // Play the audio chunks one after the other
                            self?.playAudioChunks(audioUrls)
                        } else {
                            print("No audio URLs found in the response.")
                        }
                    } else {
                        print("Failed to extract audio URLs from the response.")
                    }
                } catch {
                    print("Failed to decode JSON or play audio: \(error)")
                }
            } else if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
            }
        }.resume()
    }


    private func playAudioChunks(_ audioUrls: [String]) {
        // Iterate through the audio URLs and play them sequentially
        for audioUrlStr in audioUrls {
            if let audioUrl = URL(string: audioUrlStr) {
                let playerItem = AVPlayerItem(url: audioUrl)
                let audioPlayer = AVPlayer(playerItem: playerItem)
                audioPlayer.play()
                
                // Wait for the current chunk to finish playing before playing the next one
                while audioPlayer.rate != 0 { /* Wait */ }
            }
        }
    }
}
