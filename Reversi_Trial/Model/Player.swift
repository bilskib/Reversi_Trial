//
//  Player.swift
//  Reversi_Trial
//
//  Created by Bartosz on 13/01/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

import Foundation
import GameplayKit

class Player: NSObject {
    
    enum Value: Int {
        case empty = 0
        case black
        case white
        
        var name: String {
            switch self {
            case .empty:
                return ""
            case .black:
                return "Black"
            case .white:
                return "White"
            }
        }
    }
    
    // value and name needed for the init method 
    var value: Value
    var name: String
    
    // Array with all players
    static var allPlayers = [
    Player(.black),
    Player(.white)
    ]
    
    // Return opposite player
    var opponent: Player {
        if value == .black {
            return Player.allPlayers[1]
        } else {
            return Player.allPlayers[0]
        }
    }
    
    // Init method
    init(_ value: Value) {
        self.value = value
        name = value.name
    }
}
