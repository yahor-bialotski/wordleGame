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
    
    private var gameManager = GameManager(lettersNumber: 5, attemptsNumber: 5)
    private let keyboardManager = KeyboardManager()
    
    @IBOutlet weak var gameFieldView: GameFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        keyboardContainer.delegate = self
        keyboardContainer.updateKeyboardSymbols(keyboardManager.keyboardSymbols)
        
        gameFieldView.updateGameField(gameManager.gameField)
        gameManager.gameDelegate = self
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

     func showLooseAlert() {
        let alertLooseController = UIAlertController(title: nil,
                                                message: "You loose",
                                                preferredStyle: .alert)
       
        let restartAction = UIAlertAction(title: "Try again",
                                           style: .default,
                                           handler: nil)
        
        let exitAction = UIAlertAction(title: "Main menu",
                                           style: .cancel,
                                           handler: nil)
        
        alertLooseController.addAction(restartAction)
        alertLooseController.addAction(exitAction)
        
        present(alertLooseController, animated: true)
    }
    
    private func restartGame() {
        gameManager = GameManager()
        gameFieldView.updateGameField(gameManager.gameField)
    }
}

extension GameViewController: KeyboardButtonDelegate {
    func handleButtonTap(_ symbol: KeyboardSymbol) {
        gameManager.handleKeyboardSymbolEnter(symbol)
        gameManager.gameDelegate = self
        gameFieldView.updateGameField(gameManager.gameField)
    }
}

extension GameViewController: GameDelegate {
    func handleWin() {
        showAlert(title: "You win", message: "Congratulations!")
    }
    
    func handleLoose() {
        showAlert(title: "You lose.", message: "Try once again!")
    }
    
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Restart",
                                          style: .default) { _ in
            self.restartGame()
        }
        
        let exitAction = UIAlertAction(title: "Main menu",
                                       style: .cancel) { _ in
            
            self.navigationController?.popViewController(animated: true)
        }
        
        alertController.addAction(restartAction)
        alertController.addAction(exitAction)
        
        present(alertController, animated: true)
    }
}


