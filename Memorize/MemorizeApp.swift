//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Andy Hamilton on 31/10/2020.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: EmojiMemoryGame())
        }
    }
}
