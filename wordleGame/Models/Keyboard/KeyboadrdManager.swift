//
//  KeyboadrdManager.swift
//  wordleGame
//
//  Created by lll on 3.05.22.
//

import Foundation

struct KeyboardManager {
    let keyboardSymbols: [[KeyboardButton]]
    
    init() {
        let letters = [
            ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
            ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
            ["z", "x", "c", "v", "b", "n", "m"]
        ]

        self.keyboardSymbols = letters.enumerated().map { index, row in
                let symbolsRow = row.map { character in KeyboardButton(symbol: .character(character), symbolColor: nil) }

                if index == letters.count - 1 {
                    return [KeyboardButton(symbol: .enter, symbolColor: nil)] + symbolsRow + [KeyboardButton(symbol: .delete, symbolColor: nil)]
                }
                    
                return symbolsRow
            }
    }
}
