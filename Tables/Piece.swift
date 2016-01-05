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
    

    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(size: CGSize) {
        let texture = SKTexture()
        super.init(texture: nil, color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 1), size: size)
    }
    
    func set(num: Int) {
        table = num
    }
    
    func get() -> Int {
        return table
    }
}