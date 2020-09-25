//
//  ContentView.swift
//  Memorize
//
//  Created by Viktor Shurapov on 5/29/20.
//  Copyright © 2020 Viktor Shurapov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var emojiMemoryGame: EmojiMemoryGame
    var body: some View {
        HStack {
            ForEach(emojiMemoryGame.cards) { card in
                CardView(card: card).onTapGesture {
                    self.emojiMemoryGame.choose(card: card)
                }
            }
        }
        .foregroundColor(.orange)
        .padding() 
        .font(emojiMemoryGame.cards.count / 2 > 4 ? .callout : .largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiMemoryGame: EmojiMemoryGame())
    }
}
