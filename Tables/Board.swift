//
//  Board.swift
//  Nardi
//
//  Created by Timofey on 1/3/16.
//  Copyright © 2016 Timofey. All rights reserved.
//

import Foundation
import SpriteKit

class Board: SKSpriteNode {
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(size: CGSize) {
        super.init(texture: SKTexture(imageNamed: "board_frame"), color: UIColor(red: 1, green: 0, blue: 0, alpha: 1), size: size)
        self.zPosition = -0.1
    }
    

    
    
    
//    addTable(position: CGPoint)
    
}
