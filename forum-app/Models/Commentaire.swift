//
//  Commentaire.swift
//  forum-app
//
//  Created by macbook on 22/11/2023.
//
//  Commentaire.swift
import Foundation
struct Commentaire {
    var id: UUID
    var text: String
    var author: User // Assure-toi d'avoir un modèle User comme décrit précédemment
    var date: Date
    // Ajoute d'autres propriétés selon tes besoins
}
