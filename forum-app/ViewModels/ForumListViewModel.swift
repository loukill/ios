// ForumListViewModel.swift

import Foundation
import Combine

class ForumListViewModel: ObservableObject {
    @Published var forums: [Forum] = []
    @Published var isCreatingForum: Bool = false
    @Published var forumToUpdate: Forum? = nil
    @Published var isPresented: Bool = false

    
    // Ajoute d'autres propriétés ou méthodes en fonction des besoins

    init() {
        let userJohn = User(id: UUID().uuidString, name: "John Doe", username: "john_doe")
        let userJane = User(id: UUID().uuidString, name: "Jane Doe", username: "jane_doe")
        let forum1 = Forum(id: UUID(), title: "Forum 1", description: "Description du forum 1", image: "image1", publicationDate: Date(), author: userJohn)
        let forum2 = Forum(id: UUID(), title: "Forum 2", description: "Description du forum 2", image: "image2", publicationDate: Date(), author: userJane)

        // Initialise la liste des forums avec des données par défaut
        forums = [forum1, forum2]
    }

    func createForum(title: String, description: String, image: String) {
        let newForum = Forum(id: UUID(), title: title, description: description, image: image, publicationDate: Date(), author: User(id: UUID().uuidString, name: "John Doe", username: "john_doe"))
        forums.append(newForum)
    }

    func updateForum(forumID: UUID, newTitle: String, newDescription: String, newImage: String) {
        if let index = forums.firstIndex(where: { $0.id == forumID }) {
            forums[index].title = newTitle
            forums[index].description = newDescription
            forums[index].image = newImage
        }
    }

    func deleteForum(forumID: UUID) {
        forums.removeAll { $0.id == forumID }
    }

    // Ajoute d'autres méthodes pour les fonctionnalités supplémentaires
}
