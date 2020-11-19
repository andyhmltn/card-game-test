//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Andy Hamilton on 31/10/2020.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var game: EmojiMemoryGame

    var body: some View {
        HStack {
            ForEach(game.cards) { card in
                CardView(card: card, smallText: game.cards.count > 5).onTapGesture {
                    game.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card;
    var smallText = false

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).strokeBorder(lineWidth: 3)
                
                let fontSize = smallText ? Font.title : Font.largeTitle

                Text(card.content).font(fontSize)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        .aspectRatio(0.75, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(game: EmojiMemoryGame())
    }
}
