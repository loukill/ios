//
//  ApiService.swift
//  Furniture_app
//
//  Created by mohamed loukil on 20/11/2023.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    func fetchCategories(completion: @escaping ([Category]) -> Void) {
        guard let url = URL(string: "http://localhost:3000/category") else {
            print("URL invalide")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Category].self, from: data) {
                    DispatchQueue.main.async {
                        completion(decodedResponse)
                        print("Catégories chargées avec succès : \(decodedResponse)")
                    }
                    return
                }else {
                    print("Échec du décodage : \(String(data: data, encoding: .utf8) ?? "")")
                    // Pour obtenir des informations plus détaillées sur l'erreur
                    do {
                        _ = try JSONDecoder().decode([Category].self, from: data)
                    } catch {
                        print(error)
                    }
                }
            }
            print("Échec de la récupération : \(error?.localizedDescription ?? "Erreur inconnue")")
        }.resume()
    }
    
    func fetchTextCategory(completion: @escaping ([TextCategory]) -> Void) {
        guard let url = URL(string: "http://localhost:3000/txtCategory") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Network error: \(error?.localizedDescription ?? "")")
                return
            }
            do {
                let items = try JSONDecoder().decode([TextCategory].self, from: data)
                DispatchQueue.main.async {
                    completion(items)
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    func fetchTexts(completion: @escaping ([Texte]) -> Void) {
        guard let url = URL(string: "http://localhost:3000/text") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Network error: \(error?.localizedDescription ?? "")")
                return
            }
            do {
                let textes = try JSONDecoder().decode([Texte].self, from: data)
                DispatchQueue.main.async {
                    completion(textes)
                }
            } catch {
                print("Decoding error: \(error)")
            }
        }.resume()
    }
    
    func sendScoreToServer(score: Int, completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "http://localhost:3000/matchScore") else {
            print("URL invalide")
            completion(false)
            return
        }
        
        let dateFormatter = ISO8601DateFormatter()
        let dateString = dateFormatter.string(from: Date())
        
        let body: [String: Any] = ["score": score, "date": dateString]
        guard let finalBody = try? JSONSerialization.data(withJSONObject: body) else {
            print("Erreur lors de la sérialisation JSON")
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Erreur réseau : \(error?.localizedDescription ?? "")")
                completion(false)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 {
                print("Score envoyé avec succès")
                completion(true)
            } else {
                print("Réponse invalide du serveur")
                completion(false)
            }
        }.resume()
    }
    
    func fetchScores(completion: @escaping ([Score]) -> Void) {
        guard let url = URL(string: "http://localhost:3000/matchScore") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            let responseString = String(data: data, encoding: .utf8)
                print("Response: \(responseString ?? "No data")")

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.customDateFormatter)
                let scores = try decoder.decode([Score].self, from: data)
                DispatchQueue.main.async {
                    completion(scores)
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
            }
        }

        task.resume()
    }


}
