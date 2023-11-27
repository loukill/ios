import SwiftUI
struct ModifyForumView: View {
    @EnvironmentObject var viewModel: ForumListViewModel
    @Binding var isPresented: Bool  // Changez le type à Binding<Bool>
    var forum: Forum

    @State private var title: String
    @State private var description: String
    @State private var image: String

    init(forum: Forum, isPresented: Binding<Bool>) {
        self.forum = forum
        self._isPresented = isPresented
        self._title = State(initialValue: forum.title)
        self._description = State(initialValue: forum.description)
        self._image = State(initialValue: forum.image)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Détails du Forum")) {
                    TextField("Titre", text: $title)
                    TextField("Description", text: $description)
                    TextField("Image URL", text: $image)
                }

                Button("Modifier le Forum") {
                    viewModel.updateForum(forumID: forum.id, newTitle: title, newDescription: description, newImage: image)
                    $isPresented.wrappedValue = false  // Utilisez wrappedValue pour accéder à la valeur de la liaison
                }
            }
            .navigationBarTitle("Modifier le Forum")
        }
    }
}
