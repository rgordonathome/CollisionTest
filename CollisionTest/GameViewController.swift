//
//  GameViewController.swift
//  SimpleGame
//
//  Created by Russell Gordon on 11/27/16.
//  Copyright © 2016 Russell Gordon. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad() // must call viewDidLoad() method on parent class (do not worry about what this means right now)
        let scene = GameScene(size: CGSize(width: 2048, height: 1536)) // This will create our basic scene to make a game on. We need to give a size.
        
        // Now we will configure the scene
        let skView = self.view as! SKView   // Tell SpriteKit that the current view will be the one shown to user in app
        skView.showsFPS = true              // Make sure a frames per second info text field will be shown
        skView.showsNodeCount = true        // Keep track of how many nodes (visual elements) are on screen
        // (The fewer nodes the better for performance reasons)
        skView.ignoresSiblingOrder = true   // I will explain this option later.
        scene.scaleMode = .aspectFill       // Scene will expand if necessary to fill device screen.
        skView.presentScene(scene)          // Make the view show the scene we have configured
        
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true // this ensures the status bar on the device is hidden
    }
    
}
