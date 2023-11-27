//
//  CommentView.swift
//  forum-app
//
//  Created by macbook on 23/11/2023.
//

import Foundation
import SwiftUI
struct CommentView: View {
    var comment: Commentaire

    var body: some View {
        VStack(alignment: .leading) {
            Text(comment.author.name)
                .font(.headline)
            Text(comment.text)
                .padding(.leading, 10)
            Text(comment.date, style: .date)
                .font(.caption)
        }
    }
}
