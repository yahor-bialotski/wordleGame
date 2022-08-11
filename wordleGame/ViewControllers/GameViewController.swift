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
    
    private let keyboardManager = KeyboardManager()
    
    var selectedAttemptsNumber = UserDefaultsService.shared.getSavedAttemptsNumber(key: "attemptsNumber")
    
    var gameManager = GameManager()
    
    @IBOutlet weak var gameFieldView: GameFieldView!
    
    var swichLeaderboardRec: LeaderboardRecordsSwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gameManager = GameManager(lettersNumber: 5, attemptsNumber: selectedAttemptsNumber ?? 5)
        
        gameManager.randomiseWord()
        
        keyboardContainer.delegate = self
        keyboardContainer.updateKeyboardSymbols(keyboardManager.keyboardSymbols)
        
        gameFieldView.updateGameField(gameManager.gameField)
        gameManager.gameDelegate = self
    }
    
    // MARK: - Handle restart game & Settings
    
    func setUpRecordingMode(userName: String) {
       if let leaderboardMode = UserDefaultsService.shared.getSavedRecordMode(key: "leaderboardRecords"),
          let leaderboardRecordSetUp = LeaderboardRecordsSwitch(rawValue: leaderboardMode) {
            switch leaderboardRecordSetUp {
            case .recordsEnabled:
                gameManager.saveData(userName: userName)
            case .recordsDisabled:
                return
            }
        }
    }
    
    func restartGame() {
        gameManager = GameManager()
        gameManager.gameDelegate = self
        gameFieldView.updateGameField(gameManager.gameField)
    }
}

extension GameViewController: KeyboardButtonDelegate {
    func handleButtonTap(_ symbol: KeyboardSymbol) {
        gameManager.handleKeyboardSymbolEnter(symbol)
        gameFieldView.updateGameField(gameManager.gameField)
    }
}

extension GameViewController: GameDelegate {
    func handleWin() {
        showAlert(title: "You win", message: "Congratulations!")
    }
    
    func handleLose() {
        showAlert(title: "You lose.", message: "Try once again!")
    }
    
    // MARK: - Game ending alert
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        alertController.addTextField()
        alertController.textFields?.first?.placeholder = "Enter your name"
        
        let restartAction = UIAlertAction(title: "Restart",
                                          style: .default) { _ in
            
            let userName = alertController.textFields?.first?.text ?? "username"
            
            if userName.isEmpty {
                self.showAlert(title: title, message: message)
            } else {
                self.restartGame()
                self.setUpRecordingMode(userName: userName)
            }
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
