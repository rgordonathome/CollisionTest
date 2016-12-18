//
//  GameScene.swift
//  CollisionTest
//
//  Created by Russell Gordon on 12/18/16.
//  Copyright © 2016 Russell Gordon. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // MARK: Properties
    let tileCount : CGFloat = 8.0
    var tileSize : Int = 0
    
    override func didMove(to view: SKView) {
        
        // Set background
        backgroundColor = SKColor.black
        
        // Determine tile size
        tileSize = Int(self.size.height / tileCount)
        
        // Draw a brick wall in the middle of the screen
        for i in 1...Int(tileCount) {
            let wall = SKSpriteNode(imageNamed: "brick")
            wall.position = CGPoint(x: self.size.width / 2, y: CGFloat(tileSize / 2 + tileSize * i) )
            wall.zPosition = 1
            wall.setScale(6.0)
            addChild(wall)
        }
        

    }
    
}
