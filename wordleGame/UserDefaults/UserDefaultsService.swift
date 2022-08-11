//
//  UserDefaults.swift
//  wordleGame
//
//  Created by lll on 22.05.22.
//

import Foundation

class UserDefaultsService {
    private init() { }
    
    static let shared = UserDefaultsService()
    
    func saveGameResult(_ gameResult: GameResults) {
        var gameResults = getGameResults()
        gameResults.append(gameResult)
        
        guard let encodedObject = try? JSONEncoder().encode(gameResults) else {
            return
        }
        
        UserDefaults.standard.set(encodedObject, forKey: UserDefaultKeys.results.rawValue)
    }
    
    func getGameResults() -> [GameResults] {
        guard let data = UserDefaults.standard.data(forKey: UserDefaultKeys.results.rawValue),
              let decodedObject = try? JSONDecoder().decode([GameResults].self, from: data) else {
            return []
        }
        
        return decodedObject
    }
    
    enum UserDefaultKeys: String {
        case results
    }
    
    func saveRecordMode(mode: LeaderboardRecordsSwitch, key: String) {
        UserDefaults.standard.set(mode.rawValue, forKey: key)
    }
    
    func saveAttemptsNumber(mode: Int, key: String) {
        UserDefaults.standard.set(mode, forKey: key)
    }
    
    func getSavedRecordMode(key: String) -> String? {
        UserDefaults.standard.string(forKey: key)
    }
    
    func getSavedAttemptsNumber(key: String) -> Int? {
        UserDefaults.standard.integer(forKey: key)
    }
}
