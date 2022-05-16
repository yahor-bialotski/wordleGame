//
//  keyboardButtonView.swift
//  wordleGame
//
//  Created by lll on 28.04.22.
//

import Foundation
import UIKit

class KeyboardButtonView: UIView {
    var keyboardButton: KeyboardButton?
    
    @IBOutlet var buttonView: UIView!
    @IBOutlet weak var buttonLabel: UILabel!
    
    
    func updateButton(keyboardButton: KeyboardButton) {
        updateButtonBackground(symbolColor: keyboardButton.symbolColor)
        updateButtonLabel(symbol: keyboardButton.symbol)
    }
    
    private func updateButtonLabel(symbol: ButtonStatus) {
        switch symbol {
        case .pressEnter:
            buttonLabel.text = "Enter"
            
        case .pressDelete:
            buttonLabel.text = "<-"
            
        case .pressSymbol(let string):
            buttonLabel.text = string
        }
    }
    
    private func updateButtonBackground(symbolColor: CheckStatus?) {
        switch symbolColor {
        case .wrongLetter:
            buttonView.backgroundColor = .darkGray
            
        case .rightLetter:
            buttonView.backgroundColor = .yellow
            
        case .rightFilledLetter:
            buttonView.backgroundColor = .green
            
        default:
            buttonView.backgroundColor = .lightGray
        }
    }
}
