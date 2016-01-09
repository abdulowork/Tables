//
//  Player.swift
//  Tables1
//
//  Created by Timofey on 1/8/16.
//  Copyright © 2016 Timofey. All rights reserved.
//

import SpriteKit

class Player {
    var side = String()
    var givenMoves = [Int]()
    
    init(side: String) {
        self.side = side
    }
    
    func hasMoreTurns() -> Bool {
        return !givenMoves.isEmpty
    }
    
    func controls(piece: Piece) -> Bool {
        return piece.side==side
    }
    
    func rollDice() -> [Int] {
        
        for _ in 0...1 {
            givenMoves.append(Int(arc4random_uniform(6) + 1))
        }
        if (givenMoves[0]==givenMoves[1]) {
            givenMoves.append(givenMoves[0])
            givenMoves.append(givenMoves[0])
        }
        return givenMoves
    }
    
    func removeFromMoves(num: Int) -> Bool {
        for var i=0; i<givenMoves.count ; i++ {
            if (givenMoves[i]==num) {
                givenMoves.removeAtIndex(i)
                return true
            }
        }
        return false
    }
}
