//
//  ViewController.swift
//  wordleGame
//
//  Created by lll on 22.04.22.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var letterSpaceView: LetterSpaceView!
    @IBOutlet weak var keyboardContainer: KeyboardView!
    
    private var gameManager = GameManager(lettersNumber: 5, attemptsNumer: 5)
    private let keyboardManager = KeyboardManager()
    
    @IBOutlet weak var gameFieldView: GameFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        keyboardContainer.delegate = self
        keyboardContainer.updateKeyboardSymbols(keyboardManager.keyboardSymbols)
        
        
        gameFieldView.updateGameField(gameManager.gameField)
        
    }
    
    private func createLetterSpaceView() {
        let letterSpaceView = LetterSpaceView()
        letterSpaceView.updateView(letterSpace: nil)
        
        letterSpaceView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            letterSpaceView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            letterSpaceView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            letterSpaceView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            letterSpaceView.widthAnchor.constraint(equalTo: letterSpaceView.heightAnchor)
        ])
    }
}

extension GameViewController: KeyboardButtonDelegate {
    func handleButtonTap(_ symbol: KeyboardSymbol) {
        gameManager.handleKeyboardSymbolEnter(symbol)
        
        gameFieldView.updateGameField(gameManager.gameField)
        print(gameManager.gameField)
    }
}


