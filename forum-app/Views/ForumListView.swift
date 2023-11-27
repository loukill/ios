import SwiftUI
struct ForumListView: View {
    @EnvironmentObject var viewModel: ForumListViewModel
    @StateObject var forumDetailsViewModel = ForumDetailsViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.forums) { forum in
                    NavigationLink(destination: ForumDetailsView(viewModel: forumDetailsViewModel, forum: forum)) {
                        ForumRowView(forum: forum, viewModel: viewModel, forumDetailsViewModel: forumDetailsViewModel)

                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            viewModel.deleteForum(forumID: forum.id)
                        } label: {
                            Label("Supprimer", systemImage: "trash")
                        }
                    }
                }
            }
            .navigationBarTitle("Liste des Forums")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing:
                Button(action: {
                    viewModel.isCreatingForum = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            )
            .onAppear {
                // Configurer l'apparence de la barre de navigation ici
                UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
                UINavigationBar.appearance().shadowImage = UIImage()
                UINavigationBar.appearance().prefersLargeTitles = false

                // Optionnel : Configurer la couleur du texte de la barre de navigation
                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
                UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            }
        }
        .sheet(isPresented: $viewModel.isCreatingForum) {
            CreateForumView(forumToUpdate: $viewModel.forumToUpdate)
                .environmentObject(viewModel)
        }
    }
}
