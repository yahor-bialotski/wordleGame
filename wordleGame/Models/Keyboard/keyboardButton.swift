//
//  keyboardButton.swift
//  wordleGame
//
//  Created by lll on 27.04.22.
//

import Foundation

struct KeyboardButton {
    let symbol: ButtonStatus
    let symbolColor: CheckStatus?
}

enum ButtonStatus {
    case pressEnter
    case pressDelete
    case pressSymbol(String)
}
    
