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
    
    static var PlayerWhite : Player = {
        return Player(side: "white")
    }()
    static var PlayerBlack : Player = {
        return Player(side: "black")
    }()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    init(size: CGSize) {
        super.init(texture: SKTexture(imageNamed: "board_frame"), color: UIColor(red: 1, green: 0, blue: 0, alpha: 1), size: size)
        self.zPosition = -0.1
    }
    
    func rollDice() -> [Int] {
        var givenMoves = [Int]()
        for _ in 0...1 {
            givenMoves.append(Int(arc4random_uniform(6) + 1))
        }
        if (givenMoves[0]==givenMoves[1]) {
            givenMoves.append(givenMoves[0])
            givenMoves.append(givenMoves[0])
        }
        return givenMoves
    }
    
    
    
//    addTable(position: CGPoint)
    
}
