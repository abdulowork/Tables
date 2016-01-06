//
//  GameViewController.swift
//  Nardi
//
//  Created by Timofey on 1/3/16.
//  Copyright (c) 2016 Timofey. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let value = UIInterfaceOrientation.LandscapeLeft.rawValue
//        UIDevice.currentDevice().setValue(value, forKey: "orientation")
        
        if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = false
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .Fill
            
            scene.size = CGSize(width: 1920, height: 1080)
            
            skView.presentScene(scene)
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .Landscape
        } else {
            return .Landscape
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
