import SwiftUI

struct CardView: View {
    @ObservedObject var card: Card
    let width: Int
    var viewModel: GameViewModel  // Reference to the ViewModel

    var body: some View {
        if viewModel.isCardMatched(card) {
            // Render an empty or transparent view for matched cards
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: CGFloat(width), height: CGFloat(width))
        } else {
            content
                .onTapGesture {
                    viewModel.processTapOnCard(card)
                }
        }
        
    }

    var content: some View {
        Group {
            if viewModel.isCardFlipped(card) {
                Text(card.text)
            } else {
                Text("?")
            }
        }
        .font(.system(size: 50))
        .padding()
        .frame(width: CGFloat(width), height: CGFloat(width))
        .background(Color(red: 0.68, green: 0.83, blue: 0.96))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 0.18, green: 0.32, blue: 0.46), lineWidth: 5)
        )
    }
}

