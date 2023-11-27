//
//
//  forum-app
//
//  Created by macbook on 22/11/2023.
//Forum.swift

import Foundation
struct Forum: Identifiable, Hashable {
    var id: UUID
    var title: String
    var description: String
    var image: String
    var publicationDate: Date
    var author: User  // Ajoute une propriété pour l'auteur

    init(id: UUID, title: String, description: String, image: String, publicationDate: Date, author: User) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.publicationDate = publicationDate
        self.author = author
    }
}


