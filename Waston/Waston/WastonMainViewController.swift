//
//  WastonMainViewController.swift
//  Waston
//
//  Created by Bruno Sarmiento on 2/18/19.
//  Copyright © 2019 Akurey. All rights reserved.
//

import UIKit

class WastonMainViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var overallTextField: UITextField!
    @IBOutlet weak var playersTableView: UITableView!
    
    var players = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playersTableView.dataSource = self
    }
    
    @IBAction func addPlayerAction(_ sender: Any) {
        let newPlayer = Player(name: nameTextField.text, overall: overallTextField.text)
        self.players.append(newPlayer)
        self.nameTextField.text = nil
        self.overallTextField.text = nil
        self.players.sort()
        self.players.reverse()
        self.playersTableView.reloadData()
        self.nameTextField.becomeFirstResponder()
    }
    
    @IBAction func createTeamsAction(_ sender: Any) {
        let (team1, team2): (Team, Team) = Team.createTeams(withPlayers: self.players)
        let alert = UIAlertController(title: "Teams", message: team1.teamList + "\n\n" + team2.teamList, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}

extension WastonMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player = self.players[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = "\(player.overall)"
        cell.backgroundColor = player.overall > 7 ? .green : .red
        return cell
    }
}

