//
//  Board.swift
//  Reversi_Trial
//
//  Created by Bartosz on 13/01/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

import Foundation
import GameplayKit

class Board: NSObject {
    
    /** Randomly set current player
    var currentPlayer: Player = Player.allPlayers[arc4random() % 2 == 0 ? 0 : 1]
    */
    var currentPlayer: Player = Player.allPlayers[0]
    
    // Initial board representation
    fileprivate var values: [[Player.StoneColor]] = [
    [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
    [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
    [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
    [.empty, .empty, .empty, .black, .white, .empty, .empty, .empty],
    [.empty, .empty, .empty, .white, .black, .empty, .empty, .empty],
    [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
    [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
    [.empty, .empty, .empty, .empty, .empty, .empty, .empty, .empty],
    ]
    
    // Get and Set methods for the table values
    subscript(x: Int, y: Int) -> Player.StoneColor {
        get {
            return values[y][x]
        }
        set {
            if values[y][x] == .empty {
                values[y][x] = newValue
            }
        }
    }
    
    // Check if the table is full
    var isFull: Bool {
        for row in values {
            for cell in row {
                if cell == .empty {
                    return false
                }
            }
        }
        return true
    }
    
}
