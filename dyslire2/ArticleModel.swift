//
//  ArticleModel.swift
//  dyslire2
//
//  Created by Mac Mini 10 on 13/11/2023.
//

import Foundation
struct Article : Identifiable, Decodable {
    var id = UUID()
    var title: String
    var content: String
    var likes: Int
    var dislikes: Int
    var comments: [String]
}
