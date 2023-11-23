//
//  Texte.swift
//  Furniture_app
//
//  Created by mohamed loukil on 22/11/2023.
//

import Foundation

struct Texte: Codable, Identifiable {
    var id: String
    var contenu: String
    var dateCreation: Date?
    
    enum CodingKeys: String, CodingKey {
           case id = "_id" // ou le nom de clé approprié
           case contenu
           
       }
}
