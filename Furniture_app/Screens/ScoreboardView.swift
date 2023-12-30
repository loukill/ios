    import SwiftUI

    struct ScoreboardView: View {
        @ObservedObject var viewModel: GameViewModel
        @Environment(\.presentationMode) var presentationMode
        @Binding var isTabBarPresented: Bool
        
        init(isTabBarPresented: Binding<Bool>, viewModel: GameViewModel) {
               self._isTabBarPresented = isTabBarPresented
               self.viewModel = viewModel
           }

        var body: some View {
                NavigationView {
                    List(viewModel.allScores) { score in
                        HStack {
                            Text("\(score.points) points").font(.headline)
                            Spacer()
                            if let date = dateFormatter.date(from: score.date) {
                                               Text(dateFormatter.string(from: date))
                                                   .font(.subheadline)
                                                   .foregroundColor(.gray)
                                           } else {
                                               Text("Date invalide")
                                           }
                        }
                        .padding(.vertical, 8)
                    }
                    .navigationBarTitle("Tableau des Scores", displayMode: .inline)
                    .onAppear {
                        viewModel.loadScores()
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "arrow.left")
                                Text("Retour")
                            }
                        }
                    }
                    
                    
                }
            }
        }

        private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy 'à' HH:mm"
            return formatter
        }()

