//
//  MemoryGame.swift
//  Memorize
//
//  Created by Andy Hamilton on 08/11/2020.
//

import Foundation

struct MemoryGame<Content> where Content: Equatable {
    private(set) var cards: Array<Card>
    private(set) var themes: [GameTheme<Content>];
    private(set) var selectedTheme: GameTheme<Content>;
    
    var allCardsMatched: Bool {
        for card in cards {
            if !card.isMatched {
                return false
            }
        }
        
        return true
    }

    var indexOfFaceUpCard: Int? {
        get {
            let faceUpCardIndeces = cards.indices.filter { cards[$0].isFaceUp }
            
            return faceUpCardIndeces.count == 1 ? faceUpCardIndeces.first : nil
        }

        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("User chose card: \(card)")
        
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }

                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfFaceUpCard = chosenIndex
            }
        }
    }
    
    mutating func changeTheme(theme: GameTheme<Content>) {
        selectedTheme = theme
        drawCards()
    }
    
    mutating func drawCards() {
        cards = Array<Card>()
        
        for pairIndex in 0..<selectedTheme.numberOfPairsOfCards {
            let content = selectedTheme.content[pairIndex]
            
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        
        cards.shuffle()
    }
    
    init(themes: [GameTheme<Content>], selectedTheme: GameTheme<Content>? = nil) {
        self.cards = Array<Card>()
        self.themes = themes
        self.selectedTheme = selectedTheme ?? themes[0]
        
        drawCards()
    }
    
    struct Card: Identifiable {
        var content: Content
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var id: Int
        
        // MARK: - Bonus Time
        var bonusTimeLimit: TimeInterval = 6;
        
        // The time when the card was last put face up
        var lastFaceUpDate: Date?
        var totalFaceUpTime: TimeInterval = 0
        
        // How long the card has been face up
//        private var faceUpTime: TimeInterval {
//            if let lastFaceUpDate = self.lastFaceUpDate {
//                
//            } else {
//                return totalFaceUpTime
//            }
//        }
    }
}
