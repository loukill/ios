import SwiftUI

struct CreateForumView: View {
    @EnvironmentObject var viewModel: ForumListViewModel
    @Binding var forumToUpdate: Forum?

    @State private var title = ""
    @State private var description = ""
    @State private var image = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Détails du Forum")) {
                    TextField("Titre", text: $title)
                    TextField("Description", text: $description)
                    TextField("Image URL", text: $image)
                }

                Button("Créer le Forum") {
                    if let forumToUpdate = forumToUpdate {
                        // Mettre à jour le forum existant
                        viewModel.updateForum(forumID: forumToUpdate.id, newTitle: title, newDescription: description, newImage: image)
                    } else {
                        // Créer un nouveau forum
                        viewModel.createForum(title: title, description: description, image: image)
                    }

                    // Fermer la vue de création
                    viewModel.isCreatingForum = false
                }
            }
            .navigationBarTitle("Créer un Forum")
        }
    }
}
