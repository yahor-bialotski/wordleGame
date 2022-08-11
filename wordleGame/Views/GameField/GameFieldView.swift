//
//  GameFieldView.swift
//  wordleGame
//
//  Created by lll on 8.05.22.
//

import UIKit

class GameFieldView: UIStackView {

    var gameField: [[LetterSpace?]]
    
    init(gameField: [[LetterSpace?]]) {
        self.gameField = gameField
        
        super.init(frame: .zero)
        
        self.setUpView()
    }
    
    required init(coder: NSCoder) {
        self.gameField = []
        
        super.init(coder: coder)
        
        self.setUpView()
    }
    
    private func setUpView() {
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fillEqually
        self.spacing = 6
        
        createField()
    }
    
    private func createField() {
        for row in gameField {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .fill
            stackView.distribution = .fillEqually
            stackView.spacing = 6
            
            self.addArrangedSubview(stackView)
            
            for letter in row {
                let letterBoxView = LetterSpaceView(letterSpace: letter)
                
                stackView.addArrangedSubview(letterBoxView)
                
                letterBoxView.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([letterBoxView.widthAnchor.constraint(equalTo: letterBoxView.heightAnchor)])
            }
        }
    }
    
    func updateGameField(_ gameField: [[LetterSpace?]]) {
        self.gameField = gameField
        
        for subview in subviews {
            subview.removeFromSuperview()
        }
        
        self.createField()
    }
}
