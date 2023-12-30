import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = GameViewModel()
    @Binding var isTabBarPresented: Bool

    var body: some View {
        GeometryReader { geo in
            VStack {
                
                Text(timerString(from: viewModel.gameTimer))
                    .font(.headline)
                    .padding()
                
                LazyVGrid(columns: viewModel.fourColumnGrid, spacing: 10) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card,
                                 width: Int(geo.size.width / 4 - 10),
                                 viewModel: viewModel)
                    }
                }
                .padding()
                .fullScreenCover(isPresented: $viewModel.navigateToScoreboard) {
                    // Passer l'instance viewModel à ScoreboardView
                    ScoreboardView(isTabBarPresented: $isTabBarPresented, viewModel: viewModel)
                }

                Spacer()
            }
            .navigationBarTitle("🌊Ocean Memory🌊", displayMode: .inline)
            .onAppear {
                viewModel.startTimer() // Démarre le timer lorsque la vue apparaît
            }
            .onDisappear {
                viewModel.stopTimer() // Arrête le timer lorsque la vue disparaît
            }
        }
    }
    
    func timerString(from totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
