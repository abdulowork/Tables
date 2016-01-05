//
//  SKStack.swift
//  Nardi
//
//  Created by Timofey on 1/3/16.
//  Copyright © 2016 Timofey. All rights reserved.
//

import Foundation
import SpriteKit

class Table: SKSpriteNode {
//    var size = CGRect()

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(position: CGPoint, size: CGSize) {
        let texture = SKTexture()
        super.init(texture: texture, color: UIColor.init(red: 1, green: 1, blue: 1, alpha: 1), size: size)
        self.position = position
    }
    
}