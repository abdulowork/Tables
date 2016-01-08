//
//  SKCoin.swift
//  Nardi
//
//  Created by Timofey on 1/3/16.
//  Copyright © 2016 Timofey. All rights reserved.
//

import Foundation
import SpriteKit

class Piece: SKSpriteNode {
    
    var id = Int()
    var table = Int()
    var selected = false
    var side = String()
    

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(size: CGSize, side: String) {
        self.side = side
        if (side == "white") {
            let texture = SKTexture(imageNamed: "piece_white_normal")
            super.init(texture: texture, color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), size: size)
        }
        else {
            let texture = SKTexture(imageNamed: "piece_black_normal")
            super.init(texture: texture, color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), size: size)
        }
        
    }
    
    func set(num: Int) {
        table = num
    }
    
    func get() -> Int {
        return table
    }
}