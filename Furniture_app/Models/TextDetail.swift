//
//  TextDetail.swift
//  Furniture_app
//
//  Created by mohamed loukil on 22/11/2023.
//

import Foundation

struct TextDetail: Identifiable, Decodable {
    var id: String
    var cotenu: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case contenu
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        contenu = try container.decode(String.self, forKey: .contenu)
    }
}
