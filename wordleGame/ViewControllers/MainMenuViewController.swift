//
//  LeaderboardViewController.swift
//  wordleGame
//
//  Created by lll on 17.05.22.
//

import UIKit

class MainMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pressStartButton(_ sender: Any) {
        let gameViewController = UIStoryboard(name: "Main", bundle: nil)
                    .instantiateViewController(withIdentifier: "gameVC")
        
        navigationController?.pushViewController(gameViewController, animated: true)
    }
    
    @IBAction func pressLeaderBoardButton(_ sender: Any) {
        let leaderboardViewController = UIStoryboard(name: "Main", bundle: nil)
                    .instantiateViewController(withIdentifier: "leaderboardVC")
        
        navigationController?.pushViewController(leaderboardViewController, animated: true)
    }
    
    @IBAction func pressSettingsButton(_ sender: Any) {
        let settingsViewController = UIStoryboard(name: "Main", bundle: nil)
                    .instantiateViewController(withIdentifier: "settingsVC")
        
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    @IBAction func pressExitButton(_ sender: Any) {
        exit(0)
    }
}
