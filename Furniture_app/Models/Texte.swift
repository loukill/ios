//
//  Texte.swift
//  Furniture_app
//
//  Created by mohamed loukil on 22/11/2023.
//

import Foundation

struct Texte: Codable, Identifiable {
    var id: String
    var titre: String
    var contenu: String
    var txtCategoryId: String?
    var dateCreation: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case titre = "title"
        case contenu
        case txtCategoryId = "nomDeLaCleDansLeJSON"
        case dateCreation
    }
}
