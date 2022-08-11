//
//  TableViewCell.swift
//  wordleGame
//
//  Created by user on 27.05.22.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {
    
    static let id = "LeaderboardTableViewCell"
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateData(gameResult: GameResults) {
        self.usernameLabel.text = gameResult.userName
        self.scoreLabel.text = String(gameResult.attemptsNumber)
    }
}
