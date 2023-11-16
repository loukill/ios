//
//  ContentView.swift
//  dyslire2
//
//  Created by Mac Mini 10 on 13/11/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var articleViewModel = ArticleViewModel()

    var body: some View {
        NavigationView {
            List(articleViewModel.articles) { article in
                NavigationLink(destination: ArticleDetailView(article: article, viewModel:articleViewModel)) {
                    ArticleCellView(article: article, viewModel: articleViewModel)
                        .background(Color.orange)
                }
            }
            .navigationBarTitle("Article List")
            .background(Color.orange)
            .foregroundColor(.white)
        }
        .accentColor(.white)
    }
}

struct
  contentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
