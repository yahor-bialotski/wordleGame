//
//  SettingsViewController.swift
//  wordleGame
//
//  Created by lll on 18.05.22.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var swichSound: UISwitch!
    @IBOutlet weak var swichLeaderboardRec: UISwitch!
    
    @IBOutlet weak var stepperButton: UIStepper!
    @IBOutlet weak var attemptsNumberField: UILabel!
    
    var minAttempsNumber: Double = 3
    var maxAttemptsNumber: Double = 6
    var selectedAttemptsNumber = UserDefaultsService.shared.getSavedAttemptsNumber(key: "attemptsNumber") ?? 5
    
    var leaderboardSwitcher: LeaderboardRecordsSwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpSwitcherPosition()
        
        stepperButton.value = Double(selectedAttemptsNumber)
        
        attemptsNumberField.text = String(Int(selectedAttemptsNumber))
    }
    
    @IBAction func pressSoundButton(_ sender: Any) {
        if swichSound.isOn {
            print("sound ON")
        }
        else {
            print("sound OFF")
        }
    }
    
    @IBAction func pressGamefieldButton(_ sender: Any) {
        if swichLeaderboardRec.isOn {
            UserDefaultsService.shared.saveRecordMode(mode: .recordsEnabled, key: "leaderboardRecords")
        }
        else {
            UserDefaultsService.shared.saveRecordMode(mode: .recordsDisabled, key: "leaderboardRecords")
        }
    }
    
    func setUpSwitcherPosition() {
        let switcherPosition = UserDefaultsService.shared.getSavedRecordMode(key: "leaderboardRecords")
        
        if let leaderboardRecordSetUp = LeaderboardRecordsSwitch(rawValue: switcherPosition!) {
            switch leaderboardRecordSetUp {
            case .recordsEnabled:
                swichLeaderboardRec.isOn = true
            case .recordsDisabled:
                swichLeaderboardRec.isOn = false
            }
        }
    }
    
    @IBAction func pressStepperButton(_ sender: UIStepper) {
        stepperButton.minimumValue = minAttempsNumber
        stepperButton.maximumValue = maxAttemptsNumber
        
        selectedAttemptsNumber = Int(stepperButton.value)
        
        attemptsNumberField.text = Int(sender.value).description
        
        UserDefaultsService.shared.saveAttemptsNumber(mode: Int(selectedAttemptsNumber), key: "attemptsNumber")
        
        print(selectedAttemptsNumber)
    }
}
