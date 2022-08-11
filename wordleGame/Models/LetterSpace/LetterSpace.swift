//
//  letterSpace.swift
//  wordleGame
//
//  Created by lll on 24.04.22.
//

import Foundation

struct LetterSpace {
    let letter: String?
    var checkStatus: CheckStatus?
}
    
enum CheckStatus {
    case wrongLetter   //dark gray
    case rightLetter  //yellow
    case rightFilledLetter  //green
}
