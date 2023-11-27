import Foundation

class ForumDetailsViewModel: ObservableObject {
    @Published var forum: Forum? // Ajoute cette propriété
    @Published var comments: [Commentaire] = []
    @Published var rating: Rating = Rating(likes: 0, dislikes: 0)

    // Méthode pour ajouter un commentaire
    func addComment(text: String, author: User?) {
        guard let author = author else {
            // Gère le cas où l'auteur est manquant (peut-être dans le cas d'un commentaire anonyme)
            return
        }

        let newComment = Commentaire(id: UUID(), text: text, author: author, date: Date())
        comments.append(newComment)
    }

    // Méthodes pour gérer les likes et dislikes
    func like() {
        rating.likes += 1
    }

    func dislike() {
        rating.dislikes += 1
    }
    
    // Mettre à jour la fonction pour définir le forum
    func setForum(_ forum: Forum) {
        self.forum = forum
    }
}
