//
//  Team.swift
//  Waston
//
//  Created by Bruno Sarmiento on 2/18/19.
//  Copyright © 2019 Akurey. All rights reserved.
//

import Foundation

class Team {
    var players = [Player]()
    var teamList: String {
        get {
            var string = "Overall: \(self.overall)\n"
            self.players.enumerated().forEach({
                string += "\($0 + 1). \($1)"
                if $0 != (self.players.count - 1) {
                    string += "\n"
                }
            })
            return string
        }
    }
    var overall: Float {
        get {
            var total = 0
            self.players.forEach({
                total += $0.overall
            })
            return Float(total) / Float(self.players.count)
        }
    }
    
    func addPlayer(_ player: Player) {
        self.players.append(player)
    }
    
    static func createTeams(withPlayers players: [Player]) -> (Team, Team) {
        let team1 = Team()
        let team2 = Team()
        if players.count % 2 == 0 {
            players.enumerated().forEach({
                if $0 % 2 == 0 {
                    if team1 < team2 {
                        team1.addPlayer($1)
                        team2.addPlayer(players[$0 + 1])
                    }
                    else {
                        team2.addPlayer($1)
                        team1.addPlayer(players[$0 + 1])
                    }
                }
            })
        }
        return (team1, team2)
    }
}

extension Team: Comparable {
    static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.overall == rhs.overall
    }
    
    static func < (lhs: Team, rhs: Team) -> Bool {
        return lhs.overall < rhs.overall
    }
}
