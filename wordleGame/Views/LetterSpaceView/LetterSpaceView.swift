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

    
    init(letterSpace: LetterSpace?) {
        self.letterSpace = letterSpace
        
        super.init(frame: .zero)
        
        setUpView()
    }
        
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
        updateView(letterSpace: letterSpace)
    }

    private func createXib() {
        Bundle.main.loadNibNamed("LetterSpaceView", owner: self, options: nil)
        
        addSubview(contentView)
        
        contentView.backgroundColor = .lightGray
        layer.borderWidth = 3
        layer.borderColor = UIColor.black.cgColor
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
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
            contentView.backgroundColor = .gray
        }
    }
}
