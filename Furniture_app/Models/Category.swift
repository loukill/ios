//
//  Category.swift
//  Furniture_app
//
//  Created by mohamed loukil on 20/11/2023.
//

import Foundation

struct Category: Decodable, Identifiable {
    var id: String
    var title: String
    var imageUrl: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageUrl = "image"
    }
}
