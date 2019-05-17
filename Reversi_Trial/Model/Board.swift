//
//  Board.swift
//  Reversi_Trial
//
//  Created by Bartosz on 13/01/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

//import Foundation
import GameplayKit

class Board: NSObject, GKGameModel {
    static var width = 8
    static var height = 8
    
    var spots = [StoneColor]()
    var currentPlayer: Player
    
    /** Randomly set current player
     var currentPlayer: Player = Player.allPlayers[arc4random() % 2 == 0 ? 0 : 1]
     */
    
    override init() {
        for _ in 0 ..< Board.width * Board.height {
            spots.append(.none)
        }
        spots[27] = .black
        spots[28] = .white
        spots[35] = .white
        spots[36] = .black
        currentPlayer = Player.allPlayers[0]
        
        super.init()
    }
}

extension Board {
    // MARK: GameplayKit required properties
    var players: [GKGameModelPlayer]? {
        return Player.allPlayers
    }
    
    var activePlayer: GKGameModelPlayer? {
        return currentPlayer
    }
    
    // MARK: GameplayKit required methods
    func setGameModel(_ gameModel: GKGameModel) {
        if let board = gameModel as? Board {
            spots = board.spots
            currentPlayer = board.currentPlayer
        }
    }
    
    func isWin(for player: GKGameModelPlayer) -> Bool {
        // TODO
        return false
    }

    func gameModelUpdates(for player: GKGameModelPlayer) -> [GKGameModelUpdate]? {
        // TODO
        return nil

    }

    func apply(_ gameModelUpdate: GKGameModelUpdate) {
        // TODO
        print("hi")
    }

    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Board()
        copy.setGameModel(self)
        return copy
    }
    
    func isFull() -> Bool {
        // TODO
        return false 
    }
}

//    var currentPlayer: Player = Player.allPlayers[0]
//
//    // Initial board representation
//    fileprivate var values: [[StoneColor]] = [
//    [.none, .none, .none, .none, .none, .none, .none, .none],
//    [.none, .none, .none, .none, .none, .none, .none, .none],
//    [.none, .none, .none, .none, .none, .none, .none, .none],
//    [.none, .none, .none, .black, .white, .none, .none, .none],
//    [.none, .none, .none, .white, .black, .none, .none, .none],
//    [.none, .none, .none, .none, .none, .none, .none, .none],
//    [.none, .none, .none, .none, .none, .none, .none, .none],
//    [.none, .none, .none, .none, .none, .none, .none, .none],
//    ]
//
//    // Get and Set methods for the table values
//    subscript(x: Int, y: Int) -> StoneColor {
//        get {
//            return values[y][x]
//        }
//        set {
//            if values[y][x] == .none {
//                values[y][x] = newValue
//            }
//        }
//    }
//
//    // Check if the table is full
//    var isFull: Bool {
//        for row in values {
//            for cell in row {
//                if cell == .none {
//                    return false
//                }
//            }
//        }
//        return true
//    }
//

