//
//  GameTheme.swift
//  Memorize
//
//  Created by Andy Hamilton on 09/11/2020.
//

import SwiftUI

struct GameTheme<Content>: Identifiable {
    var name: String;
    var content: [Content];
    var colour: Color;
    var id: String;

    var numberOfPairsOfCards: Int {
        content.count;
    }
    
    init(_ name: String, content: [Content], colour: Color) {
        self.name = name
        self.id = name
        self.content = content
        self.colour = colour
    }
}
