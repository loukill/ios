//
//  ArticleCellView.swift
//  dyslire2
//
//  Created by Mac Mini 10 on 13/11/2023.
//

import SwiftUI


struct ArticleCellView: View {
    @State var isLiked = false
    @State var isDisliked = false
    var article: Article
    @ObservedObject var viewModel: ArticleViewModel

    var body: some View {
        VStack {
            Image ("12")
                .resizable()
                .frame(width: 300, height: 400)
                .aspectRatio(contentMode: .fill)
            
            
            HStack {
                Button(action: {
                    isLiked.toggle()
                    if isLiked {
                        if let index = viewModel.articles.firstIndex(where: { $0.id == article.id }) {
                            viewModel.articles[index].likes += 1
                        }
                    } else {
                        if let index = viewModel.articles.firstIndex(where: { $0.id == article.id }) {
                            viewModel.articles[index].likes -= 1
                        }
                    }
                }) {
                    Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                }
                Text("Likes: \(article.likes)")
                Button(action: {
                    isDisliked.toggle()
                    if isDisliked {
                        if let index = viewModel.articles.firstIndex(where: { $0.id == article.id }) {
                            viewModel.articles[index].dislikes += 1
                        }
                    } else {
                        if let index = viewModel.articles.firstIndex(where: { $0.id == article.id }) {
                            viewModel.articles[index].dislikes -= 1
                        }
                    }
                }) {
                    Image(systemName: isDisliked ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                }
                Text("Dislikes: \(article.dislikes)")
                NavigationLink(
                    destination: ArticleDetailView(article: article, viewModel: viewModel),
                    label: {
                        Text("Comment (\(article.comments.count))")
                    }
                )
            }
        }
    }
}

            
                           
    struct articleCellView:View {
    var article: Article
    @ObservedObject var viewModel: ArticleViewModel

    var body: some View {
        // Add your comment view content here
        Text("Comments for \(article.title)")
    }
}
                     
