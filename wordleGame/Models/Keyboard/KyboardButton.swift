//
//  keyboardButton.swift
//  wordleGame
//
//  Created by lll on 27.04.22.
//

import Foundation

struct KeyboardButton {
    let symbol: KeyboardSymbol
    let symbolColor: CheckStatus?
}

enum KeyboardSymbol: Equatable {
    case enter
    case delete
    case character(String)
}
