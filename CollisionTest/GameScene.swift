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
    var player = SKSpriteNode()
    var playerSpeed : CGFloat = 1000
    
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
        
        // Draw the player node
        player = SKSpriteNode(imageNamed: "player")
        player.position = CGPoint(x: 100, y: self.size.height / 2)
        player.zPosition = 1
        player.setScale(1.0)
        addChild(player)

    }
    
    // This responds to a single touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // A touch actually has many points (since a finger is large) so
        // only proceed if we can get the first touch
        guard let touch = touches.first else {
            return
        }
        
        // Get the location of the first touch
        let touchLocation = touch.location(in: self)
        
        // Get the distance between player's current position and the touch location
        let distanceToTouch = distance(from: touchLocation, to: player.position)
        
        // Get the time player should take to arrive at this destination
        let time = TimeInterval(distanceToTouch / playerSpeed)
        
        // Create the move action
        let actionMove = SKAction.move(to: touchLocation, duration: time)
        
        // Run the move action
        player.run(actionMove, withKey: "playerMoving")
    }
    
    // This determines the distance between two points using the Pythagorean Theorem
    func distance(from : CGPoint, to: CGPoint) -> CGFloat {
        
        return sqrt(pow(from.x - to.x, 2) + pow(from.y - to.y, 2))
    }
    
    
}
