//
//  keyboardButtonView.swift
//  wordleGame
//
//  Created by lll on 28.04.22.
//

import Foundation
import UIKit

class KeyboardButtonView: CustomKeyboardBoxButton {
    private var keyboardButton: KeyboardButton!
    
    var delegate: KeyboardButtonDelegate?
    
    init(keyboardButton: KeyboardButton) {
        self.keyboardButton = keyboardButton
        
        super.init(frame: .zero)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpView()
    }
    
//  MARK: - Initial View Setup
    
    private func setUpView() {
        setTitleFont()
        setCornerRadius()
        addConstraint()
        
        updateButton(keyboardButton: keyboardButton)
        
        pressButton()
    }
    
    private func setTitleFont() {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
    }
    
    private func setCornerRadius() {
        self.layer.cornerRadius = 5
    }
    
    private func addConstraint() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let multiplier = keyboardButton?.symbol == .delete || keyboardButton?.symbol == .enter ? 0.75 : 0.5
        
        NSLayoutConstraint.activate([self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: multiplier)])
    }
    
// MARK: - Update Button
    
    private func updateTitle(with text: String) {
        setTitle(text, for: .normal)
    }
    
    func updateButton(keyboardButton: KeyboardButton) {
        updateButtonBackground(symbolColor: keyboardButton.symbolColor)
        updateButtonLabel(symbol: keyboardButton.symbol)
    }
        
    private func updateButtonLabel(symbol: KeyboardSymbol) {
        switch symbol {
        case .enter:
            updateTitle(with: "Enter")
            
        case .delete:
            updateTitle(with: "<-")
            
        case .Character(let character):
            updateTitle(with: character.uppercased())
        }
    }
    
    private func updateButtonBackground(symbolColor: CheckStatus?) {
        switch symbolColor {
        case .wrongLetter:
            self.backgroundColor = .darkGray
            
        case .rightLetter:
            self.backgroundColor = .yellow
            
        case .rightFilledLetter:
            self.backgroundColor = .green
            
        default:
            self.backgroundColor = .lightGray
        }
    }

// MARK: - Action
    private func pressButton() {
        self.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    @objc private func handleButtonTap() {
        delegate?.handleButtonTap(keyboardButton.symbol)
    }
}
