//

//  forum-app
//
//  Created by macbook on 22/11/2023.
//
//  User.swift
import Foundation
struct User: Identifiable, Hashable {
    var id: String
    var name: String
    var username: String  // Ajoute une propriété pour le nom d'utilisateur

    init(id: String, name: String, username: String) {
        self.id = id
        self.name = name
        self.username = username
    }
}
