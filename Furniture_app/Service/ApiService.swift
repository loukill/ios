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
    
  
           
}
