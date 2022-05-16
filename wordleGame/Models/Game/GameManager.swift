//
//  GameManager.swift
//  wordleGame
//
//  Created by lll on 7.05.22.
//

import Foundation

struct GameManager {
    private var currentLetterIndexInRow = 0
    private var currentAttemptIndex = 0
    
    private var lettersNumber: Int
    private var attemptsNumber: Int
    
    var gameField: [[LetterSpace?]]
    
    private let resultWord: String
    
    init(lettersNumber: Int = 5,
         attemptsNumer: Int = 6) {
        let row: [LetterSpace?] = Array(repeating: nil, count: lettersNumber)
        
        self.gameField = Array(repeating: row, count: attemptsNumer)
            
        self.resultWord = "world"
        
        self.lettersNumber = lettersNumber
        self.attemptsNumber = attemptsNumer
    }
    
    mutating func handleKeyboardSymbolEnter(_ symbol: KeyboardSymbol) {
        switch symbol {
        case .enter:
            checkWord()
        case .delete:
            deleteLastLetter()
        case .Character(let letter):
            addLetter(letter)
        }
    }
    
    // MARK: - Press enter
    private mutating func checkWord() {
        if currentLetterIndexInRow < lettersNumber || currentAttemptIndex >= attemptsNumber {
            
            return
        }
        
        guard let currentWord = getCurrentWord() else {
            return
        }
        
        let resultWordArray = Array(resultWord)
        
        for (index, letter) in currentWord.enumerated() {
            
            if letter == resultWordArray[index] {
                gameField[currentAttemptIndex][index]?.checkStatus = .rightFilledLetter
                
                continue
            }
            
            if resultWord.contains(letter) {
                gameField[currentAttemptIndex][index]?.checkStatus = .rightLetter
                
                continue
            }
            
            gameField[currentAttemptIndex][index]?.checkStatus = .wrongLetter
        }
        
        if currentWord == resultWord {
            gameWin()
            
            return
        }
        
        currentAttemptIndex += 1
        currentLetterIndexInRow = 0
        
        if currentAttemptIndex == attemptsNumber {
            gameOver()
        }
    }
    
    private func getCurrentWord() -> String? {
        let wordRow = gameField[currentAttemptIndex]
        
        var word = ""
        
        for letterSpace in wordRow {
            guard let letter = letterSpace?.letter else {
                return nil
            }
            
            word += letter
        }
        
        return word
    }
    
    // MARK: - Delete symbol
    
    private mutating func deleteLastLetter() {
        let previousLetterIndex = currentLetterIndexInRow - 1
        
        if previousLetterIndex < 0 {
            return
        }
        gameField[currentAttemptIndex][previousLetterIndex] = nil
        
        currentLetterIndexInRow -= 1
    }
    
    private mutating func addLetter(_ letter: String) { 
        if currentLetterIndexInRow >= lettersNumber {
            return
        }
        
        gameField[currentAttemptIndex][currentLetterIndexInRow] = LetterSpace(letter: letter, checkStatus: nil)
        
        currentLetterIndexInRow += 1
    }
    
    private func gameWin() {
        print("you win!")
    }
    
    private func gameOver() {
        print("you lose. try again")
    }
}
