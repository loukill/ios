//

//  forum-app
//
//  Created by macbook on 23/11/2023.
//
//  Rating.swift
import Foundation
struct Rating {
    var likes: Int
    var dislikes: Int
    var total: Int { likes - dislikes }
}
