//
//  ArticleViewModel.swift
//  dyslire2
//
//  Created by Mac Mini 10 on 13/11/2023.
//

import Foundation

class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = []
    
  
    init() {
        self.articles = [
            Article(id: UUID(), title: "Article 1", content: "Contenu de l'article 1", likes: 0, dislikes: 0, comments: []),
            Article(id: UUID(), title: "Article 2", content: "Contenu de l'article 2", likes: 0, dislikes: 0, comments: []),
            ]
    }
    
}
