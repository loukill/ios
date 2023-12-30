//
//  Score.swift
//  Furniture_app
//
//  Created by mohamed loukil on 30/12/2023.
//

import Foundation

struct Score: Identifiable, Decodable {
    let id: String
    var points: Int
    var date: String // Modifiez ce champ pour qu'il soit une String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case points = "score"
        case date
    }

    // Vous n'avez plus besoin de l'init personnalisé si vous n'effectuez pas de traitement particulier sur les champs
}


