//
//  Player.swift
//  Waston
//
//  Created by Bruno Sarmiento on 2/18/19.
//  Copyright © 2019 Akurey. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var overall: Int
    
    init(name: String?, overall: String?) {
        if let name = name {
            self.name = name
        }
        else {
            self.name = "Desconocido"
        }
        guard
            let overallString = overall,
            let overallInt = Int(overallString) else {
                self.overall = 0
                return
        }
        self.overall = overallInt
    }
}

extension Player: Comparable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.overall == rhs.overall
    }
    
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.overall < rhs.overall
    }
}

extension Player: CustomStringConvertible {
    var description: String {
        return "\(self.name)"
    }
}

extension CustomStringConvertible where Self: Player {
    var overallDescription: String {
        return "The overall qualification of \(self.description) is \(self.overall) PTS"
    }
}
