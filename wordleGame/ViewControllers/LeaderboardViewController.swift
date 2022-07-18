//
//  LeaderboardViewController.swift
//  wordleGame
//
//  Created by lll on 18.05.22.
//

import UIKit

class LeaderboardViewController: UIViewController {
    @IBOutlet weak var leaderboardTableView: UITableView!
    
    private var gameResults = [GameResults]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLeaderboardTableView()
        getGameResults()
    }
    
    private func setUpLeaderboardTableView() {
        leaderboardTableView.delegate = self
        leaderboardTableView.dataSource = self
        
        leaderboardTableView.register(UINib(nibName: "LeaderboardTableViewCell", bundle: nil), forCellReuseIdentifier: LeaderboardTableViewCell.id)
    }
    
    private func getGameResults() {
        self.gameResults = UserDefaultsService.shared.getGameResults()
        
        leaderboardTableView.reloadData()
    }
}

extension LeaderboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
}

extension LeaderboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LeaderboardTableViewCell.id, for: indexPath) as? LeaderboardTableViewCell else {
            return UITableViewCell()
        }
        
        let gameResult = gameResults[indexPath.row]
        cell.updateData(gameResult: gameResult)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gameResults.count
    }
}
