//
//  Move.swift
//  Reversi_Trial
//
//  Created by Bartosz on 17/05/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

import GameplayKit

class Move: NSObject, GKGameModelUpdate {
    
    var row: Int
    var column: Int
    
    // MARK: GameplayKit required property
    var value: Int = 0
    
    init(row: Int, column: Int) {
        self.row = row
        self.column = column
    }
}
