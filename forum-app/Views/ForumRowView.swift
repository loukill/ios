import SwiftUI

struct ForumRowView: View {
    var forum: Forum
    var viewModel: ForumListViewModel
    var forumDetailsViewModel: ForumDetailsViewModel

    var body: some View {
        HStack {
            // Affiche l'image du forum
            Image(systemName: "photo") // Remplace cela par la logique réelle pour afficher l'image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .cornerRadius(8)
                .padding(.trailing, 10)

            VStack(alignment: .leading) {
                // Affiche les détails du forum (titre, description, etc.)
                Text(forum.title)
                    .font(.headline)
                    .lineLimit(1) // Limite le nombre de lignes pour éviter un débordement

                Text(forum.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2) // Limite le nombre de lignes pour éviter un débordement

                // Affiche la date de publication du forum
                Text("Publié le: \(formattedDate(forum.publicationDate))")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            // Ajoutez un bouton "Modifier"
            NavigationLink(destination: ModifyForumView(forum: forum, isPresented: .constant(viewModel.isPresented))) {
                Image(systemName: "pencil")
                    .foregroundColor(.blue)
            }
            .padding(.trailing, 10)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .shadow(radius: 5)
        )
        .padding([.top, .horizontal])
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
