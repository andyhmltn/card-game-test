//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Andy Hamilton on 08/11/2020.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    private static var themes: [GameTheme<String>] = [
        GameTheme("Dark mode", content: ["🦾", "🦉", "🦥", "🎱"], colour: .gray),
        GameTheme("Halloween", content: ["😄", "🤪", "👻", "👀"], colour: .orange)
    ];

    @Published private var game: MemoryGame<String> = EmojiMemoryGame.initialiseGame();

    static func createMemoryGame(themes: [GameTheme<String>], selectedTheme: GameTheme<String>?) -> MemoryGame<String> {
        return MemoryGame<String>(
            themes: themes,
            selectedTheme: selectedTheme
        )
    }
    
    static func initialiseGame(selectedTheme: GameTheme<String>? = nil) -> MemoryGame<String> {
        return EmojiMemoryGame.createMemoryGame(themes: EmojiMemoryGame.themes, selectedTheme: selectedTheme)
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    var themes: [GameTheme<String>] {
        game.themes
    }
    
    var selectedTheme: GameTheme<String> {
        game.selectedTheme
    }
    
    var allCardsMatched: Bool {
        game.allCardsMatched
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
    
    func changeTheme(theme: GameTheme<String>) {
        game.changeTheme(theme: theme)
        objectWillChange.send()
    }
    
    func resetGame() {
        game = EmojiMemoryGame.initialiseGame(selectedTheme: game.selectedTheme);
    }
}
