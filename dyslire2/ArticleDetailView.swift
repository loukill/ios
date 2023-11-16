//
//  ArticleDetailView.swift
//  dyslire2
//
//  Created by Mac Mini 10 on 13/11/2023.
//

import SwiftUI

struct ArticleDetailView: View {
    var article: Article
    @ObservedObject var viewModel: ArticleViewModel
   

    var body: some View {
                VStack {
                    Text(article.title)
                        .font(.title)
                        .padding()
            Image ("13")
                .resizable()
                .frame(width: 300, height: 400)
            
                .padding()
        
            HStack {
                Button(action: {
                    // Action pour gérer le bouton "Like"
                    if let index = viewModel.articles.firstIndex(where: { $0.id == article.id }){
                        var updatedArticle = viewModel.articles[index]
                        updatedArticle.likes += 1
                        viewModel.articles [index] = updatedArticle
                    }
                   
                }) {
                    Image(systemName: "hand.thumbsup.fill")
                }
                Text("Likes: \(article.likes)")
                Button(action: {
                    // Action pour gérer le bouton "Dislike"
                    if let index = viewModel.articles.firstIndex(where: { $0.id == article.id }){
                        var updatedArticle = viewModel.articles[index]
                        updatedArticle.dislikes += 1
                        viewModel.articles [index] = updatedArticle}
                })
                    {
                    Image(systemName: "hand.thumbsdown.fill")
                }
                Text("Dislikes: \(article.dislikes)")
                NavigationLink(destination: ArticleCellView(article: article, viewModel: viewModel),
                               label: {
                    Text("Commentaires: \(article.comments.count)")
                }
                )
            }
        }
        .navigationBarTitle(article.title)
    }
}
struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View{
        ArticleDetailView(article: Article(id: UUID(), title: "sAMPLE ARATICLE" , content: "Simple Article" , likes: 5, dislikes: 2, comments: ["Comment 1", "comment2"]), viewModel:ArticleViewModel())
    }
}
  

