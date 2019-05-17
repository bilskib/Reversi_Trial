//
//  GameViewController.swift
//  Reversi_Trial
//
//  Created by Bartosz on 29/12/2018.
//  Copyright © 2018 Bartosz Bilski. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    // MARK: Properties
    
    var board = Board()
    var strategist: Strategist
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.view as! SKView? {
            let scene = GameScene(size: view.bounds.size)
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            // Present the scene
            view.presentScene(scene)

            view.showsFPS = true
            view.showsNodeCount = true
        }
        
        strategist = Strategist(board: board)
        resetBoard()
    }
    
    func resetBoard(){
        board = Board()
        strategist.board = board
        
//        for _ in 0 ..< board.spots.count {
//            board.spots.append(.none)
//        }
        
    }
    
    // to be reviewed init method - added automatically to silence the compilation error 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    func updateGame() {
        var gameOverTitle: String? = nil
        
        if board.isWin(for: board.currentPlayer) {
            gameOverTitle = "\(board.currentPlayer.name) Wins!"
        } else if board.isFull() {
            gameOverTitle = "Draw!"
        }
        
        if gameOverTitle != nil {
            let alert = UIAlertController(title: gameOverTitle, message: nil, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Play Again", style: .default) {
                _ in self.resetBoard()
            }
            
            alert.addAction(alertAction)
            present(alert,animated: true)
            
            return
        }
        
        board.currentPlayer = board.currentPlayer.opponent
        
        //playerLabel.text = "\(board.currentPlayer.name)'s Turn"
        
        if board.currentPlayer.stone == .black {
            processAIMove()
        }
    }
    
    func processAIMove(){
        // TODO
        
        DispatchQueue.global().async {
            [unowned self] in
            let strategistTime = CFAbsoluteTimeGetCurrent()
        }
    }

}
