import SwiftUI

struct TextLectureView: View {
    @StateObject var viewModel = TextViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.textes) { texte in
                    NavigationLink(destination: TextDetailView(texte: texte, viewModel: viewModel)) {
                        VStack(alignment: .leading) {
                            Text(texte.contenu)
                                .font(.headline)
                            Text("Created on \(texte.dateCreation.formatDate())")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationBarTitle("Text Lecture")
            .onAppear {
                viewModel.fetchTextes()
            }
        }
    }
}

// Date formatting extension for iOS versions prior to 15.0
extension Date {
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
}
