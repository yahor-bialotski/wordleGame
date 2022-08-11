//
//  CustomKeybordView.swift
//  wordleGame
//
//  Created by lll on 5.05.22.
//

import UIKit

class CustomKeyboardBoxButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            guard let color = backgroundColor else { return }
            
            UIView.animate(withDuration: self.isHighlighted ? 0 : 0.4,
                           delay: 0.0,
                           options: [.beginFromCurrentState, .allowUserInteraction],
                           animations: { self.backgroundColor = color.withAlphaComponent(self.isHighlighted ? 0.8 : 1) })
        }
    }
}
