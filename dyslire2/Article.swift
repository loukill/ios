//
//  Article.swift
//  dyslire2
//
//  Created by Mac Mini 10 on 13/11/2023.
//


import SwiftUI
import Foundation

struct article: Identifiable {
    let id: UUID
    let name: String
    let date: Date
    let author: String
}
