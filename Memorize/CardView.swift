//
//  CardView.swift
//  Memorize
//
//  Created by Andy Hamilton on 12/11/2020.
//

import SwiftUI

struct CardView: View, Animatable {
    var card: MemoryGame<String>.Card;
    var allCardsMatched: Bool;

    var body: some View {
        GeometryReader { geometry in
                ZStack(alignment: .center) {
                    Pie(
                        startAngle: Angle.degrees(-90),
                        endAngle: Angle.degrees(110-90),
                        clockwise: true
                    )
                        .opacity(0.3)
                        .frame(
                            width: 100,
                            height: 100,
                            alignment: .trailing
                        )
                    Text(card.content)
                        .scaleEffect(
                            x: card.isMatched ? 1.5 : 1,
                            y: card.isMatched ? 1.5 : 1
                        )
                        .rotationEffect(.degrees(card.isMatched ? 720 : 0))
                        .transition(.scale)
                }
                    .cardify(isFaceUp: card.isFaceUp || allCardsMatched)
                    .font(Font.system(size: fontSize(for: geometry.size)))
                    .opacity(card.isFaceUp || !card.isMatched || allCardsMatched ? 1 : 0)
        }
    }
    
    init(_ card: MemoryGame<String>.Card, allCardsMatched: Bool) {
        self.card = card
        self.allCardsMatched = allCardsMatched
    }
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.6
    }
}
