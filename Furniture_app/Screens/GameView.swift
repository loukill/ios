import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = GameViewModel()

    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("🌊Ocean Memory🌊")
                    .font(.largeTitle)

                LazyVGrid(columns: viewModel.fourColumnGrid, spacing: 10) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card,
                                 width: Int(geo.size.width / 4 - 10),
                                 viewModel: viewModel)
                    }
                }
                
                VStack {
                    Text("Match these cards to win:")
                    LazyVGrid(columns: viewModel.sixColumnGrid, spacing: 5) {
                        ForEach(cardValues, id: \.self) { cardValue in
                            if !viewModel.matchedCards.contains(where: { $0.text == cardValue }) {
                                Text(cardValue)
                                    .font(.system(size: 40))
                            }
                        }
                    }
                }
                .fullScreenCover(isPresented: $viewModel.navigateToGameOver) {
                            GameOverView(onDismiss: {
                                // This closure is called when GameOverView is dismissed
                                self.presentationMode.wrappedValue.dismiss()
                            })
                        }
            }
        }
        .padding()
        
    }
}

