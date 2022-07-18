//
//  GameResults.swift
//  wordleGame
//
//  Created by user on 25.05.22.
//

import Foundation

struct GameResults: Codable {
    let userName: String
    let attemptsNumber: Int
    let time: Int
}

enum LeaderboardRecordsSwitch: String {
    case recordsEnabled
    case recordsDisabled
}
