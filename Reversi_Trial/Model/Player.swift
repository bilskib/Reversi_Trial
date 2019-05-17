//
//  Player.swift
//  Reversi_Trial
//
//  Created by Bartosz on 13/01/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

//import Foundation
import GameplayKit

enum StoneColor: Int {
    case none = 0
    case white
    case black
}

class Player: NSObject, GKGameModelPlayer {
    
    var stone: StoneColor
    var color: UIImage
    var name: String
    
    // Required by GKGameModelPlayer
    var playerId: Int
    
    // Array with all players
    static var allPlayers = [
    Player(stone: .white),
    Player(stone: .black)
    ]
    
    // Return opposite player
    var opponent: Player {
        if stone == .white {
            return Player.allPlayers[1]
        } else {
            return Player.allPlayers[0]
        }
    }
    
    // Init method
    init(stone: StoneColor) {
        self.stone = stone
        
        // MARK: - GamePlayKit required properties
        self.playerId = stone.rawValue
        
        if stone == .white {
            color = UIImage(named: "White")!
            name = "White Stone"
        } else {
            color = UIImage(named: "Black")!
            name = "Black Stone"
        }
    }
}

