//
//  ViewController.swift
//  wordleGame
//
//  Created by lll on 22.04.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var letterSpaceView: LetterSpaceView!
    @IBOutlet weak var keyboardButton: KeyboardButtonView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        letterSpaceView.updateView(letterSpace: LetterSpace(letter: "e", checkStatus: .wrongLetter))
    }

}

