//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Viktor Shurapov on 6/4/20.
//  Copyright © 2020 Viktor Shurapov. All rights reserved.
//

import Foundation

class EmojiMemoryGame {
    private var memoryGame: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷"].shuffled()
        let numberOfPairs = Int.random(in: 2...emojis.count)
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairs) { pairIndex in
           return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        memoryGame.cards
    }
    
   // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        memoryGame.choose(card: card)
    }
}
