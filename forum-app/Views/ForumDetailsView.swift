import SwiftUI

struct ForumDetailsView: View {
    @ObservedObject var viewModel: ForumDetailsViewModel
    var forum: Forum
    @State private var newCommentText = ""

    var body: some View {
        VStack {
            // Afficher les détails du forum ici
            Text(forum.title)
                .font(.title)

            Text(forum.description)
                .padding()

            // Afficher la note
            HStack {
                Image(systemName: "heart.fill")
                Text("\(viewModel.rating.likes)")
                Image(systemName: "hand.thumbsdown.fill")
                Text("\(viewModel.rating.dislikes)")
            }
            .padding()

            // Afficher les commentaires
            List {
                ForEach(viewModel.comments, id: \.id) { commentaire in
                    CommentView(comment: commentaire)
                }
            }

            // Ajouter un commentaire
            TextEditor(text: $newCommentText)
                .frame(minHeight: 100)
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)

            Button("Ajouter un commentaire") {
                viewModel.addComment(text: newCommentText, author: nil)
                newCommentText = ""
            }
            .padding()

            // Ajouter la fonctionnalité de notation
            HStack {
                Button(action: {
                    viewModel.like()
                }) {
                    Image(systemName: "heart.fill")
                    Text("\(viewModel.rating.likes)")
                }
                .padding()

                Button(action: {
                    viewModel.dislike()
                }) {
                    Image(systemName: "hand.thumbsdown.fill")
                    Text("\(viewModel.rating.dislikes)")
                }
                .padding()
            }
        }
        .padding()
        .navigationBarTitle(forum.title)
    }
}
