//
//  letterSpaceView.swift
//  wordleGame
//
//  Created by lll on 26.04.22.
//

import Foundation
import UIKit

class LetterSpaceView: UIView {
    
    var letterSpace: LetterSpace?
        
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var labelContentView: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setUpView()
}
    
    private func  setUpView() {
        createXib()
    }

    private func createXib() {
        Bundle.main.loadNibNamed("letterSpaceView", owner: self, options: nil)
        
        addSubview(contentView)
    }
    
    func updateView(letterSpace: LetterSpace?) {
        updateBackground(checkStatus: letterSpace?.checkStatus)
        updateLabel(letter: letterSpace?.letter)
    }
    
    private func updateLabel(letter: String?) {
        labelContentView.text = letter?.uppercased()
    }
    
    private func updateBackground(checkStatus: CheckStatus?) {
        switch checkStatus {
        case .wrongLetter:
            contentView.backgroundColor = .darkGray
            
        case .rightLetter:
            contentView.backgroundColor = .yellow
            
        case .rightFilledLetter:
            contentView.backgroundColor = .green
            
        default:
            contentView.backgroundColor = .clear
        }
    }
}
