//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Andy Hamilton on 31/10/2020.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame

    var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100))
    ]

    var body: some View {
        VStack {
            Menu("Choose theme") {
                ForEach(game.themes) { theme in
                    Button(action: { game.changeTheme(theme: theme) }) {
                        Text(theme.name)
                    }
                }
            }
                .font(.subheadline)
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(game.cards) { card in
                    CardView(card, allCardsMatched: game.allCardsMatched).onTapGesture {
                        withAnimation {
                            game.choose(card: card)
                        }
                    }
                        .aspectRatio(cardAspectRatio, contentMode: .fit)
                }
            }
                .padding()
                .foregroundColor(game.selectedTheme.colour)
            Button(action: {
                withAnimation {
                    game.resetGame()
                }
            }) {
                Text("Mr dealer hit me with that shuff 😎")
            }
        }
    }
    
    // MARK: - Drawing Constants
    var cardAspectRatio: CGFloat = 2/3
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        game.choose(card: game.cards[2])

        return EmojiMemoryGameView(game: game)
    }
}
