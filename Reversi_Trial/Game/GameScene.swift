//
//  GameScene.swift
//  Reversi_Trial
//
//  Created by Bartosz on 29/12/2018.
//  Copyright © 2018 Bartosz Bilski. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // MARK: - Properties
    var boardNode: SKSpriteNode!
    var informationLabel1: SKLabelNode!
    var informationLabel2: SKLabelNode!

    override func didMove(to view: SKView) {
        super .didMove(to: view)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)   // coordinates (0,0) map to the center of the view
        
        // tło aplikacji
        let backgroundNode = SKSpriteNode(imageNamed: "wood_background2")
        //let size = CGSize(width: 768, height: 1024)
        let size: CGSize = UIScreen.main.bounds.size    // size of a hardware display
        backgroundNode.scale(to: size)
        self.addChild(backgroundNode)
        
        let boardSize = view.frame.size.width
        boardNode = SKSpriteNode(
            texture: SKTexture(imageNamed: "board"),
            size: CGSize(width: boardSize, height: boardSize) )
        boardNode.position.y = 0
        self.addChild(boardNode)
        
        let freeSpaceSize = ((view.frame.size.height - boardSize) / 2)
        
        // miejsce nad planszą gry
        let headerNode = SKSpriteNode(
        color: UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1),
        size: CGSize(width: view.frame.size.width, height: freeSpaceSize))
        headerNode.alpha = 0.4
        headerNode.position.y = (view.frame.height / 2) - (freeSpaceSize / 2)
        self.addChild(headerNode)
        
        // miejsce pod planszą gry
        let footerNode = SKSpriteNode(
        color: UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1),
        size: CGSize(width: view.frame.size.width, height: freeSpaceSize))
        footerNode.alpha = 0.4
        footerNode.position.y = -((view.frame.height / 2) - (freeSpaceSize / 2))
        self.addChild(footerNode)
        
        // belka informacyjna 1 (góra)
        informationLabel1 = SKLabelNode(fontNamed: "Verdana")
        informationLabel1.position = headerNode.position
        informationLabel1.text = "Reversi Trial v1.0"
        addChild(informationLabel1)
        
        // belka informacyjna 2 (dół)
        informationLabel2 = SKLabelNode(fontNamed: "Verdana")
        informationLabel2.position = footerNode.position
        informationLabel2.text = "by b4rt"
        informationLabel2.verticalAlignmentMode = .top
        informationLabel2.horizontalAlignmentMode = .left
        addChild(informationLabel2)
        
        createButton()
        
        /***
        HELPERS - to be deleted later
        ***/
       
        /*
        let nodes = [boardNode, helper]
        for node in nodes {
            if node?.name == "tablica" {
                print("znalazlem tablice")
            }
        }
        */
    }
    
    func createButton() {
        let button = SKSpriteNode(color: SKColor.gray, size: CGSize(width: 100, height: 36))
        button.position.y = (informationLabel2.position.y / 2) - 180
        button.alpha = 0.8
        addChild(button)
    }
}
