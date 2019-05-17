//
//  Strategist.swift
//  Reversi_Trial
//
//  Created by Bartosz on 17/05/2019.
//  Copyright © 2019 Bartosz Bilski. All rights reserved.
//

import GameplayKit

struct Strategist {
    
    private let strategist:
        GKMinmaxStrategist = {
        let strategist = GKMinmaxStrategist()
            
        return strategist
    }()
    
    var board: Board {
        didSet {
            strategist.gameModel = board
        }
        
    }
    
    func bestMoveForAI() -> Int? {
        return nil
    }
    
}
 
