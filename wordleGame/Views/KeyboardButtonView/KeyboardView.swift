//
//  KeyboardView.swift
//  wordleGame
//
//  Created by lll on 3.05.22.
//

import Foundation
import UIKit

class KeyboardView: UIStackView {
    var keyboardSymbols: [[KeyboardButton]]
    
    var delegate: KeyboardButtonDelegate?
                        
    init(keyboardSymbols: [[KeyboardButton]]) {
        self.keyboardSymbols = keyboardSymbols
        
        super.init(frame: .zero)
        
        self.setUpView()
    }
    
    required init(coder: NSCoder) {
        self.keyboardSymbols = []
            
        super.init(coder: coder)
        
        self.setUpView()
    }
    
    private func setUpView() {
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .fillEqually
        self.spacing = 6
        
        createKeyboard()
    }
    
    private func createKeyboard() {
        for row in keyboardSymbols {
        let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fill
            stackView.spacing = 6
        
        self.addArrangedSubview(stackView)
            
            for button in row {
                let keyboardButtonView = KeyboardButtonView(keyboardButton: button)
                keyboardButtonView.delegate = delegate 
                
                stackView.addArrangedSubview(keyboardButtonView)
            }
        }
    }
    
    func updateKeyboardSymbols(_ keyboardSymbols: [[KeyboardButton]]) {
        self.keyboardSymbols = keyboardSymbols
        
        self.createKeyboard()
    }
}
